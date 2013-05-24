#!/bin/bash

lc_prompt='hpwd=$(history 1); 
hpwd="${hpwd# *[0-9]*  }"; 
if [[ ${hpwd%% *} == "cd" ]]; 
	then cwd=$OLDPWD; else cwd=$PWD; 
fi; 
hpwd="$cwd $hpwd";
echo "$hpwd" >> ~/.lc_history;'
if [[ -n $PROMPT_COMMAND ]]; then
  if [[ $PROMPT_COMMAND =~ \;[[:space:]]*$ ]]; then
    export PROMPT_COMMAND="$PROMPT_COMMAND$lc_prompt"
  else
    export PROMPT_COMMAND="$PROMPT_COMMAND;$lc_prompt"
  fi
else
  export PROMPT_COMMAND="$lc_prompt"
fi

function lc() {
	echo List commands run in $PWD
	rm ~/.lc_tmp
	grep $PWD" " ~/.lc_history | while read line; do echo ${line#* }; done >> ~/.lc_tmp
	awk ' !x[$0]++' ~/.lc_tmp
}
