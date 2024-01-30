# Source git prompt
source ~/.git-prompt.sh

# Custom prompt
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " on (%s)")'; PS1='\n\[\e[38;5;136m\][\u\[\e[38;5;106m\]:\[\e[0m\]\h\[\e[38;5;136m\]]\[\e[38;5;160;1m\]${PS1_CMD1}\n\[\e[0m\](\[\e[38;5;184m\]\W\[\e[0m\])\$ '

# Alias
alias vim=nvim
export EDITOR=nvim

alias l="ls -l"
alias la="ls -la"
alias ls="ls --color=auto"

# Git
gitclone () {
  git clone git@github.com:$1 $2
}

gitbclone () {
  git clone git@bitbucket.org:$1 $2
}

alias g="git"
alias gs="g status"
alias ga="git add"
alias gaa="git add ."
alias gclone="gitclone"
alias gbclone="gitbclone"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="g push"
alias gf="g fetch"
alias gm="git merge"
alias gch="git checkout"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit"
alias gd="git diff"

# Tmux

# Function to start or connect to a tmux session in a specific directory
project() {
    local project_name="$1"

    if [ -z "$project_name" ]; then
        echo "Usage: project <project_name>"
        return 1
    fi

    local session_name="$project_name"
    local project_dir="$HOME/software/$project_name"

    # Check if the tmux session is already running
    if tmux has-session -t "$session_name" 2>/dev/null; then
        tmux attach-session -t "$session_name"
    else
        # Check if the project directory exists
        if [ ! -d "$project_dir" ]; then
            echo "Project directory $project_dir does not exist"
            return 1
        fi

        # Start a new tmux session in the specified directory
        tmux new-session -s "$session_name" -c "$project_dir"
    fi
}

alias tn="tmux new -s"
alias tl="tmux ls"
alias ta="tmux attach -t"

alias tree="tree --gitignore"

# Lazy source config
alias reload="source ~/.bashrc"

export GPG_TTY=$(tty)

# PATH
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/Users/safalneupane/go/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
