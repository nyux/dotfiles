# Dotfiles + Configs

This repo is meant as a backup for all my significant dotfiles and configs for bash, urxvt, and i3, to prevent them from getting lost across installs. Still a huge work in progress, that gets better in bursts. i3 configs were forked from [this github repo](https://github.com/NorthAntrim/i3-config) and then modified to suit my tastes.

The configs are no longer geared towards supporting both Linux and OS X, which takes out some verbosity in the `.bashrc`. A few files have also been re-ordered to flow better, and have better semantic meaning.

## Dependencies

Obviously, `i3`, and `i3bar`, found in the arch repos under the `i3` group. `conky`, `bash`, `screen`. `python` --- since this runs on an archlinux box, this refers to `python3`, though it should be trivially easy to backport.

Optional dependencies, to take advantage of all the functionality here: `lesspipe`, `xbacklight`, `urxvt`, and `python2-pygments`.

## Other tweaks

There are some other tweaks on this machine that aren't included in this repo. `laptop-mode-tools` is installed, and I've followed the tweaks in the **backlight** and **bluetooth** sections of [the power saving article on the Arch wiki.](https://wiki.archlinux.org/index.php/Power_saving).

## To-do

* A script to automate creation/deletion of symlinks to home
* Add .vimrc
* Add .gitconfig
* Add copy of `pacman -Qqe`
