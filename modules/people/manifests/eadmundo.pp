class people::eadmundo {

  include bash
  include bash::completion
  include iterm2::dev
  include sublime_text_2
  include font::source-code-pro
  include alfred
  include spectacle
  include caffeine
  include chrome
  include firefox
  include adium
  
  package {
    [
      'openconnect'
     ]:
   }
   
  include osx::finder::unhide_library
  include osx::dock::clear_dock
  include osx::dock::hide_indicator_lights
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_key_press_and_hold
  include osx::disable_app_quarantine
  include osx::no_network_dsstores

}
