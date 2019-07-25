def uses_nouveau() -> bool:
    import re

    with open("/proc/modules", "r") as f:
        modules = f.read()
    if re.search(r"nouveau", modules):
        return True
    else:
        return False


# config.load_autoconfig()
c.auto_save.session = True
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?hl=de&q={}",
    "r": "https://reddit.com/r/{}",
}
if uses_nouveau():
    c.qt.force_software_rendering = True

# KEYBINDINGS
config.bind(",m", "spawn /usr/bin/mpv {url}")
# config.bind(",p", "spawn pocket-cli add -u {url}")
config.bind(",p", "spawn --userscript qute-pass")

### DRACULA ###########################
import dracula.draw

dracula.draw.blood(
    c,
    {
        "spacing": {"vertical": 6, "horizontal": 8},
        "font": {"family": "UbuntuMono Nerd Font", "size": 10},
    },
)
### /DRACULA ##########################
