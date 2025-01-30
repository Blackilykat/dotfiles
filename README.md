# My dotfiles

My personal dotfiles.

## You'll want to change some stuff

If you're looking towards using these dotfiles, make sure to change these things in `./config/hypr/hyprland.conf`:

- monitors section: Set these to your monitors' data. The WM might not launch if you keep it as is.
- my programs section: You'll probably want to change the background image here.
- autostart section: There's some autostart programs you likely don't care about
- input section: **Change this to your keyboard layout!!!!**
- windows and workspaces section: There's some window rules you might find annoying.

## What to install

- Hyprland
- Waybar
- Flameshot
- Kitty
- Dunst
- Zsh
- Rofi ([lbonn's fork with wayland support](https://github.com/lbonn/rofi))
- [Rofi-mixer](https://github.com/joshpetit/rofi-mixer)
- [Rofi power menu](https://github.com/jluttine/rofi-power-menu)

## Default keybinds

| Keybind                                                | Command                                                                   |
|--------------------------------------------------------|---------------------------------------------------------------------------|
| `Super` + `Return`                                     | Opens terminal                                                            |
| `Super` + `Q`                                          | Closes application                                                        |
| `Super` + `Space`                                      | Toggles floating window`                                                  |
| `Super` + `D`                                          | Opens application launcher (start menu kinda thing)                       |
| `Super` + `P`                                          | Pins a window (stays on top on all workspaces, only floating)             |
| `Print Screen`                                         | Takes a screenshot                                                        |
| `Super` + `.`                                          | Opens emoji picker (copying choice to clipboard)                          |
| `Super` + `Shift` + `.`                                | Opens emoji picker (tries to type choice)                                 |
| `Super` + `Arrow (or corresponding vim key)`           | Move focus to another window                                              |
| `Super` + `Shift` + `Arrow (or corresponding vim key)` | Move window                                                               |
| `Super` + `[0-9]`                                      | Change workspace                                                          |
| `Super` + `Shift` + `[0-9]`                            | Move window to workspace                                                  |
| `Super` + `S`                                          | Toggle scratchpad                                                         |
| `Super` + `Shift` + `S`                                | Move window to scratchpad                                                 |
| `Super` + `F`                                          | Toggle fullscreen                                                         |
| `Super` + `Shift` + `F`                                | Toggle fake fullscreen (makes an app think it's fullscreen when it's not) |

## How to apply

I'm using [stow](https://www.gnu.org/software/stow/), but I probably shouldn't be giving instructions on how to use it as I'm not too familiar with the tool.

Every file is in the location it would be if the reposetory was your home directory. You can manually copy files over if you don't want to use tools for it.
