# LAMP Stack Using Vagrant/Puppet

Prerequisites:

1. Virtual Box
2. Vagrant 1.7.4

This vagrant project is based on CentOS 6.5 Box and helps in setting up a full LAMP stack

1. Clone this repo and copy all the files (excluding README.md) in your project root directory

2. Change values accordingly in puphpet/config-custom.yaml

3. In the Host Operating system's 'hosts' file, add a line with the IP address of the guest machine (check 'private_network' key in puphpet/config.yaml) and all vhosts you choose 

   Example:

    - 192.168.56.101 project.dev
    - 192.168.56.101 phpmyadmin.dev

4. Go to your project root directory in Host Operating System and run

   **> vagrant up**
   
   and then take a tea break because it will take a while to setup for the first time :)

5. You can now browse the given vhost in your Host machine's browser such as http://phpmyadmin.dev


