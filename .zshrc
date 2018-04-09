setopt nonomatch
export LANG=ja_JP.UTF-8
bindkey -v

autoload -U compinit; compinit
setopt auto_param_slash
setopt print_eight_bit
setopt auto_cd

hash -d hoge=/long/path/to/hogehoge

setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

# histroy
setopt hist_ignore_all_dups
setopt hist_ignore_space
zstyle ':completion:*:default' menu select=1
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload colors
colors

# prompt
local cdir="%{$fg[yellow]%}[%d]%{$reset_color%}"
local info="%{$fg[cyan]%}%n%{$reset_color%} @ %{$fg[green]%}%m%{$reset_color%} $ "
PROMPT="$cdir
$info"
PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# aliases
alias ls='ls -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
alias lls='ls -al -F --color=auto --show-control-chars -I "NTUSER.DAT*"'

# EDITOR
export EDITOR='vim'
export VISUAL='vim'


















































































