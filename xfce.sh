sudo apt install -y adb filezilla libxfce4ui-utils thunar xfce4-panel gnome-themes-extra \
	xfce4-pulseaudio-plugin blueman gnome-disk-utility xfce4-session xfce4-settings \
	fonts-recommended xfconf xfdesktop4 xfwm4 thunar-volman xfce4-notifyd \
	xfce4-power-manager mousepad ristretto thunar-archive-plugin vlc atril \
	xfce4-clipman-plugin ibus-unikey gammastep timeshift git gh nodejs \
	xfce4-screenshooter xfce4-taskmanager xfce4-terminal xfce4-whiskermenu-plugin \
	thunderbird flatpak gstreamer1.0-vaapi intel-media-va-driver-non-free \
	network-manager-gnome i965-va-driver-shaders \
	network-manager-openvpn-gnome firewall-config menulibre \
	libavcodec-extra slick-greeter firefox-esr unrar \
 	gvfs-backends papirus-icon-theme clamav clamtk xserver-xorg-video-intel-
##Add flathub repo
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
##Make network-manager manages the wifi
sudo sed -i '11,14s/^/#/' /etc/network/interfaces
#add vscodium gpg key
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
#Add the repository
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
#install vscodium
sudo apt update && sudo apt install codium