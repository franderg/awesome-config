-- Spawn a composoting manager
awful.util.spawn("compton --backend glx --xrender-sync --xrender-sync-fence --vsync opengl-swc --paint-on-overlay", false)

-- Start idempotent commands
local execute = {
   "~/.config/awesome/bin/xsettingsd-setup",
   -- Start PulseAudio
   "pulseaudio --check || pulseaudio -D",
   "udisks-glue -p /run/user/$(id -u)/udisks-glue.pid",
   "xset -b",	-- Disable bell
   -- Enable numlock
   --"numlockx on",
   -- Replace caps-lock with ctrl
   "setxkbmap -option ctrl:nocaps",
   -- Default browser
   "xdg-mime default " .. config.browser .. ".desktop " ..
      "x-scheme-handler/http " ..
      "x-scheme-handler/https " ..
      "text/html",
   -- Default MIME types
   "xdg-mime default evince.desktop application/pdf",
   "xdg-mime default gpicview.desktop image/png image/x-apple-ios-png image/jpeg image/jpg image/gif"
}

os.execute(table.concat(execute, ";"))

-- Spawn various X programs
xrun("polkit-gnome-authentication-agent-1",
     "/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1")
-- xrun("pidgin", "pidgin -n")
xrun("NetworkManager Applet", "nm-applet")

