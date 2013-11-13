set -e

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name and stuff (as done via System Preferences → Sharing)
scutil --set ComputerName "edWorkBookAir"
scutil --set HostName "eadmundo.work"
scutil --set LocalHostName "eadmundo"
defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "eadmundo.work"

# Set standby delay to 24 hours (default is 1 hour)
pmset -a standbydelay 86400

# Disable the sound effects on boot
nvram SystemAudioVolume=" "

# Reveal IP address, hostname, OS version, etc. when clicking the clock
# in the login window
defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Enable access for assistive devices
echo -n 'a' | tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
chmod 444 /private/var/db/.AccessibilityAPIEnabled
# TODO: avoid GUI password prompt somehow (http://apple.stackexchange.com/q/60476/4408)
#osascript -e 'tell application "System Events" to set UI elements enabled to true'

###############################################################################
# Screen                                                                      #
###############################################################################

# Enable HiDPI display modes (requires restart)
defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Enable the MacBook Air SuperDrive on any Mac
nvram boot-args="mbasd=1"


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Add iOS Simulator to Launchpad
ln -sf /Applications/Xcode.app/Contents/Applications/iPhone\ Simulator.app /Applications/iOS\ Simulator.app


###############################################################################
# Spotlight                                                                   #
###############################################################################

# Hide Spotlight tray-icon (and subsequent helper)
#chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `mdutil -i off "/Volumes/foo"` to stop indexing any volume.
defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Load new settings before rebuilding the index
killall mds || true
# Make sure indexing is enabled for the main volume
mdutil -i on /
# Rebuild the index from scratch
mdutil -E /
