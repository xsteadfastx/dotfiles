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
    eval (env _PIPENV_COMPLETE=source-fish pipenv)
end
