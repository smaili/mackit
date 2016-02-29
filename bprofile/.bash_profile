#
#    /$$$$$$$                      /$$
#   | $$__  $$                    | $$
#   | $$  \ $$  /$$$$$$   /$$$$$$$| $$$$$$$
#   | $$$$$$$  |____  $$ /$$_____/| $$__  $$
#   | $$__  $$  /$$$$$$$|  $$$$$$ | $$  \ $$
#   | $$  \ $$ /$$__  $$ \____  $$| $$  | $$
#   | $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$  | $$
#   |_______/  \_______/|_______/ |__/  |__/
#
#           Bash Profile
#
#     This is the main bash config for MacOS.
#
#     Place this file in your home:
#     /Users/michael/
#


#* PATHS
#
# http://www.twam.info/software/tune-terminal-in-os-x-lion
#
#-------------------------------------------------- */
PATH=$PATH:/usr/local/sbin



#* SSH
#-------------------------------------------------- */
alias sshl='more ~/.bash_profile | grep "cd " | grep -v "sshl" | cut -d " " -f 2 | cut -d "=" -f 1'
alias ssh_heartedu_prod='ssh heartedu_16 -t "cd /srv/www/heartedu; bash --login"'
alias ssh_lt30_prod='ssh lt30_227 -t "cd /srv/www/lt30.com; bash --login"'
alias ssh_smaili_prod='ssh smaili_227 -t "cd /srv/www/smaili.org; bash --login"'



#* Node/NPM
#-------------------------------------------------- */
alias npmi='sudo npm install --save'
alias npmig='sudo npm install -g --save'
alias npmu='sudo npm update'
alias npml='sudo npm list'
alias npmc='sudo npm outdated'
alias npmr='sudo npm uninstall'



#* Ruby/Rails
#-------------------------------------------------- */
alias rhelp='/Users/michael/rhelp.sh'



#* Nginx
#-------------------------------------------------- */
alias start_nginx='sudo nginx'
alias stop_nginx='sudo nginx -s stop'



#* uWSGI
#-------------------------------------------------- */
alias start_uwsgi='sudo uwsgi --daemonize --die-on-term --pidfile /usr/local/var/run/uwsgi.pid --ini /usr/local/etc/uwsgi/emperor.ini'
alias stop_uwsgi='sudo uwsgi --stop /usr/local/var/run/uwsgi.pid'



#* MYSQL
#-------------------------------------------------- */
alias start_mysql='mysql.server start'
alias stop_mysql='mysql.server stop'
alias tail_mysql='tail -f /usr/local/var/log/mysql/query.log'



#* Cassandra
#
# requires: ln -sfv /usr/local/opt/cassandra/*.plist ~/Library/LaunchAgents
#
#-------------------------------------------------- */
alias start_cassandra='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'
alias stop_cassandra='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.cassandra.plist'



#* RabbitMQ
#
# requires: ln -sfv /usr/local/opt/rabbitmq/*.plist ~/Library/LaunchAgents
#
#-------------------------------------------------- */
alias start_rabbitmq='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'
alias stop_rabbitmq='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist'



#* Memcached
#
# requires: ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
#
#-------------------------------------------------- */
alias start_memcached='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
alias stop_memcached='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'



#* PostgreSQL
#
# requires: ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
#
#-------------------------------------------------- */
alias start_postgres='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias stop_postgres='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'



#* Haproxy
#-------------------------------------------------- */
alias start_haproxy='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias stop_haproxy='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'



#* DNS
#-------------------------------------------------- */
alias start_dns_heartedu='sudo sh -c "echo '\''127.0.0.1 heartedu.com'\'' >> /private/etc/hosts"'
alias start_dns_eduimg='sudo sh -c "echo '\''127.0.0.1 eduimg.com'\'' >> /private/etc/hosts"'

alias stop_dns_heartedu='sudo sh -c "sed -e '\''/heartedu.com/d'\'' /private/etc/hosts > /private/etc/hosts_"'
alias stop_dns_heartedu='sudo sh -c "sed -e '\''/eduimg.com/d'\'' /private/etc/hosts > /private/etc/hosts_"'

alias replace_dns='sudo mv /private/etc/hosts_ /private/etc/hosts'
alias restart_dns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'



#* GoAgent
#-------------------------------------------------- */
alias start_goagent='sudo python /Applications/_/goagent/local/proxy.py'
alias start_goagent_='sudo python /Applications/_/goagent_/local/proxy.py'
alias stop_goagent='ps -ef | grep goagent | grep -v grep | awk '\''{ print $2 }'\'' | xargs sudo kill -15'



#* WIFI
#-------------------------------------------------- */
alias start_wifi='networksetup -setairportpower airport on'
alias stop_wifi='networksetup -setairportpower airport off'



#* Finder
#-------------------------------------------------- */
alias restart_finder='sudo killall -KILL Finder'



#* MISC
#-------------------------------------------------- */
alias ll='ls -alG'
alias vim='open -a /Applications/_/MacVim/MacVim.app'
alias del_ds='sudo find / -name '\''.DS_Store'\'' -type f -delete'
alias start_ds='(crontab -l ; echo "*/10 * * * * sudo find / -name '\''.DS_Store'\'' -type f -delete") | crontab -'
alias reverse='tail -r' # for Linux: reverse() { tac "$1" | more; }
alias ggrep='__ggrep() { sudo grep -rHn "$1" . | grep -v node_modules | grep -v listing.csv ${@:2}; }; __ggrep'
alias igrep='__igrep() { sudo grep -rHin "$1" . | grep -v node_modules | grep -v listing.csv ${@:2}; }; __igrep'
alias lrg='sudo du -a / | sort -nr | head -n 20'
alias wwget=' wget -q -b -t 100 -T 10 -U "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36"'
alias start_web='stop_nginx; stop_mysql; start_nginx; start_mysql'



#* ENV
#-------------------------------------------------- */
HISTSIZE=9999
HISTFILESIZE=9999
HISTCONTROL=ignoredups
# export PATH=$PATH:/Applications/eclipse/adt-bundle-mac/sdk/tools



#* OpenCV
#-------------------------------------------------- */
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH
