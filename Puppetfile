# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

# Everyone
github "osx",               "1.0.0"
github "java",              "1.1.2"
github "python",            "1.1.1"
github "virtualbox",        "1.0.1"
github "vagrant",           "2.0.9"
github "dropbox",           "1.1.0"
github "heroku",            "2.0.0"
github "skype",             "1.0.2"
github "hipchat",           "1.0.8", :repo => "adaptivelab/puppet-hipchat"
github "btsync",            "1.0.0", :repo => "adaptivelab/puppet-btsync"
github "git-flow",          "0.2.0", :repo => "adaptivelab/puppet-git-flow"
github "sonos",             "1.0.2"

# People
github "firefox",           "1.0.5"
github "phantomjs",         "2.0.2"
github "rdio",              "1.0.0"
github "chrome",            "1.1.1"
github "vim",               "1.0.5"
github "zsh",               "1.0.0"
github "iterm2",            "1.0.3"
github "sublime_text_2",    "1.1.2"
github "redis",             "1.0.0"
github "mongodb",           "1.0.0"
github "sysctl",            "1.0.0"
github "postgresql",        "1.0.2"
github "harvest",           "1.0.1"
github "sourcetree",        "0.0.4"
github "arduino",           "1.0.1", :repo => "steeeve/puppet-arduino"
github "pcre",              "1.0.0"
github "pkgconfig",         "1.0.0"
github "swig",              "1.0.0"
github "graphviz",          "1.0.0"
github "shiftit",           "0.0.2"
github "slate",             "1.0.0"
github "induction",         "1.0.0"
github "mou",               "1.0.0"
github "kindle",            "1.0.1"
github "macvim",            "1.0.0"
github "tmux",              "1.0.2"
github "spotify",           "1.0.1"
github "adium",             "1.1.1"
github "vlc",               "1.0.3"
github "alfred",            "1.1.2"
github "bash",              "1.1.0"
github "font",              "1.0.3", :repo => "adaptivelab/puppet-font"
github "foreman",           "1.0.0"
github "opera",             "0.2.0"
github "spectacle",         "1.0.0"
github "onepassword",       "1.0.2"
github "caffeine",          "1.0.0"
