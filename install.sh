sudo apt install -y curl gnome-core gnome-tweaks snapd gnome-clocks openjdk-17-jdk nodejs npm libavcodec-extra vlc flatpak fastboot adb filezilla fonts-recommended ibus-unikey timeshift firewall-config git gh gstreamer1.0-vaapi intel-media-va-driver-non-free network-manager-openvpn-gnome menulibre unrar clamav clamtk xserver-xorg-video-intel- i965-va-driver-shaders libvirt-clients gnome-boxes firefox-esr- chromium- epiphany-browser-
##install brave 
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
##Add flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
##Make network-manager manages the wifi
sudo sed -i '11,14s/^/#/' /etc/network/interfaces
#fixing hidpi gnome login screen and touchpad
sudo tee /usr/share/glib-2.0/schemas/99_hidpi.gschema.override << EOF
[org.gnome.desktop.interface]
text-scaling-factor=1.5
cursor-size=38
[org.gnome.desktop.peripherals.touchpad]
tap-to-click=true
EOF
# Compile the schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
#add vscodium gpg key
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
#Add the repository
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
#install vscodium
sudo apt update && sudo apt install codium
