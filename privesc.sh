#!/bin/bash
# Written by sirru5h
# A script to automate findng useful information for Linux privledge escalation and stores all results in privesc.txt
#
# 
#
#
#
#
#
#
#
echo "Found on https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/"  >> privesc.txt




echo "User enumeration if local for privledge escalation on Linux all output will be
placed in privesc.txt" >> privesc.txt

touch privesc.txt

echo "OS Type Based on Release" >> privesc.txt

cat /etc/issue >> privesc.txt
     
cat /etc/lsb-release   >> privesc.txt    
cat /etc/redhat-release  >> privesc.txt  

echo " You can also do a cat /etc/*.release"

echo "Kernel Check" >> privesc.txt

cat /proc/version >> privesc.txt 
uname -a >> privesc.txt 
uname -mrs >> privesc.txt 
rpm -q kernel >> privesc.txt 
dmesg | grep Linux >> privesc.txt 
ls /boot | grep vmlinuz- >> privesc.txt 

echo " Environment Status" >> privesc.txt

cat /etc/profile >> privesc.txt
cat /etc/bashrc >> privesc.txt
cat ~/.bash_profile >> privesc.txt
cat ~/.bashrc >> privesc.txt
cat ~/.bash_logout >> privesc.txt
env >> privesc.txt
set >> privesc.txt

echo "Printer Check"  >> privesc.txt

lpstat -a >> privesc.txt

echo "Applications and Services and their respective privledges"  >> privesc.txt

ps aux >> privesc.txt
ps -ef >> privesc.txt
top >> privesc.txt
cat /etc/services >> privesc.txt

echo " Services Running as Root"  >> privesc.txt

ps aux | grep root >> privesc.txt
ps -ef | grep root >> privesc.txt

echo " Applications Installed and Versions"  >> privesc.txt

ls -alh /usr/bin/  >>privesc.txt
ls -alh /sbin/ >>privesc.txt
dpkg -l >>privesc.txt
rpm -qa >>privesc.txt
ls -alh /var/cache/apt/archivesO >>privesc.txt
ls -alh /var/cache/yum/ >>privesc.txt
 
echo "Misconfigurations and Plug-ins attached (Maybe Vulnerable)"  >> privesc.txt

cat /etc/syslog.conf >>privesc.txt
cat /etc/chttp.conf >>privesc.txt
cat /etc/lighttpd.conf >>privesc.txt
cat /etc/cups/cupsd.conf >>privesc.txt
cat /etc/inetd.conf >>privesc.txt
cat /etc/apache2/apache2.conf >>privesc.txt
cat /etc/my.conf >>privesc.txt
cat /etc/httpd/conf/httpd.conf >>privesc.txt
cat /opt/lampp/etc/httpd.conf >>privesc.txt
ls -aRl /etc/  >>privesc.txt

echo " Scheduled Jobs"  >> privesc.txt

crontab -l >>privesc.txt
ls -alh /var/spool/cron >>privesc.txt
ls -al /etc/ | grep cron >>privesc.txt
ls -al /etc/cron* >>privesc.txt
cat /etc/cron* >>privesc.txt
cat /etc/at.allow >>privesc.txt
cat /etc/at.deny >>privesc.txt
cat /etc/cron.allow >>privesc.txt
cat /etc/cron.deny >>privesc.txt
cat /etc/crontab >>privesc.txt
cat /etc/anacrontab >>privesc.txt
cat /var/spool/cron/crontabs/root >>privesc.txt

echo " Plaintext usernames or Passwords"  >> privesc.txt

grep -i user [filename] >>privesc.txt
grep -i pass [filename] >>privesc.txt
grep -C 5 "password" [filename] >>privesc.txt
find . -name "*.php" -print0 | xargs -0 grep -i -n "var $password"  >>privesc.txt   # Joomla

echo " Networking and NICs"  >> privesc.txt

/sbin/ifconfig -a >>privesc.txt
cat /etc/network/interfaces >>privesc.txt
cat /etc/sysconfig/network >>privesc.txt

echo " Network config  Firewall DHCP DNS Server Gateway"  >> privesc.txt

cat /etc/resolv.conf >>privesc.txt
cat /etc/sysconfig/network >>privesc.txt
cat /etc/networks >>privesc.txt
iptables -L >>privesc.txt
hostname >>privesc.txt
dnsdomainname >>privesc.txt

