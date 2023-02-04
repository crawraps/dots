typeset -U path PATH

export ZVM_INIT_MODE='sourcing'
export XDG_CURRENT_DESKTOP=sway

path=($HOME/.local/bin/ $path)
path=(/home/kareem/.local/share/applications/apache-maven-3.8.7/bin $path)

export PATH

# Secret keys
export MV_NPM_DEPS_TOKEN="glpat-TCmA29fJkTo2zV_yT5dX"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

