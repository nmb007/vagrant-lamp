# LAMP Stack Using Vagrant/Puphpet

**Vagrant Box Ingredients:**

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
2. Vagrant >= 1.6.0 (but preferably 1.7.4)

**Installation:**

1. Clone this repository and copy all the files (excluding README.md) in your project root directory

2. Change values and paths accordingly in `puphpet/config-custom.yaml` and accordingly in `puphpet/files/exec-once/custom.sh` as well

3. Install the plugin (If you have already installed in your system, then ignore this step)

   ```bash
   vagrant plugin install vagrant-hostmanager
   ```

4. Go to your project root directory in your host operating system and run
   ```bash
   vagrant up
   ```
   and then take a :coffee: break because it will take a while to setup for the first time :)

5. Run the following command in your root directory of the project (It has to be run only on the first initial vagrant up or in the case when you do vagrant destroy and then vagrant up, you need to execute this command again)
   ```bash
    vagrant hostmanager
    ```
6. You can now access your web url e.g. http://project.dev/ in your host machine's browser.

7. Not so fast, before you dive into the coding stuff, do remember to first run the following command in your project root directroy on Host Operating system and keep it running
  ```bash
   vagrant rsync-auto
  ```
It will watch your project directory for any change, if found, it will automatically synchronize and applies it to the guest machine as well

**Default MySQL Credentials**
```bash
Username: root
Password: uraan123
```

PHPMyAdmin is at http://phpmyadmin.dev

**NOTES:** 

1. Remember to always take back up of your database prior to running `vagrant destroy`

2. Always run migrations and other framework specific shell utilities like yiic, zf from the guest machine
