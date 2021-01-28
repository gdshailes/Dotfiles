cmd="bundle exec rspec"
while read line ; do
  line="${line/rspec /}"
  line="${line/\[0m \[36m/}"
  cmd="$cmd $line"
done < <(ggrep 'rspec.*?(?=#)' tmp/failing_specs.log -P -o)
echo -E "$cmd"

eval ${cmd}