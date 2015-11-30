#s-noda log_stack

input: tag, filename

output: mkdir tag; cp filename; git add tag; git commit tag; git push filename

git remote set-url origin git@github.com:s-noda/log_stack.git

add ssh key to github.com
