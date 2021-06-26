alias ls='ls --color=auto'
alias ip='ip --color=auto'

# The bash process identifier
BASH_PID=$(echo $$)

# Returns the exit code of last process executed
function last_process_status {
  echo $?
}

# counts how many process are currently running in the system
function process_running {
  ps -uax | grep -v "grep" --count
}

# The command prompt
PS1='\[\033[1;36m\[[\d \@]\[\033[0;31m\] \[\033[0;31m\]\u\[\033[0m\] at box \[\033[0;31m\]\h\[\033[0m\] is in \[\033[0;31m\]\W\[\033[0m\].\nExit: \[\033[0;32m\]\[`last_process_status`\]\[\033[0m\] Running: \[\033[0;32m\]\[`process_running`\]\[\033[0m\] Bash PID: \[\033[0;32m\]\[$BASH_PID\]\[\033[0m\] Executed: \[\033[0;32m\]\#\[\033[0m\]\n\$ '

# Does not store to history commands that begin with whitespace
HISTCONTROL=ignorespace

export PS1
