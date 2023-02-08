# .zshrc 加上：  
#        source ~/zshConfig.sh

# 系統
alias es="exec $SHELL"

# brew
alias bu="brew update && brew upgrade && brew cleanup && brew doctor"
alias buc="brew update && brew upgrade --cask --greedy"

# golang
alias gof="go fmt ./..."
alias gov="go vet ./..."
alias gor="go run ."
alias gomt="go mod tidy"
alias gomi="go mod init"
alias gofvmt="go mod tidy && go fmt ./... && go vet ./..."

# git
alias gp="git push"
alias gl="git pull"
alias gc="git checkout"
alias gcm="git checkout master"
alias gcr="git checkout release"
alias gcd="git checkout develop"
alias gcj="git checkout jeff"
alias gcb="git checkout -b"
alias gcf="git checkout -f"
alias gcam="git commit -am"
alias gb="git branch"
alias gba="git branch -a"
alias ga="git add"
alias gm="git merge"
alias gs="git status"
alias gca="git checkout alex"
alias grv="git remote -v"
alias gma="git merge origin/alex"
alias grom="git rebase origin/master"

# docker
alias dc="docker compose"
alias dp="docker ps"

# laradock
alias dcw="cd ~/Code/ge/myLaradock && docker compose exec workspace bash"
alias dcd="cd ~/Code/ge/myLaradock && docker compose down"
alias dcu="cd ~/Code/ge/myLaradock && docker compose up -d"

# php多版本
alias php73="/usr/local/opt/php@7.3/bin/php"
alias pecl73="/usr/local/opt/php@7.3/bin/pecl"
alias composer73="/usr/local/opt/php@7.3/bin/php /usr/local/bin/composer"
alias php74="/usr/local/opt/php@7.4/bin/php"
alias pecl74="/usr/local/opt/php@7.4/bin/pecl"
alias composer74="/usr/local/opt/php@7.4/bin/php /usr/local/bin/composer"
alias php80="/usr/local/opt/php@8.0/bin/php"
alias pecl80="/usr/local/opt/php@8.0/bin/pecl"
alias composer80="/usr/local/opt/php@8.0/bin/php /usr/local/bin/composer"

function gcp() {
	git commit -am $1 && git push -u origin "$(git rev-parse --abbrev-ref HEAD)"
}

function rebuild() {
    git pull && echo '' >> readme.md && git commit -am 'rebuild' && git push &&
    git tag $1 && git push origin $1
}

function gt () {
    git tag $1 && git push origin $1
}

function polling () {
    while true
    do
        date +"%H:%M:%S"
        curl https://min-api.cryptocompare.com/data/price\?fsym=$1\&tsyms=USD
        sleep $2
        echo "\n"
    done
}


# 程式資料夾捷徑
alias phpstorm="/usr/local/bin/phpstorm"
alias goland="/usr/local/bin/goland"
alias datagrip="/usr/local/bin/datagrip"
alias webstorm="/usr/local/bin/webstorm"

alias btc="curl https://min-api.cryptocompare.com/data/price\?fsym=BTC\&tsyms=USD"
alias eth="curl https://min-api.cryptocompare.com/data/price\?fsym=ETH\&tsyms=USD"

alias pa="php artisan"

alias s="cd $DOTFILES/private/sshAlias && sh"
