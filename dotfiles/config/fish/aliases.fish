alias satan='rm /usr/local/var/postgres/postmaster.pid & brew services restart postgresql'
alias gap='git add -p'
alias grc='git rebase --continue'
alias grom='git rebase -i origin/master --autosquash'
alias grim='git rebase -i origin/main --autosquash'
alias gca='git commit --amend'
alias gdc='git diff --cached'
alias gl='git log --stat'
alias gpurge='git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d'
alias lol='ls'
alias cat=bat
alias gserve='gunicorn --threads 2 -w 1 --reload  cloud.wsgi'
alias fix-poetry-lock='git checkout --ours poetry.lock && poetry lock --no-update && git add poetry.lock'
