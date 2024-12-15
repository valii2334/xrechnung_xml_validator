# XrechnungXmlValidator

This gem uses the Java validator from https://github.com/itplr-kosit/validator-configuration-xrechnung
in order to check that a XRechnung XML file is valid.

At this moment we check against XRechnung 3.0.2 rules released in 2024-10-31.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xrechnung_xml_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xrechnung_xml_validator

## Usage

```ruby
absolute_xml_path              = <THE LOCATION OF XRECHNUNG XML FILE>
absolute_output_directory_path = <THE OUTPUT DIRECTORY FOR THE HTML REPORT>

# The HTML report will have the following name: XML_FILE_NAME-report.html

begin
  XrechnungXmlValidator::Validate
    .new(absolute_xml_path:, absolute_output_directory_path:)
    .run!
rescue XrechnungXmlValidator::InvalidXrechnung => e
  # Provided XRechnung is not valid.
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xrechnung_xml_validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the XrechnungXmlValidator project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/xrechnung_xml_validator/blob/master/CODE_OF_CONDUCT.md).
