# enabling vi mode
#fish_vi_key_bindings

# set default user
set default_user mpreuss

# aliases
alias vim=nvim
alias ll='ls -la'

# path
if test -d ~/.local/bin
    set PATH ~/.local/bin $PATH
end

# pyenv
if test -d ~/.pyenv/bin
    set PATH ~/.pyenv/bin $PATH
    status --is-interactive; and . (pyenv init -|psub)
end

# pipenv
if test -f ~/.local/bin/pipenv
    set -gx PIPENV_SHELL_COMPAT 1
    eval (env _PIPENV_COMPLETE=source-fish pipenv)
end
