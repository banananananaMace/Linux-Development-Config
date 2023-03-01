# Setup fzf
# ---------
if [[ ! "$PATH" == */home/xudefu/.vim/plugin/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/xudefu/.vim/plugin/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/xudefu/.vim/plugin/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/xudefu/.vim/plugin/fzf/shell/key-bindings.bash"
