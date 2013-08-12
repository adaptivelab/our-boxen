class people::benjackson {

  include bash
  include bash::completion
  include iterm2::dev
  include sublime_text_2
  include font::source-code-pro

  include benjackson::osx-settings
  include benjackson::git-config
  include benjackson::dotfiles
  include benjackson::sublime-preferences
  include benjackson::iterm2-preferences

}
