function dig_acme_xsfx
        tmux-xpanes -c "watch -n 5 dig +short @{} TXT _acme-challenge.xsteadfastx.org" 8.8.8.8 8.8.4.4 1.1.1.1 9.9.9.9
end
