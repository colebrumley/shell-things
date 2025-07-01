#!/bin/zsh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

zstyle ':omz:update' mode auto      # update automatically without asking

ZSH_PYENV_QUIET=true

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git pyenv)

source $ZSH/oh-my-zsh.sh

# If zsh-autosuggestions is installed, use it
[[ -f "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "${BREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

add_to_path "/Applications/ARX-3.9.1.app/Contents/bin"

SERVICES_REPO_LOCATION=~/lib/cypress-services

alias push-services-to-sandbox="rsync -avz --progress --exclude='.git' "$SERVICES_REPO_LOCATION" test-gen-sandbox:~/cypress-services"

alias pull-services-from-sandbox="rsync -avz --progress --exclude='.git' test-gen-sandbox:~/cypress-services/ "$SERVICES_REPO_LOCATION"/"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/cole/.cache/lm-studio/bin"
# End of LM Studio CLI section


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cole/Documents/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/cole/Documents/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cole/Documents/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/cole/Documents/lib/google-cloud-sdk/completion.zsh.inc'; fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
