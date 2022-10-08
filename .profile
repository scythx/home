# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        LAUNCH_FISH=true
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.poetry/bin" ] ; then
    PATH="$HOME/.poetry/bin:$PATH"
fi

if [ -d "$HOME/.cache/rebar3/bin" ] ; then
    PATH="$HOME/.cache/rebar3/bin:$PATH"
fi

if [ -d "$HOME/.krew/bin" ] ; then
    PATH="$HOME/.krew/bin:$PATH"
fi
# Load ssh keys
# See: https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/
eval $(keychain --eval --quiet \
           id_ed25519-scythx@tutanota.com \
       id_ed25519-raefaldhi@nubela.co)

if [ "$LAUNCH_FISH" = true ]; then
    unset LAUNCH_FISH
    . ~/.launch_fish
fi
