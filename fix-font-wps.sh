cd ~/Desktop/
rm -rf wps-fonts
git clone https://github.com/udoyen/wps-fonts
sudo rm -rf /usr/share/fonts/kingsoft 
sudo mkdir /usr/share/fonts/kingsoft
sudo cp -r wps-fonts/wps/* /usr/share/fonts/kingsoft
sudo chown -R $USER:$USER /usr/share/fonts/kingsoft
sudo chmod -R o+rw,g+rw /usr/share/fonts/kingsoft
sudo fc-cache -vfs
