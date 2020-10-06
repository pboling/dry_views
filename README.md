# DryViews

ZERO LOGIC VIEWS ARE POSSIBLE!

| Project                 |  DryViews    |
|------------------------ | ----------------- |
| gem name                |  dry_views   |
| license                 |  MIT              |
| expert support          |  [![Get help on Codementor](https://cdn.codementor.io/badges/get_help_github.svg)](https://www.codementor.io/peterboling?utm_source=github&utm_medium=button&utm_term=peterboling&utm_campaign=github) |
| download rank               |  [![Total Downloads](https://img.shields.io/gem/rt/dry_views.svg)](https://rubygems.org/gems/dry_views) |
| version                 |  [![Gem Version](https://badge.fury.io/rb/dry_views.png)](http://badge.fury.io/rb/dry_views) |
| dependencies            |  [![Dependency Status](https://gemnasium.com/pboling/dry_views.png)](https://gemnasium.com/pboling/dry_views) |
| code quality            |  [![Code Climate](https://codeclimate.com/github/pboling/dry_views.png)](https://codeclimate.com/github/pboling/dry_views) |
| inline documenation     |  [![Inline docs](http://inch-ci.org/github/pboling/dry_views.png)](http://inch-ci.org/github/pboling/dry_views) |
| continuous integration  |  [![Build Status](https://secure.travis-ci.org/pboling/dry_views.png?branch=master)](https://travis-ci.org/pboling/dry_views) |
| test coverage           |  [![Coverage Status](https://coveralls.io/repos/pboling/dry_views/badge.png)](https://coveralls.io/r/pboling/dry_views) |
| homepage                |  [on Github.com][homepage] |
| documentation           |  [on Rdoc.info][documentation] |
| live chat               |  [![Join the chat at https://gitter.im/pboling/dry_views](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pboling/dry_views?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) |
| Spread ~♡ⓛⓞⓥⓔ♡~      |  [🌏](https://about.me/peter.boling), [👼](https://angel.co/peter-boling), [:shipit:](http://coderwall.com/pboling), [![Tweet Peter](https://img.shields.io/twitter/follow/galtzo.svg?style=social&label=Follow)](http://twitter.com/galtzo), [🌹](https://nationalprogressiveparty.org) |

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74
[railsbling]: http://www.railsbling.com
[peterboling]: http://www.peterboling.com
[coderbits]: https://coderbits.com/pboling
[coderwall]: http://coderwall.com/pboling
[documentation]: http://rdoc.info/github/pboling/dry_views/frames
[homepage]: https://github.com/pboling/dry_views

## Why?

* Keep the views dry with content_for_with_default and friends!
* Complete flexibility in defining defaults and overrides.
* Remove most or all logic from views.
* Allow for no content to override a default.

DryViews provides extensions to ActionView::Helpers::CaptureHelper, which is part of ActionPack:
* content_for_with_default
* no_content_for
* content_for (enhanced to play nice with the above methods)

The rails rendering chain is sort of inside out so the template rendering happens first, and this is what makes it possible to override everything! The template will ALWAYS override the layout, and a partial will always override a partial layout.

Here are some guidelines for using the code below with HAML (see the [wiki for ERB examples](https://github.com/pboling/dry_views/wiki/ERB-Usage-Example)):

    - no_content_for :key
    # Use a dash (-) not equals (=)
    # Will prevent a later content_for from rendering.  This allows template overrides of layouts.

    = content_for_with_default :key
    # Use an equal (=) not a dash (-)
    # You provide it with the default HAML via a block *or* a set of params that are the same as you would pass to a standard "render" call (i.e. :partial => 'foo', :locals => {:bar => 'bar'}).

    = content_for :key
    # Use an equal (=) not a dash (-)
    # You provide it with a block, i.e. {render :partial => 'foo'}, and it will override content_for_with_default.  It has the same precedence as no_content_for, so whichever is rendered first wins, so if a layout has either no_content_for or content_for (with or without default) the template can now override it.

## Installation

Add this line to your application's Gemfile:

    gem 'dry_views'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dry_views

## Usage

Example #1:
in a layout

    - no_content_for :breakfast                 # ARROWED!

in a template

    = content_for :breakfast do                 # WINNER!
      %h1 Dub Step

will have Dub Step

Example #2:
in a layout

    = content_for :breakfast do                 # ARROWED!
      %h1 Dub Step

in a template

    - no_content_for :breakfast                 # WINNER!

will have NOTHING

Example #3:

in a layout

    = content_for :breakfast do                 # WINNER!
      %h1 Dub Step

in a template

    = content_for :breakfast do                 # WINNER!
      %h1 Metal

will have Dub Step and Metal (Concatenation!)

Example #4:
in a layout

    = content_for_with_default :breakfast do    # ARROWED!
      %h1 Dub Step

in a template

    = content_for :breakfast do                 # WINNER!
      %h1 Metal

will have Metal only (No Dub Step!)

Example #5:

in a layout

    = content_for_with_default :breakfast do    # ARROWED!
    %h1 Dub Step

in a template

    - no_content_for :breakfast                 # WINNER!

will have NOTHING

Example #6:
in a layout

    = content_for_with_default :breakfast do    # ARROWED!
      %h1 Dub Step

in a template

    = render :partial => 'hip_hop', :layout => 'sample'
    - no_content_for :breakfast                 # ARROWED!

in the 'sample' partial layout

    - no_content_for :breakfast                 # ARROWED!

in the 'hip_hop' partial

    = content_for :breakfast do                 # WINNER!
      %h1 Hip Hop

will have Hip Hop only (No Dub Step!)

## Development

After checking out the repo, run `bin/setup` to install dependencies, and setup the test environment, including creating a role and a database. Then, run `appraisal rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Running the tests

Setup has been implemented with `bin/setup`, so review the file to see what it will do before you:

    bin/setup

Run the specs with rake:

    appraisal rake

Or, run the specs without rake:

    appraisal rspec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0][semver].
Violations of this scheme should be reported as bugs. Specifically, 
if a minor or patch version is released that breaks backward 
compatibility, a new version should be immediately released that
restores compatibility. Breaking changes to the public API will 
only be introduced with new major versions.

As a result of this policy, you can (and should) specify a 
dependency on this gem using the [Pessimistic Version Constraint][pvc] with two digits of precision. 

For example:

    spec.add_dependency 'dry_views', '~> 4.0'

[semver]: http://semver.org/
[pvc]: http://docs.rubygems.org/read/chapter/16#page74


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/pboling/dry_views/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

