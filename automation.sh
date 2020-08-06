echo updating system this should take few minutes
sleep 5
sudo apt update -y && apt upgrade -y 
echo installing Git
sleep 5
sudo apt install git -y
echo created /ots folder
sleep 5
mkdir /ots
cd /ots
echo Downloading ModernOts
sleep 5
git clone https://github.com/GoalTV/ModernOts.git
echo entering source
sleep 5
cd /ots/ModernOts/source
echo installing required packages
sleep 5
sudo apt install libboost1.71-dev liblua5.1-0-dev liblua50 liblua50-dev liblualib50 liblualib50-dev lua50 libsqlite0 libsqlite0-dev libsqlite3-0 libsqlite3-dev sqlite3 lua5.1 libgmp3-dev subversion make g++ libxml2 libxml2-dev libxml++2.6-dev mariadb-client mariadb-common mariadb-server gcc cpp automake autoconf pkg-config libboost1.71-all-dev libmysqlclient-dev screen -y
echo configuring source
sleep 5
./autogen.sh && ./configure --enable-mysql --enable-server-diag
sed -i 's/  -lxml2$/ -lxml2 -lpthread/' Makefile
echo Source complain this should take few minutes
sleep 5
make
mv theforgottenserver /ots/ModernOts/
cd /ots/ModernOts/
ls 
echo if you see theforgottenserver this means installation has been successful
echo -
echo importing MySQL Database!
sleep 5
cd /ots/ModernOts/schemas/
mysql -u root < MySQL.sql
sleep 2
echo congrats! if you have follow the setup you can now edit config.lua for MySQL details.
echo you can start server with command ./theforgottenserver
echo to keep server alive use command:
echo screen ./theforgottenserver
echo after disconnection you can return to server by command
echo screen -r
echo -
echo server is located in /ots/ModernOts/
echo-
echo MySQL Password setup
sleep 5
mysql_secure_installation
echo -
echo Completed Bye!
cd /ots/ModernOts/
