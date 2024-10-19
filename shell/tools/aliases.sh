alias ll='ls -l -a -h -v -F --color=always'
alias tree='tree -C --dirsfirst'
alias ..='cd ..'
alias ...='cd ../..'

alias h='history | tail -n 50'

alias g='git'
alias gs='g stage'
alias gsa='gs .'
alias gu='g unstage'
alias gua='gu .'
alias gc='g commit'
alias gcm='gc -m'
alias gca='gc --amend'
alias gcam='gca -m'
alias gcan='gca --no-edit'
alias gst='g status -s'
alias gpl='g pull --rebase=true --prune --tags --verbose'
alias gpla='gpl --autostash'
alias gps='g push'
alias gpsf='g push --force-with-lease'
alias gb='g branch'
alias gbr='g branch -r'
alias gba='g branch -a'
alias gco='g checkout'
alias gf='g fetch'
alias gfa='gf --all'
alias gfap='gfa --prune'
alias gr='g rebase'
alias gh='g log --pretty=format:"%C(green)[%h]%C(reset) %<(65)%s %C(yellow)[%ad]%C(reset) %C(bold red)%an%C(reset) %C(blue)%d%C(reset)" --graph --date=format-local:"%Y-%m-%d %H:%M:%S"'
alias gha='gh --all'
alias ghs='gh -n 20'

alias v='vim'
alias grep='grep --color=auto'

alias a='. .venv/bin/activate || . .venv/Scripts/activate || . venv/bin/activate || . venv/Scripts/activate'
alias j='jupyter'
alias jlb='j lab'
alias jnb='j notebook'

alias hostfile='sudo vim /etc/hosts'
alias gip='curl https://api.ipify.org ; echo'
alias lip='ifconfig | egrep -o $IP_REGEX'

alias d='docker'
alias dls='d ps --no-trunc --format="table {{.Names}}\t{{.Status}}\t{{.Image}}\t{{.Ports}}" | (read -r; printf "%s\n" "$REPLY"; sort -k 1)'
alias dla='d ps -a --no-trunc --format="table {{.Names}}\t{{.Status}}\t{{.RunningFor}}\t{{.Size}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}" | (read -r; printf "%s\n" "$REPLY"; sort -k 1)'
alias dli='d image ls'
alias dlv='d volume ls'
alias dln='d network ls'
alias dlg='d logs'
alias dxc='d exec -i -t'

if docker compose version > /dev/null 2>&1;
then
  alias c='docker compose'
else
  # fallback to old docker-compose
  alias c='docker-compose'
fi
alias cup='c up -d'
alias cwn='c down'

alias k='kubectl'
alias kcf='k config'
alias kns='kcf set-context --current --namespace'
alias klg='k logs'
alias kap='k apply'
alias kapk='kap -k'
alias kdl='k delete'
alias kdlk='kdl -k'
alias kgt='k get'
alias kgtp='kgt pods'
alias kgtd='kgt deployments'
alias kgts='kgt services'
alias kgti='kgt ingresses'
alias kgtn='kgt namespaces'
alias kds='k describe'
alias kdsp='kds pod'
alias kdsd='kds deployment'
alias kdss='kds service'
alias kdsi='kds ingress'
alias kdsn='kds namespace'

alias utcnow='date -u "+%Y-%m-%dT%H:%M:%SZ"'
alias epochnow='python3 -c "import time;print(time.time_ns())"'

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
