# The following lines were added by compinstall
zstyle :compinstall filename '/cygdrive/c/Users/cyber/.zshrc'

#git-completion
#fpath=(~/.zsh/completion $fpath)

#zsh-completion
fpath=(~/zsh-completion/src $fpath)
#fpath=(~/zsh-completion/src:/usr/bin $fpath)

autoload -Uz compinit
compinit -u #for git-completion

# 基本設定
# ----------------------------
# 言語設定
export LANG=ja_JP.UTF-8

# エディタはvim
export EDITOR=vim

# openでいろいろ開く
alias open=cygstart
alias op=open

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# ビープ音を消す
setopt nolistbeep

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments

#del,home,endキーを有効に
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

#shiftで範囲選択可能に
bindkey "2C" set-mark-command
bindkey "2D" set-mark-command


# もしかして機能
setopt correct

# Ctrl + a とかやりたい
bindkey -e

# Ctrl + r で履歴さかのぼり
bindkey "^R" history-incremental-search-backward

# 補完機能
# ----------------------------
# 補完機能をON
#autoload -U compinit; compinit

# Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^[[Z" reverse-menu-complete

# 補完候補を省スペースに
setopt list_packed

# 補完時に大文字小文字を無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ディレクトリ名だけでcdする
setopt auto_cd

# cdの履歴を記録
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# タイポを訂正
setopt correct

# 履歴関連
# ----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 重複する履歴は無視
setopt hist_ignore_dups

# 履歴を共有
setopt share_history

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

 # ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

#履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 

# 色の設定
# ----------------------------
# 色の定義
DEFAULT=$"%{\e[0;0m%}"
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
WHITE="%{${fg[white]}%}"

autoload -Uz colors; colors
export LSCOLORS=Exfxcxdxbxegedabagacad

# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ZLS_COLORS？
export ZLS_COLORS=$LS_COLORS

# lsコマンド時、自動で色がつく
export CLICOLOR=true

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# プロンプトの設定
# ----------------------------
# Gitの情報とか
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz is-at-least

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '[%s: %b]'
zstyle ':vcs_info:*' actionformats '[%s: %b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

#  zstyle ':vcs_info:git:*' formats '[%s: %b] %c%u'
#  zstyle ':vcs_info:git:*' actionformats '[%s: %b|%a] %c%u'

if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"
  zstyle ':vcs_info:git:*' unstagedstr "-"
  zstyle ':vcs_info:git:*' formats '%c%u [%b] '
  zstyle ':vcs_info:git:*' actionformats '%c%u [%b|%a] '
fi

function _update_vcs_info_msg() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg

# コマンドを実行するときに右プロンプトを消す
setopt transient_rprompt

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

#PROMPT="%{${fg[yellow]}%}%~%{${reset_color}%} %{$fg[blue]%}$%{${reset_color}%} "
#PROMPT="%{$fg[blue]%}$%{${reset_color}%} "
PROMPT="${WINDOW:+"$WINDOW"}%{$fg[blue]%}$%{${reset_color}%} "
# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# もしかして時のプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}もしかして %B%r%b %{$fg[red]%}? [y,n,a,e]:${reset_color} "

#RPROMPT="%1(v|%F{green}%1v%f|)"
#RPROMPT=$GREEN'[%~]'$WHITE
RPROMPT="%1(v|%B%F{red}%1v%f%F{green}%C%f%b|%B%F{green}%~%f%b$WHITE)"

# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*}${PROMPT}"
;

export TERM=xterm-256color
##Title
case "${TERM}" in
kterm*|xterm*|)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}\007"
  }
  ;;
esac

# ln弄って変になっちゃったので
alias ln=/bin/ln.exe

# lsとかの設定
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls="ls -F --color=auto --show-control-char"
alias la="ls -aF"
alias ll="ls -l"
alias l="ls"
alias lla="ls -la"
alias j=jobs
alias vi=vim
alias more=less
alias le="less -iMR"
alias s-c=screen
alias zrc="source ~/.zshrc"
alias cdf="cd ~/Documents/Free"
alias cdc="cd ~/Documents"

# Global alias
alias -g L="| less"
alias -g G="| grep"


# ssh
alias wired="ssh wired"
alias magic="ssh magic"
alias z-aria='ssh -t z-aria "cd thesis/2013/B4/kojima && zsh"'
alias aria='ssh -t aria "cd thesis/2013/B4/kojima && zsh"'

alias camera1='ssh -f -N camera1;op http://localhost:15555'
alias camera2='ssh -f -N camera2;op http://localhost:16666'

$ afp-nas(){
    ssh -f -N c-nas -L 1999:192.168.1.$1:548;
    mkdir /Volumes/Public;
    mount_afp afp://localhost:1999/Public /Volumes/Public;
    open /Volumes/Public;
}
$ smb-nas(){
    ssh -f -N c-nas -L 1999:192.168.1.$1:139;
    mkdir /Volumes/Public;
    mount_smbfs //GUEST@localhost:1999/Public /Volumes/Public;
    open /Volumes/Public;
}


# git alias
alias ga='git add -A'
alias ga-='git add .'
alias gc='git commit -m'
alias go='git checkout'
alias gb='git branch'
alias gs='git status'
alias gp='git push'
alias gt="git log --graph --pretty='format:%C(yellow)%h%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset'"
alias gl='git pull'
alias g-k="startxwin >/dev/null 2>&1 ; export DISPLAY=localhost:0.0 ; gitk"
alias gd='git diff'

# other alias
alias firefox="open firefox"
alias chrome="open chrome"
alias todo="vim ~/Dropbox/Memo/todo.md"
alias memo="cd ~/Dropbox/Memo && vim . && cd -"
alias diary="cd ~/Dropbox/Diary && vim . && cd -"
alias expend="open /cygdrive/c/Users/cyber/Dropbox/Diary/expenditure.xlsx &"

export PATH=$PATH:/cygdrive/c/Windows/Microsoft.NET/Framework64/v4.0.30319
#alias csc="/cygdrive/c/Windows/Microsoft.NET/Framework64/v4.0.30319/csc.exe"


# screenのキャプション表示
#case "${TERM}" in screen)
        preexec() {
            echo -ne "\ek${1%% *}\e\\"
        }
        precmd() {
            echo -ne "\ek$(basename $(pwd))\e\\"
            #echo -ne "^[k$(basename $SHELL)^[\\"
        }
#        ;;
#esac

#echo -ne "\ekTEST\e\\"
# End of lines added by compinstall

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

