function 2mkv
    /usr/bin/HandBrakeCLI \
        --input $argv[1] \
        --output $argv[2] \
        --main-feature --markers --optimize --ipod-atom \
        --encoder-tune film \
        --encoder x264 --encoder-profile high --encoder-preset medium --encoder-level 4.1 --quality 21 \
        --maxWidth 1920 \
        --maxHeight 1080 \
        --decomb --auto-anamorphic --cfr \
        --audio "1,2,3,4,5,6,7,8,9,10" \
        --aencoder copy --audio-fallback av_aac --ab 160 \
        --subtitle "1,2,3,4,5,6,7,8,9,10"
end
