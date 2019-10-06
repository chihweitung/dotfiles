# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.mozbuild/moz-phab:$PATH
export PATH=$HOME/.mozbuild/arcanist/bin:$HOME/.mozbuild/clang/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/opt/nss/bin:/usr/local/opt/ruby/bin:/usr/local/opt/unzip/bin:/usr/local/opt/qt/bin:$PATH
export PATH=/usr/local/lib/ruby/gems/2.6.0/bin:$PATH
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH
export PATH=/usr/local/opt/libarchive/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tomtung/.oh-my-zsh"

export ICECC_HOST="10.238.24.17"
export USE_SCHEDULER=$ICECC_HOST
export MOZCONFIG=/Users/tomtung/Work/mozilla-central/mozconfig
export OPENSSL_STATIC=yes
export CCACHE_PREFIX=icecc
export CCACHE_COMPRESS=""

# llvm
export LDFLAGS="-L/usr/local/opt/libffi/lib -L/usr/local/opt/llvm@7/lib -Wl,-rpath,/usr/local/opt/llvm@7/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/libarchive/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/libarchive/lib/pkgconfig"
export CPPFLAGS="-I/usr/local/opt/llvm@7/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/libarchive/include"

alias idb_log="export MOZ_LOG=IndexedDB:5"
alias idb_disable="export MOZ_LOG=IndexedDB:0"
alias loadnvm=". $(brew --prefix nvm)/nvm.sh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  mercurial
)
functions[prompt_hg]=""

source $HOME/.bashrc
source $HOME/.bash_profile
source $HOME/.profile
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#setopt PROMPT_SUBST
#source ~/Setting/hg/scm_prompt.sh
#export PS1='$(_scm_prompt)$USER@%m:%~%% '

unsetopt inc_append_history
unsetopt share_history

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

alias mc="/Users/tomtung/Work/mozilla-central"
alias grep="grep -E"
alias ssh_server_ip="ssh shes050117@10.238.24.17 -p 5566 -X"

fflog () {
  args
    : @required string test
    : string filter
  echo ${test}
  echo ${filter}
  if [ ${test} != "" && ${filter} == "" ]; then
    ./mach test ${test} 2&>1 | grep -e "\[TT\]"
  elif [ ${test} != "" && ${filter} != "" ]; then
    ./mach test ${test} 2>&1 | grep -e ${filter}
  else
    echo "Invalid input"
  fi
}

fpath+=~/.zfunc
fpath=(~/.zsh-completions $fpath)

# The end line of zshrc, somehow it seems bashcompinit needs to be added at the
# end of zshrc
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
source /Users/tomtung/Work/mozilla-central/python/mach/bash-completion.sh
