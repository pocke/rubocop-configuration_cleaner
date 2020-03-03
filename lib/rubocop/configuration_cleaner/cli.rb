module RuboCop
  module ConfigurationCleaner
    class CLI
      def initialize(argv)
        @argv = argv
        @params = {}
      end

      attr_reader :params
      private :params

      def run
        parse_option!

        target_configs.each do |path|
          config = YAML.load(path.read)
          default = default_configuration(requires(config))
          needless_cops = config.map do |cop_name, values|
            next unless values.is_a? Hash
            next unless cop_name.include?('/')

            cop_config = default[cop_name]
            next unless values.all? { |key, config_val| cop_config[key] == config_val }

            cop_name
          end.compact

          needless_re = Regexp.new("^(?:#{needless_cops.join('|')}):")
          removing = false
          content = path.read.lines.reject do |line|
            if removing
              if line.match?(/^\S/)
                removing = false
              else
                true
              end
            else
              if line.match?(needless_re)
                removing = true
              else
                false
              end
            end
          end.join

          case
          when params[:write]
            path.write content
          when params[:diff]
            Tempfile.create do |f|
              f.write content
              f.flush
              system("git", "diff", "--no-index", "--", path.to_s, f.path)
            end
          else
            puts content
          end
        end
      end

      private def target_configs
        paths = @argv.empty? ? ['.rubocop.yml'] : @argv
        paths.map { |path| Pathname(path).expand_path }
      end

      private def default_configuration(requires)
        config_str = `rubocop --force-default-config --show-cops #{requires.map { |r| "-r #{r}" }.join(' ')}`
        YAML.load(config_str)
      end

      private def requires(config)
        Array(config['require'])
      end

      private def parse_option!
        opt = OptionParser.new
        opt.on('--write')
        opt.on('--diff')
        opt.parse! into: @params
      end
    end
  end
end
