#!/usr/local/bin/bash
# shellcheck disable=SC2039,SC2112

function dbgvar () {
  if [ "$#" -ne 1 ] || [ -z "$1" ] ; then
    printf "Print the variable NAME and it's value each wrapped with single-quotes.\n"
    printf "Usage: %s NAME.\n" "${FUNCNAME[0]} "
    return 1
  fi
  printf "\'%s\': \'%s\'\n" "$1" "${!1}"
}

function dbgopt () {
  if [ "$#" -ne 1 ] || [ -z "$1" ] ; then
    printf "Print the option NAME.\n"
    printf "Usage: %s NAME.\n" "${FUNCNAME[0]} "
    return 1
  fi
  shopt "$1"
}

# User
printf "<---->\n"
printf " User\n"
printf "<---->\n"
dbgvar USER
dbgvar UID
dbgvar HOME
dbgvar HOSTNAME
dbgvar LC_ALL
printf "\n"

# Operating System
printf "<---------------->\n"
printf " Operating System\n"
printf "<---------------->\n"
dbgvar OSTYPE
dbgvar HOSTTYPE
dbgvar MACHTYPE
printf "\n"

# Bash
printf "<---->\n"
printf " Bash\n"
printf "<---->\n"
dbgvar BASH
dbgvar BASH_VERSINFO
dbgvar BASH_VERSION
dbgvar BASH_COMPAT
dbgopt compat31
dbgopt compat32
dbgopt compat40
dbgopt compat41
dbgopt compat42
dbgopt compat43
dbgopt compat44
printf "\n"

# 6.3.2 Is this Shell Interactive?
printf "<----------------------------------->\n"
printf " Is this shell an: Interactive Shell?\n"
printf "<----------------------------------->\n\n"
dbgvar PS1
printf "\n"
if [ -z "$PS1" ]; then
  printf "This shell is not interactive.\n"
else
  printf "This shell is interactive.\n"
fi
printf "\n"

# 4.3.2 The Shopt Builtin
printf "<--------------------------------->\n"
printf " Is this shell a: Login Shell?\n"
printf " ('on' means yes. 'off' means no.)\n"
printf "<--------------------------------->\n\n"
dbgopt login_shell
printf "\n"
