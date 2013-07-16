# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# new one, still need to tweak
#PS1="\[[\033[1;31m\]\t\[\033[m\]-\[\033[1;34m\]\u\[\033[m\]@\[\033[1;34m\]\h:\[\033[31;1m\]\W \j\[\033[m\]]\$ "

# Too long for my tastes (suddenly)
#PS1="\[[\033[1;34m\]\t\[\033[m\]-\[\033[1;34m\]\h:\[\033[34;1m\]\W \j\[\033[m\]]->"

# Shorter, easy
PS1="\[[\033[1;34m\]\t - \W \j\[\033[m\]]> "

# Mr Benavent es un crack
#xmodmap -e "remove lock = Caps_Lock"
#setxkbmap -option ctrl:nocaps

# User specific aliases and functions
alias agg_db='psql --host=mccoy --user=juan --password --dbname=aggeliopolisdb'
alias borracaca='find . | grep -e \.*~ -e *\.rej -e *\.orig | xargs rm 2>/dev/null'
alias bomnegocio.tunnel='ssh juanito@devscm.schibsted.com.br -L:8888:localhost:8888'
alias brasil.vpn_connect='ssh juanito@187.84.96.196 -L 8888:localhost:8888'
alias dame_ip_puto_mac='sudo ipconfig set en1 BOOTP ; sudo ipconfig set en1 DHCP'
alias db_pull='bzr pull bzr+ssh://code.schibstediberica.es/opt/bzr/deepblue/head'
alias db_push='bzr push bzr+ssh://code.schibstediberica.es/opt/bzr/deepblue/head'
alias demo.connect='ssh -A -X demo@scotty.schibstediberica.es'
alias demo.subito_vpn='demo.connect -R 8989:172.16.22.41:80'
alias dev.connect='ssh -A dev.schibstediberica.es -l juanito'
alias dev.connect.demo='ssh -A dev.schibstediberica.es -l demo'
alias kaneda='ssh -X kaneda.schibsted.cl'
alias l='ls -alchG'
alias ll='ls -lG'
alias makeall='make rc clean cleandir build-only rall && echo Everything cleaned up and ready!!'
alias pixeldump_all="kill -SIGALRM `ps wux | grep pixel | grep foreground | awk '{print \$2}' | sort -u | tail -1`"
alias pixeldump_closed="kill -SIGUSR1 `ps wux | grep pixel | grep foreground | awk '{print \$2}' | sort -u | tail -1`"
alias scotty.connect='ssh -A -X juanito@scotty.schibstediberica.es'
alias scotty.mount='sshfs juanito@scotty: ~/remote/scotty/ -o sshfs_sync -o reconnect -o allow_other'
alias scotty.subito_vpn='scotty.connect -R 8989:172.16.22.41:80'
alias scotty.tunnel='ssh -L 22201:localhost:22201 -L 22202:localhost:22202 -L 22203:localhost:22203 -L 22204:localhost:22204 -L 22211:localhost:22211 -L 22208:localhost:22208 -L 22202:localhost:22202 -L 22210:localhost:22210 -L 22205:localhost:22205 -L 22231:localhost:22231 -L 22225:localhost:22225 -L 22203:localhost:22203 -L 22241:localhost:22241 -L 22243:localhost:22243 -L 22260:localhost:22260 juanito@dev.schibstediberica.es -A -q'
alias spock.connect='ssh -X -A spock'
alias ssh_berniaga='ssh javier@112.215.6.250 -p 27012'
alias ssh_bruce='ssh juanito@91.183.60.190'
alias ssh_subito='ssh juan.arias@172.16.22.36'
alias ssh_tori='ssh 94.246.113.75'
alias time='/usr/bin/time -v'
alias transcommands="ls -la daemons/trans/ | grep trans_ | cut -d. -f1 |  sed -rne 's/.*trans_//p'"
alias worf.connect='ssh -A -X juanito@worf.schibstediberica.net'
alias worf.mount='sshfs juanito@worf: ~/remote/worf/ -o sshfs_sync -o reconnect -o allow_other'
alias ayosdito.pixel='ssh root@192.168.1.36'
alias ayosdito.trans='ssh padmin@192.168.1.19'

