# LAMP Stack Using Vagrant/Puphpet

**Vagrant Box Ingredients**

Basic CentOS 6.5 vagrant box with:

- PHP 5.4
- Apache 2.4
- MySql 5.5

And:

- ImageMagick
- XDebug
- Curl
- Ruby
- Composer
- PHPMyAdmin
- Sass
- PrinceXML

**Requirements:**

1. Virtual Box 4.3
2. Vagrant 1.7.4

**Installation:**

1. Clone this repository and copy all the files (excluding README.md) in your project root directory

2. Change values,paths accordingly in puphpet/config-custom.yaml and accordingly in puphpet/files/exec-once/custom.sh as well

3. Install the plugin

   **$ vagrant plugin install vagrant-hostmanager**

4. Run **$ vagrant hostmanager** in your root directory of the project

5. Go to your project root directory in Host Operating System and run

   **$ vagrant up**
   
   and then take a tea break because it will take a while to setup for the first time :)

6. You can now access your web url e.g. http://project.dev/ in your host machine's browser.

**Default MySQL Password**

    Username: root
    Password: uraan123

PHPMyAdmin is at http://phpmyadmin.dev

NOTE: Remember to always take back up of your database prior to running "**$ vagrant destroy**"
