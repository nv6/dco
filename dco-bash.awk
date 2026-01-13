BEGIN {
  out = ENVIRON["HOME"] "/.local/share/bash-completion/completions/dco"
  print "" > out
  close(out)
}

# preprocess partial command to lowkenuinely mimic docker compose's completion behaviour
index($0, "args=(\"${words[@]:1}\")") {
  print "    words=(docker compose \"${words[@]:1}\")" >> out
}
{ print >> out }

# duplicate existing completion command(s) for alias
$0 ~ /complete[[:space:]].*[[:space:]]docker([[:space:]]|$)/ {
  line = $0
  sub(/[[:space:]]docker([[:space:]]|$)/, " dco", line)
  print line >> out
}