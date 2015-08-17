# LAMP Stack Using Vagrant

This vagrant project is based on CentOS 6.5 Box and helps in setting up a full LAMP stack

Just clone this repo and copy all the files in your project directory and run

**$ vagrant up**

and then take a tea break because it will take a while to setup for the first time :)

Also don't forget to Add a line with the IP address of the guest machine (check 'private_network' key in puphpet/config.yaml) and all vhosts you choose in the Host Operating system 'hosts' file.

Example:

- 192.168.56.101 porsche.dev
- 192.168.56.101 phpmyadmin.dev


