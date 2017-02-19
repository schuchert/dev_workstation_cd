bash 'Set key bindings' do
  code <<-EOH
    gsettings set org.gnome.desktop.screensaver lock-enabled false
    gsettings set org.gnome.desktop.session idle-delay 0
    gsettings set org.gnome.desktop.screensaver ubuntu-lock-on-suspend false
    gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver ''
    gsettings set org.gnome.desktop.wm.keybindings begin-move ['']
  EOH
end

