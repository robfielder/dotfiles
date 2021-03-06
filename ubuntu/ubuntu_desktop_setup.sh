#!/bin/bash
echo "Get the basics"
# apt-get -y update   # Is this overkill at this step?
# This lets us just add ppas
sudo apt-get -y install software-properties-common python-software-properties

#hurry and load apt-fast
sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install -y apt-fast 

echo "Add PPAs"
sudo add-apt-repository -y ppa:texworks
sudo add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable

sudo add-apt-repository -y ppa:tualatrix/ppa
sudo add-apt-repository -y ppa:nginx/stable 
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo add-apt-repository -y ppa:chris-lea/redis-server
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2
sudo add-apt-repository -y ppa:nvbn-rm/ppa
sudo add-apt-repository -y ppa:conscioususer/polly-daily
sudo add-apt-repository -y ppa:yorba/ppa
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily
sudo add-apt-repository -y ppa:cooperjona/lightread

#pgadmin 1.16
sudo apt-add-repository -y ppa:voronov84/andreyv

echo "Updating Repos"
sudo apt-get update

echo "Installing packages"
#system tweaks
sudo apt-fast install -y preload ubuntu-tweak indicator-multiload conky gdebi

#Dev Tools
#postgres
bash <(curl -s https://raw.github.com/pgexperts/add-pgdg-apt-repo/master/add-pgdg-apt-repo.sh)

sudo apt-fast install -y libpq-dev postgresql-9.3 postgresql-contrib-9.3 pgadmin3 libpq-dev

sudo apt-fast install -y nginx nodejs sublime-text
sudo apt-fast install -y redis-server
#apt-fast install -y mono-complete monodevelop meld
sudo apt-fast install -y meld

#media
sudo apt-fast install -y vlc vlc-plugin-pulse mozilla-plugin-vlc
sudo apt-fast install -y openshot #video editor

#misc
sudo apt-fast install -y filezilla everpad polly
sudo apt-fast install -y shotwell curl nautilus-open-terminal
sudo apt-fast install -y lightread pidgin
sudo apt-fast install -y chromium-browser
sudo apt-fast install -y p7zip-rar p7zip-full dos2unix

sudo apt-get install gufw #firewall

#testing
#sudo add-apt-repository ppa:atareao/atareao
#sudo apt-get install my-weather-indicator


echo "make sure mysql is toast"
sudo update-rc.d mysql remove
sudo update-rc.d apache2 remove

echo "rvm time"
sudo apt-fast install -y git-core curl build-essential zlib1g-dev libreadline-dev libssl-dev libxml2-dev git-gui git-doc
#bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
sudo apt-fast install -y openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion

curl -L https://get.rvm.io | bash -s stable --ruby
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc
source ~/.bashrc


#Comment out the lens you don't want to kill
sudo apt-get remove -y unity-lens-shopping
sudo apt-get autoremove unity-lens-shopping
sudo apt-get autoremove unity-lens-music
sudo apt-get autoremove unity-lens-photos
sudo apt-get autoremove unity-lens-gwibber
sudo apt-get autoremove unity-lens-video

#show all startup apps in startup applications
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

#normal scrolling
sudo gsettings set com.canonical.desktop.interface scrollbar-mode normal

# move the x - []  icons to the right side
#sudo gconftool-2 --set /apps/metacity/general/button_layout --type string menu:minimize,maximize,close

#if you need some  virtualization love
#https://help.ubuntu.com/community/VMware/Tools
#sudo apt-get install -y open-vm-tools


echo "clean up"
sudo apt-get autoclean

echo "horray!"
exit 0

#Items to be added
#facebook

#stormcloud   -- I think this is just stuck in the Ubuntu Store
