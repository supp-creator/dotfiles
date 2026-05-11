#!/bin/bash

sudo rm -rf /opt/jdk-25 
sudo rm -rf /usr/local/bin/java
sudo rm -rf /usr/local/bin/javac
sed -i '/JAVA_HOME/d' ~/.bashrc
sed -i '/jdk-25/d' ~/.bashrc

sudo rm -rf /opt/idea-IU 
sudo rm /usr/local/bin/idea

rm ~/.local/share/applications/jetbrainsd.desktop

rm -rf ~/.config/JetBrains/  
rm -rf ~/.cache/JetBrains/ 
rm -rf ~/.local/share/JetBrains/ 