echo " Users Hosts and other communication on Machine" >> privesc.txt

lsof -i >>privesc.txt
lsof -i :80 >>privesc.txt
grep 80 /etc/services >>privesc.txt
netstat -antup >>privesc.txt
netstat -antpx >>privesc.txt
netstat -tulpn >>privesc.txt
chkconfig --list >>privesc.txt
chkconfig --list | grep 3:on >>privesc.txt
last >>privesc.txt
w >>privesc.txt

echo "Cached IP/ MAC Addresses"  >> privesc.txt

arp -e >>privesc.txt
route >>privesc.txt
/sbin/route -nee >>privesc.txt

echo " Check manually if traffic sniffing is possible "
echo " tcpdump tcp dst Your IP 80 and tcp dst Target IP "

echo "Information on who you are and Users/SuperUsers " >> privesc.txt

id  >>privesc.txt
who >>privesc.txt
w >>privesc.txt
last >>privesc.txt
cat /etc/passwd | cut -d: -f1 >>privesc.txt    # List of users
grep -v -E "^#" /etc/passwd | awk -F: '$3 == 0 { print $1} >>privesc.txt'   # List of super users
awk -F: '($3 == "0") {print}' /etc/passwd  >>privesc.txt  # List of super users
cat /etc/sudoers >>privesc.txt
sudo -l >>privesc.txt


echo " Sensitive Files Found" >> privesc.txt

cat /etc/passwd >>privesc.txt
cat /etc/group >>privesc.txt
cat /etc/shadow >>privesc.txt
ls -alh /var/mail/ >>privesc.txt

echo " /home Files and Information" >> privesc.txt

ls -ahlR /root/ >>privesc.txt
ls -ahlR /home/ >>privesc.txt

echo "Checking for passwords in  databases scripts files or logs" >> privesc.txt

cat /var/apache2/config.inc >>privesc.txt
cat /var/lib/mysql/mysql/user.MYD >>privesc.txt
cat /root/anaconda-ks.cfg >>privesc.txt

echo " Users history " >> privesc.txt

cat ~/.bash_history >>privesc.txt
cat ~/.nano_history >>privesc.txt
cat ~/.atftp_history >>privesc.txt
cat ~/.mysql_history >>privesc.txt
cat ~/.php_history >>privesc.txt

echo "User Information" >> privesc.txt

cat ~/.bashrc >>privesc.txt
cat ~/.profile >>privesc.txt
cat /var/mail/root >>privesc.txt
cat /var/spool/mail/root >>privesc.txt

echo " Private keys located" >> privesc.txt

cat ~/.ssh/authorized_keyst >>privesc.txt
cat ~/.ssh/identity.pubt >>privesc.txt
cat ~/.ssh/identityt >>privesc.txt
cat ~/.ssh/id_rsa.pubt >>privesc.txt
cat ~/.ssh/id_rsat >>privesc.txt
cat ~/.ssh/id_dsa.pubt >>privesc.txt
cat ~/.ssh/id_dsat >>privesc.txt
cat /etc/ssh/ssh_configt >>privesc.txt
cat /etc/ssh/sshd_configt >>privesc.txt
cat /etc/ssh/ssh_host_dsa_key.pubt >>privesc.txt
cat /etc/ssh/ssh_host_dsa_keyt >>privesc.txt
cat /etc/ssh/ssh_host_rsa_key.pubt >>privesc.txt
cat /etc/ssh/ssh_host_rsa_keyt >>privesc.txt
cat /etc/ssh/ssh_host_key.pubt >>privesc.txt
cat /etc/ssh/ssh_host_keyt >>privesc.txt

echo "Filesystem Information" >> privesc.txt

ls -aRl /etc/ | awk '$1 ~ /^.*w.*/' 2>/dev/nul  >>privesc.txtl     # Anyone
ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null   >>privesc.txt     # Owner
ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null >>privesc.txt    # Group
ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null >>privesc.txt        # Other

find /etc/ -readable -type f 2>/dev/null >>privesc.txt               # Anyone
find /etc/ -readable -type f -maxdepth 1 2>/dev/null >>privesc.txt  # Anyone

echo "Checking /var/" >> privesc.txt

ls -alh /var/log >>privesc.txt
ls -alh /var/mail >>privesc.txt
ls -alh /var/spool >>privesc.txt
ls -alh /var/spool/lpd >>privesc.txt
ls -alh /var/lib/pgsql >>privesc.txt
ls -alh /var/lib/mysql >>privesc.txt
cat /var/lib/dhcp3/dhclient.leases >>privesc.txt

