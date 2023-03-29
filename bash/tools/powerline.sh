#
## A simplified powerline prompt
#

_with_color () {
  color=$1

  printf "\001\e[${color}m\002"
}

_user_status () {
  _with_color '0;38;5;231;48;5;31;1'
  printf " $(whoami) "
  _with_color '0;38;5;31;48;5;166;22'
  printf ""
}

_host_status () {
  _with_color '0;38;5;220;48;5;166'
  printf " $(hostname) "
  _with_color '0;38;5;166;48;5;240;22'
  printf ""
}

_path_status () {
  is_sub_of_home="$(echo $PWD | grep $HOME | wc -l)"

  if [ "${is_sub_of_home}" ];
  then
    IFS="/" read -ra PARTS <<< "${PWD/"$HOME"/"~"}"
    PARTS[0]="~"
  else
    IFS="/" read -ra PARTS <<< "${PWD}"
    PARTS[0]="/"
  fi

  _with_color '0;38;5;250;48;5;240'

  if [ ${#PARTS[@]} -gt 3 ]; then
    printf " ... "
    _with_color '0;38;5;245;48;5;240;22'
    printf ""
    _with_color '0;38;5;250;48;5;240'

    PARTS=("${PARTS[@]: -3}")
  fi

  length=${#PARTS[@]}
  if [ "${length}" -gt 0 ];
  then
    for part in "${PARTS[@]::${length}-1}"
    do
      printf " ${part} "
      _with_color '0;38;5;245;48;5;240;22'
      printf ""
      _with_color '0;38;5;250;48;5;240'
    done

    _with_color '0;38;5;252;48;5;240;1'
    printf " ${PARTS[${length}-1]} "
  fi

  _with_color '0;38;5;240;48;5;236;22'
  printf ""
}

_virtualenv_status () {
  virtualenv=""

  if [ "${VIRTUAL_ENV}" ];
  then
    IFS="/" read -ra PARTS <<< "${VIRTUAL_ENV}"
    virtualenv="${PARTS[${#PARTS[@]}-1]}"
  fi

  if [ "${CONDA_DEFAULT_ENV}" ];
  then
    IFS="/" read -ra PARTS <<< "${CONDA_DEFAULT_ENV}"
    virtualenv="${PARTS[${#PARTS[@]}-1]}"
  fi

  if [ "${virtualenv}" ];
  then
    _with_color '0;38;5;247;48;5;236'
    printf " \xf0\x9f\x90\x8d ${virtualenv} "
  fi
}

_git_status ()
{
  branch=$(git branch 2> /dev/null | grep '\*' | sed -e 's/* \(.*\)/\1/')

  if [ "$branch" ] ; then
    if [ "$(git status -s)" ];
    then
      _with_color '0;38;5;247;48;5;236'
    else
      _with_color '0;38;5;2;48;5;236'
    fi
    printf "  ${branch} "

    staged=$(git diff --name-only --staged | wc -l | sed -e 's/^[[:space:]]*//')
    if [ "${staged}" -gt 0 ] ; then
      _with_color '0;38;5;2;48;5;236'
      printf "● ${staged} "
    fi

    modified="$(git diff --name-only | wc -l | sed -e 's/^[[:space:]]*//')"
    if [ "${modified}" -gt 0 ] ; then
      _with_color '0;38;5;166;48;5;236'
      printf "✚ ${modified} "
    fi

    unknown="$(git status --porcelain | grep "^??" | wc -l | sed -e 's/^[[:space:]]*//')"
    if [ "${unknown}" -gt 0 ] ; then
      _with_color '0;38;5;214;48;5;236'
      printf "… ${unknown} "
    fi

    stashed="$(git stash list | wc -l | sed -e 's/^[[:space:]]*//')"
    if [ "${stashed}" -gt 0 ] ; then
      _with_color '0;38;5;31;48;5;236'
      printf "⚑ ${stashed} "
    fi
  fi
}

_create_prompt () {
  exit_code=$1

  _user_status

  _host_status

  _path_status

  _virtualenv_status

  _git_status

  if [ "${exit_code}" = 0 ];
  then
    _with_color '0;38;5;236;49;22'
    printf ""
  else
    _with_color '0;38;5;236;48;5;52;22'
    printf ""
    _with_color '0;38;5;231;48;5;52'
    printf " ${exit_code} "
    _with_color '0;38;5;52;49;22'
    printf ""
  fi

  printf '\n'

  _with_color '0;38;5;252;48;5;240;1'
  printf " $ "
  _with_color '0;38;5;240;49;22'
  printf ""

  # switch off colors
  _with_color '0'
  printf ' '
}

if command -v pip &> /dev/null && command -v powerline-daemon &> /dev/null
then
  POWERLINE_ROOT=$(pip show powerline-status | grep Location | cut -d" " -f2)

  if [ -f "$POWERLINE_ROOT"/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source "$POWERLINE_ROOT"/powerline/bindings/bash/powerline.sh
  fi
else
  # no powerline is detected -> use custom prompt
  export VIRTUAL_ENV_DISABLE_PROMPT=1
  PS1="\`_create_prompt \$?\`"
fi
