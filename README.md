# [ondrejsika.com](http://ondrejsika.com)

My website based on Jekyll and hosted by GitHub pages

## Setup Repository

```
git clone git@github.com/ondrejsika/ondrejsika.com.git
cd ondrejsika.com
./link-git-hooks.sh
```

## Development

### Prerequisites

You need Ruby 3.x or newer (Jekyll 4.4 doesn't work with the old system Ruby on macOS). Install it with Homebrew and add it to your `PATH`:

```
brew install ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

### Install dependencies

```
bundle install
```

Gems are installed into `./vendor/bundle`.

### Run development server

```
bundle exec jekyll serve
```

or use the helper script (binds to all interfaces):

```
sh serve.sh
```

The site runs on <http://127.0.0.1:4000> and rebuilds automatically on changes.

### Build

Build the site into the `_site` directory:

```
bundle exec jekyll build
```

## Pernament pages

- `/c/` - my basic contact page
