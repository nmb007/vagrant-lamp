# LAMP Stack Using Vagrant

Prerequisites:

1. Virtual Box
2. Vagrant 1.7.4

This vagrant project is based on CentOS 6.5 Box and helps in setting up a full LAMP stack

1. Clone this repo and copy all the files in your project root directory
2. Change values accordingly in puphpet/config-custom.yaml
3. Add a line with the IP address of the guest machine (check 'private_network' key in puphpet/config.yaml) and all vhosts you choose, in the Host Operating system 'hosts' file.

Example:

- 192.168.56.101 porsche.dev
- 192.168.56.101 phpmyadmin.dev

4. Go to your project root directory in Host Operating System and run

**$ vagrant up**

and then take a tea break because it will take a while to setup for the first time :)




