function 2mp4
    /usr/bin/HandBrakeCLI \
        --input $argv[1] \
        --output $argv[2] \
        --preset "Fast 1080p30" \
        --audio-lang-list "eng,deu" \
        --all-audio \
        --subtitle-lang-list "eng,deu" \
        --all-subtitles
end
