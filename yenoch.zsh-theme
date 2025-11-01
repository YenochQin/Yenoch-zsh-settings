local blue_op="%{$fg[blue]%}[%{$reset_color%}"
local blue_cp="%{$fg[blue]%}]%{$reset_color%}"
local orange="%F{#FF6600}"
local path_p="${blue_op}%{%F{#33FF33}%}%~${blue_cp}"
local user_host="${blue_op}%{%F{#99FFFF}%}%n@%m${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
local hist_no="${blue_op}%{$fg[yellow]%}%h${blue_cp}"
local smiley="%(?,%{$fg[green]%}:%)%{$reset_color%},%{$fg[red]%}:(%{$reset_color%})"

# Conda info
conda_info='$(conda_prompt_info)'
conda_prompt_info() {
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then
    echo -n " %{${orange}%}($CONDA_DEFAULT_ENV)%{$reset_color%}"
  fi
}

# uv/venv info（仅在激活 venv 且项目树中存在 uv.lock 时显示）
venv_info='$(venv_prompt_info)'
venv_prompt_info() {
  if [[ -n "$VIRTUAL_ENV_PROMPT" ]]; then
    echo -n " %{${orange}%}(${VIRTUAL_ENV_PROMPT})%{$reset_color%}"
  fi
}

PROMPT="╭─${user_host}─${path_p}─${ret_status}─${hist_no}
╰─${blue_op}${smiley}${blue_cp}-${conda_info}${venv_info} %# "
local cur_cmd="${blue_op}%_${blue_cp}"
PROMPT2="${cur_cmd}> "