# Note. This works for ubuntu 20.04, Kernel 5

# Uninstall old versions. Older versions of Docker were called docker, docker.io, or docker-engine. If these are installed, uninstall them
sudo apt-get remove docker docker-engine docker.io containerd runc

# Uninstall new versions
sudo apt purge docker-ce docker-ce-cli containerd.io -y

# Set up the repository. Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y

# Add Docker’s official GPG key:
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine. Update the apt package index, and install the latest version of Docker Engine and containerd, or go to the next step to install a specific version

# Update the repo again
sudo apt-get update -y

# Install docker
sudo apt install docker.io -y

# Add the docker group if it doesn't already exist:
sudo groupadd docker

# Add the connected user "${USER}" to the docker group:
sudo gpasswd -a ${USER} docker

# Restart the Docker daemon:
sudo service docker restart

# Enable docker at boot time
sudo systemctl enable --now docker

# Sleep baby sleep
sleep 5


# ------------------ Docker compose steps ------------------------

# Run this command to download the current stable release of Docker Compose:
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary:
sudo chmod +x /usr/local/bin/docker-compose
