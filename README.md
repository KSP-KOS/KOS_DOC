![Sauce](source/images/sauce.png?raw=true)

## Overview

[Middleman](http://middlemanapp.com/) template with Haml, Compass, and CoffeeScript.
Comes ready with IE conditional classes, HTML5Shiv, body classes, jQuery (official
CDN), LiveReload, and pretty URLs.


## Installing / Updating

    # Clone the repo as a Middleman template
    git clone git@github.com:nikiliu/sauce.git ~/.middleman/sauce

    # Update to latest version
    cd ~/.middleman/sauce/; git pull


## Usage

    # Scaffold a project using Sauce
    middleman init [my_project] --template=sauce

    # Optionally remove default README and Git repository
    cd ~/.middleman/sauce/; rm -rf README .git/

    # Fire up a local development server (LiveReload equipped)
    bundle exec middleman server

    # Build a production-ready version of your app
    bundle exec middleman build


## File Structure

    |_ source/
    |  |_ images/
    |  |  |_ sauce.png             # Sauce logo
    |  |
    |  |_ javascripts/
    |  |  |_ shared/               # For any CoffeeScript classes, etc.
    |  |  |_ vendor/               # For any third-party plugins
    |  |  |
    |  |  |_ _main.coffee          # Main JavaScript functionality
    |  |  |_ application.coffee    # Imports all scripts
    |  |
    |  |_ layouts/
    |  |  |_ _doctype.haml         # Partial containing DOCTYPE and IE conditional classes
    |  |  |_ _icons.haml           # Partial containing application icons
    |  |  |_ _meta.haml            # Partial containing meta tags
    |  |  |_ main.haml             # Main layout
    |  |
    |  |_ stylesheets/
    |  |  |_ shared/
    |  |  |  |_ _colors.scss       # Color definitions
    |  |  |  |_ _fonts.scss        # Font definitions
    |  |  |  |_ _ie.scss           # IE styles
    |  |  |  |_ _media.scss        # Media queries
    |  |  |  |_ _mixins.scss       # Custom mixins
    |  |  |  |_ _variables.scss    # General variables
    |  |  |
    |  |  |_ vendor/
    |  |  |  |_ normalize.css      # Normalize
    |  |  |
    |  |  |_ _main.scss            # Main app styles
    |  |  |_ application.scss      # Imports Compass and all stylesheets
    |  |
    |  |_ favicon.ico              # Sauce favicon
    |  |_ index.haml               # Homepage
    |
    |_ .gitignore                  # Git ignore
    |_ config.rb                   # Middleman configuration
    |_ Gemfile                     # Dependencies
    |_ Gemfile.lock                # Last verified dependencies
    |_ Rakefile                    # Rake tasks
    |_ README.md                   # This README


## Adding New Pages

To create a new page, simply create a new `.haml` file in the `source/` directory. The
default `index.haml` begins with the following lines:

    ---
    title:   Welcome to Sauce
    layout:  main
    classes: home
    ---

`title` gets translated directly to the `<title>` tag in the layout, `layout` selects
which layout to use for the page, and `classes` is a list of classes, separated by a
space, the `<body>` tag will have.

Sauce utilizes Middleman's pretty URL plugin, which will convert every new page file to
have its own pretty URL. Example: `newpage.haml` can be seen at `/newpage`.


## Publishing to gh-pages

Sauce includes [middleman-gh-pages](https://github.com/neo/middleman-gh-pages). If not using
a custom CNAME, uncomment the relevant lines in `config.rb` before publishing.

    # Publish a build to the gh-pages branch on GitHub
    bundle exec rake publish
