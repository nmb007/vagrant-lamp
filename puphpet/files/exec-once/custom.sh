# This line is required as a stub code if any custom apache module is compiled
echo "#LoadModule dummy_module /usr/lib/apache2/modules/mod_dummy.so" >> /etc/httpd/conf/httpd.conf

# Compile and Install mod_xsendfile module in apache
sudo apxs -cia /var/www/project/puphpet/files/dot/mod_xsendfile.c

# Replacing the incorrect line added by the previous command with correct one
sudo sed -i '47 c\ LoadModule xsendfile_module   /usr/lib64/httpd/modules/mod_xsendfile.so' /etc/httpd/conf/httpd.conf

# Restart Apache
sudo /sbin/service httpd restart

# Replace prefilled placeholder '## XSEND' in Virtual Host with the following statement
sudo sed -i "s/## XSEND/XSendFile On \\r\\n XSendFilePath \/var\/www\/project\/files/" /etc/httpd/conf.d/25-av_nvjebw8jor9g.conf

# Restart Apache
sudo /sbin/service httpd restart

# Installing Prince XML
sudo rpm -i http://www.princexml.com/download/prince-9.0-5.centos60.x86_64.rpm
