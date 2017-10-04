# enabling vi mode
fish_vi_key_bindings

# set default user
set default_user marv mpreuss

# disable welcome message
set fish_greeting

# aliases
alias vim=nvim
alias ll='ls -la'

# set default editor
set -gx EDITOR nvim

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
  set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
  set -gx PIPENV_SHELL_COMPAT 1
  eval (env _PIPENV_COMPLETE=source-fish pipenv)
end

# theme
set -g theme_color_scheme solarized-dark
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
