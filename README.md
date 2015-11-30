#s-noda log_stack

```
rosrun log_stack run_log.sh "tmp" "hoge" "commit from outer dir"
```

input: tag, filename

output: mkdir tag; cp filename; git add tag; git commit tag; git push filename

#Recommend
```
git remote set-url origin git@github.com:s-noda/log_stack.git
```
add ssh key to github.com
