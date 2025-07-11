LC_ALL=en_US.UTF-8
# Autoload .nvmrc
export NVM_AUTO_USE=true

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  rails
  ruby
  git
  nvm
  docker
  docker-compose
  asdf
)

source $ZSH/oh-my-zsh.sh

# Antigen setup start

source ~/source/dotfiles/antigen.zsh

export NVM_AUTO_USE=true
antigen bundle lukechilds/zsh-nvm

antigen bundle Tarrasch/zsh-autoenv

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# Antigen setup end

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/snap/bin:$PATH"

_not_inside_tmux() {
  [[ -z "$TMUX" ]]
}

_not_inside_emacs() {
    [[ -z "$INSIDE_EMACS"  ]]
}

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

if _not_inside_emacs; then
    ensure_tmux_is_running;
fi



# https://coderwall.com/p/oaaqwq/pbcopy-on-ubuntu-linux
alias pbcopy="xclip -sel clip"
fpath=(~/.zsh/completions ~/.oh-my-zsh/plugins/rails ~/.oh-my-zsh/plugins/git ~/.oh-my-zsh/functions ~/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/vendor-functions /usr/share/zsh/vendor-completions /usr/share/zsh/functions/Calendar /usr/share/zsh/functions/Chpwd /usr/share/zsh/functions/Completion /usr/share/zsh/functions/Completion/AIX /usr/share/zsh/functions/Completion/BSD /usr/share/zsh/functions/Completion/Base /usr/share/zsh/functions/Completion/Cygwin /usr/share/zsh/functions/Completion/Darwin /usr/share/zsh/functions/Completion/Debian /usr/share/zsh/functions/Completion/Linux /usr/share/zsh/functions/Completion/Mandriva /usr/share/zsh/functions/Completion/Redhat /usr/share/zsh/functions/Completion/Solaris /usr/share/zsh/functions/Completion/Unix /usr/share/zsh/functions/Completion/X /usr/share/zsh/functions/Completion/Zsh /usr/share/zsh/functions/Completion/openSUSE /usr/share/zsh/functions/Exceptions /usr/share/zsh/functions/MIME /usr/share/zsh/functions/Math /usr/share/zsh/functions/Misc /usr/share/zsh/functions/Newuser /usr/share/zsh/functions/Prompts /usr/share/zsh/functions/TCP /usr/share/zsh/functions/VCS_Info /usr/share/zsh/functions/VCS_Info/Backends /usr/share/zsh/functions/Zftp /usr/share/zsh/functions/Zle /usr/share/zsh/$ZSH_VERSION/functions/)
autoload -U compinit && compinit
# eval alias git=hub

# For "agnoster" zsh theme
prompt_context(){} # Hides username

# To access Yarn globally installed packages
export PATH="$HOME/.yarn/bin:$PATH"

export EDITOR=vim
source ~/.zsh/completions/tmuxinator.zsh

export YVM_DIR="$HOME/.yvm"
# [ -r $YVM_DIR/yvm.sh ] && source $YVM_DIR/yvm.sh

# # LinuxBrew https://docs.brew.sh/Homebrew-on-Linux
export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
export PATH="$HOME/.deno/bin:$PATH"


# Linuxbrew auto copmletion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

export PATH="$HOME/.pyenv/versions/3.7.2/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

alias rubocop_on_modified='git ls-files -m | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs bundle exec rubocop'
alias super_clear="clear && printf '\e[3J]'"
alias sc="super_clear"
stty -ixon

alias open_pr='gh pr view -w'

# Wasmer
export WASMER_DIR="/home/kartikey/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# Dokku https://dokku.com/docs/deployment/remote-commands/
alias dokku='bash $HOME/bin/dokku/contrib/dokku_client.sh'

alias python='/usr/bin/python3.8'

alias hrcp='heroku run rails c -r production'
alias hrcs='heroku run rails c -r staging'
alias hls='heroku logs -t -d web -r staging'
alias hlp='heroku logs -t -d web -r production'

alias us="nordvpn c us"
alias n="nordvpn status"
alias nd="nordvpn d"

# bun completions
[ -s "/home/kartikey/.bun/_bun" ] && source "/home/kartikey/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# https://nicolaiarocci.com/git-worktree-vs-git-savepoints/
# git config --global alias.wip '!git add -u && git commit -m "WIP"'
alias gawip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias gwip='git add -u && git commit -m "--wip-- [skip ci]"'
# wip short. only adds the files which are added
alias gwips='git commit -m "--wip-- [skip ci]"'
alias ocw='overmind c web'
alias ocwo='overmind c worker'
alias rdc='bin/rails dev:cache'
alias kamalc='bin/kamal app exec -i "bin/rails c"'
alias repo='gh repo view -w'
alias bkc='bin/kamal console'

alias claude="~/.claude/local/claude"
alias c="claude"
alias ccc="claude -c"
