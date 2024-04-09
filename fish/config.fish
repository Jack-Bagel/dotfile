
fish_add_path ~/.sdkman/bin/
fish_add_path ~/go/bin/
fish_add_path ~/.local/bin/

if status is-interactive
and not set -q TMUX
    exec tmux
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

bind \t accept-autosuggestion
bind \cH backward-kill-word
