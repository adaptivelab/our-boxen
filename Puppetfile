# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.6.1"

# Support for default hiera data in modules

github "module-data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.0.100"
github "git",         "2.3.1"
github "go",          "1.1.0"
github "homebrew",    "1.9.2"
github "hub",         "1.3.0"
github "inifile",     "1.0.3", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.7.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.0.3"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# Dependencies
github "autoconf",          "1.0.0"
github "pcre",              "1.0.0"
github "pkgconfig",         "1.0.0"
github "sysctl",            "1.0.1"

# Everyone
github "osx",               "1.0.0"
github "java",              "1.1.2"
github "python",            "1.1.1"
github "virtualbox",        "1.0.1"
github "vagrant",           "3.0.0"
github "dropbox",           "1.1.0"
github "heroku",            "2.0.0"
github "skype",             "1.0.2"
github "git-flow",          "0.2.0", :repo => "adaptivelab/puppet-git-flow"
github "sonos",             "1.0.3"

# People
github "firefox",           "1.2.0"
github "rdio",              "1.0.0"
github "chrome",            "1.1.2"
github "vim",               "1.0.5"
github "zsh",               "1.0.0"
github "iterm2",            "1.0.9"
github "sublime_text_2",    "1.1.2"
github "redis",             "1.0.0"
github "mongodb",           "1.0.0"
github "postgresql",        "3.0.1"
github "harvest",           "1.0.2"
github "sourcetree",        "1.0.0"
github "swig",              "1.0.0"
github "slate",             "1.0.0"
github "kindle",            "1.0.1"
github "macvim",            "1.0.0"
github "tmux",              "1.0.2"
github "spotify",           "1.0.1"
github "adium",             "1.3.0"
github "vlc",               "1.0.5"
github "alfred",            "1.1.8"
github "bash",              "1.1.0"
github "font",              "1.0.3", :repo => "adaptivelab/puppet-font"
github "opera",             "0.3.2"
github "spectacle",         "1.0.0"
github "onepassword",       "1.1.0"
github "caffeine",          "1.0.0"
github "textmate",          "1.1.0"
github "flux",              "1.0.0"
github "cyberduck",         "1.0.1"
