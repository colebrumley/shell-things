#!/bin/bash

_jcomp() 
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "$(jira ls|awk -F: '{print $1}'|tr '\n' ' ')" -- $cur) )
}

jh() { echo "jc == create, jl == ls, jt == todo, jp == progress, jd == done, jm == comment, jy == yesterday, jn == today, jv == view"; }
jc() { jira create; }
jl() { jira ls "${@}"; }
jt() { jira trans "To Do" "$1"; }
jp() { jira trans "In Progress" "$1" --noedit; }
jd() { jira trans "Done" "$1"; }
jy() { jl -q"updated > endOfDay("-2") AND updated < endOfDay(-1) AND assignee = cole.brumley"; }
jn() { jl -q"updated > startOfDay() AND assignee = cole.brumley"; }
jv() { jira $1 -t debug|jq '.'; }
jm() { jira comment $1; }

complete -F _jcomp jt
complete -F _jcomp jp
complete -F _jcomp jd
complete -F _jcomp jira