echo " File Setting DB Info and Hidden Files" >> privesc.txt

ls -alhR /var/www/ >>privesc.txt
ls -alhR /srv/www/htdocs/ >>privesc.txt
ls -alhR /usr/local/www/apache22/data/ >>privesc.txt
ls -alhR /opt/lampp/htdocs/ >>privesc.txt
ls -alhR /var/www/html/ >>privesc.txt

echo "Log File Checking" >> privesc.txt

cat /var/log/httpd/access.log >>privesc.txt
cat /var/log/httpd/error_log >>privesc.txt
cat /var/log/httpd/error.log >>privesc.txt
cat /var/log/lastlog >>privesc.txt
cat /var/log/lighttpd/access.log >>privesc.txt
cat /var/log/lighttpd/error.log >>privesc.txt
cat /var/log/lighttpd/lighttpd.access.log >>privesc.txt
cat /var/log/lighttpd/lighttpd.error.log >>privesc.txt
cat /var/log/messages >>privesc.txt
cat /var/log/secure >>privesc.txt
cat /var/log/syslog >>privesc.txt
cat /var/log/wtmp >>privesc.txt
cat /var/log/xferlog >>privesc.txt
cat /var/log/yum.log >>privesc.txt
cat /var/run/utmp >>privesc.txt
cat /var/webmin/miniserv.log >>privesc.txt
cat /var/www/logs/access_log >>privesc.txt
cat /var/www/logs/access.log >>privesc.txt
ls -alh /var/lib/dhcp3/ >>privesc.txt
ls -alh /var/log/postgresql/ >>privesc.txt
ls -alh /var/log/proftpd/ >>privesc.txt
ls -alh /var/log/samba/ >>privesc.txt

echo " FIle system mounted and unmounted file systems" >> privesc.txt



mount >>privesc.txt
df -h >>privesc.txt
cat /etc/fstab >>privesc.txt

echo " Advanced File commands Sticky bits SUID GUID" >> privesc.txt

find / -perm -1000 -type d 2>/dev/null  >>privesc.txt  # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
find / -perm -g=s -type f 2>/dev/null >>privesc.txt    # SGID (chmod 2000) - run as the group, not the user who started it.
find / -perm -u=s -type f 2>/dev/null >>privesc.txt    # SUID (chmod 4000) - run as the owner, not the user who started it.

find / -perm -g=s -o -perm -u=s -type f 2>/dev/null >>privesc.txt    # SGID or SUID
for i in `locate -r "bin$"`; do find $i \( -perm -4000 -o -perm -2000 \) -type f 2>/dev/null  >>privesc.txt; done    # Looks in 'common' places: /bin, /sbin, /usr/bin, /usr/sbin, /usr/local/bin, /usr/local/sbin and any other *bin, for SGID or SUID (Quicker search)

# find starting at root (/), SGID or SUID, not Symbolic links, only 3 folders deep, list with more detail and hide any errors (e.g. permission denied)
find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null  >>privesc.txt

echo "Writeable Folders" >> privesc.txt

find / -writable -type d 2>/dev/null   >>privesc.txt     # world-writeable folders
find / -perm -222 -type d 2>/dev/null   >>privesc.txt    # world-writeable folders
find / -perm -o w -type d 2>/dev/null   >>privesc.txt    # world-writeable folders

find / -perm -o x -type d 2>/dev/null  >>privesc.txt     # world-executable folders

find / \( -perm -o w -perm -o x \) -type d 2>/dev/null >>privesc.txt   # world-writeable & executable folders

echo "Development Evironments" >> privesc.txt

find / -name perl* >>privesc.txt
find / -name python* >>privesc.txt
find / -name gcc* >>privesc.txt
find / -name cc >>privesc.txt

echo "How files can be uploaded" >> privesc.txt

find / -name wget >>privesc.txt
find / -name nc* >>privesc.txt
find / -name netcat* >>privesc.txt
find / -name tftp* >>privesc.txt
find / -name ftp >>privesc.txt








echo " Trying to break out of limited commands! Uncomment the commands"
#echo" Breaking out  "
#python -c 'import pty;pty.spawn("/bin/bash")'
#echo os.system('/bin/bash')
#/bin/sh -i
















