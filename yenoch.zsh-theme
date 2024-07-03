local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
local path_p="${blue_op}%{$fg[green]%}%~${blue_cp}"
local user_host="${blue_op}%{$fg[cyan]%}%n@%m${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
local hist_no="${blue_op}%{$fg[yellow]%}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"

# Conda info
local conda_info='$(conda_prompt_info)'
conda_prompt_info() {
  if [ -n "$CONDA_DEFAULT_ENV" ]; then
    echo -n " %{$fg[yellow]%}($CONDA_DEFAULT_ENV)%{$reset_color%}"
  fi
}

PROMPT="╭─${user_host}─${path_p}─${ret_status}─${hist_no}
╰─${blue_op}${smiley}${blue_cp}-${conda_info} %# "
local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "
