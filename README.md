# RuboCop::ConfigurationCleaner

`.rubocop.yml` cleaner.

It cleans cop configuration if it is the same as the default.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-configuration_cleaner'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubocop-configuration_cleaner

## Usage

```bash
# It displays cleaned `.rubocop.yml`.
$ rubocop-configuration_cleaner path/to/.rubocop.yml

# Write cleaned .rubocop.yml to the given path.
$ rubocop-configuration_cleaner path/to/.rubocop.yml --write

# Preview the diff
$ rubocop-configuration_cleaner path/to/.rubocop.yml --diff
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/rubocop-configuration_cleaner.

