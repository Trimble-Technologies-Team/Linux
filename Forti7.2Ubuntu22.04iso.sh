#! /usr/bin/env bash

# FortiCliet new way with other issues

wget -O - https://repo.fortinet.com/repo/forticlient/7.2/ubuntu/DEB-GPG-KEY | gpg --dearmor | sudo tee /usr/share/keyrings/repo.fortinet.com.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/repo.fortinet.com.gpg] https://repo.fortinet.com/repo/forticlient/7.2/ubuntu/ /stable multiverse" | sudo tee /etc/apt/sources.list.d/repo.fortinet.com.list
sudo apt-get update
sudo apt install forticlient

# configure forticlient
/opt/forticlient/epctrl -r usdayt-ems01.trimble.com -p 8013

# Function to delete the script file
delete_script() {
  script_path=$(readlink -f "$0")
  rm "$script_path"
  echo "Script deleted."
}

# Set a trap to call delete_script function upon normal exit or error
trap delete_script EXIT

# Your script's logic goes here
echo "Sleeping a bit"
sleep 5
echo "Script execution completed successfully."
