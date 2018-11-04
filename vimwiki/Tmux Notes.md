# Tmux Notes

Press C+b to issue commands:
* ? - show help screen (press enter to exit it)
* " - horizontal split
* % - vertical split
* d - detatch (tmux ls to list, tmux a -t #)
    * tmux ls - list sessions
    * tmux a -t # <-- attach to session id # (ie - 0)
    * tmux a # - reattach last session
* z - maximize (do again to revert)

## Naming sessions

* tmux new -s [session-name]
    * eg: tmux new -s aeq1501 --> can then reattach with tmux a -t aeq1501

## Colour palette

Use this script to get all colours:
for i in {0..255}; do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done
