# Use zsh-native %F/%f color sequences consistently (no %{...%} / $fg / $reset_color)
local blue_op="%F{blue}["
local blue_cp="%F{blue}]%f"
local path_p="${blue_op}%F{#33FF33}%~${blue_cp}"
local user_host="${blue_op}%F{#99FFFF}%n@%m${blue_cp}"
local ret_status="${blue_op}%?${blue_cp}"
local hist_no="${blue_op}%F{yellow}%h${blue_cp}"

# Success/Fail indicator
local smiley='%(?,%F{green}:)%f,%F{red}:(%f)'

[[ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ]] && export VIRTUAL_ENV_DISABLE_PROMPT=1
local env_prompt='$(env_prompt_info)'
env_prompt_info() {
    # Conda info
    if [ -n "$CONDA_DEFAULT_ENV" ]
    then
        print -nr -- "%F{#FF6600}(${CONDA_DEFAULT_ENV})%f-"
    # Virtualenv info
    elif [ -n "$VIRTUAL_ENV_PROMPT" ]
    then
        VIRTUAL_ENV_NAME=${VIRTUAL_ENV_PROMPT}
        print -nr -- "%F{#FF6600}(${VIRTUAL_ENV_PROMPT})%f-"
    else
        echo -n ""
    fi
}


# Two-line prompt; force color reset at line ends to prevent leakage during completion
PROMPT="╭─${user_host}─${path_p}─${ret_status}─${hist_no}%f%k
╰─${blue_op}${smiley}${blue_cp}-${env_prompt}> %f%k"

# Continuation prompt; also reset
local cur_cmd="%F{blue}%_%f"
PROMPT2="${cur_cmd}> %f%k"