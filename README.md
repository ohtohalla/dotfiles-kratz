# MacOS Initial Setup

To use first create SSH keys by [this instruction](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

Afterwards run

```
curl https://raw.githubusercontent.com/ohtohalla/macos_dots/master/.install.sh --output install.sh
chmod +x install.sh
./install.sh
```

After the install, open Neovim and run ```PlugInstall``` and ```PlugUpdate```.

At this point you need to enable Rectangle or Amethyst manually, but that can hopefully be done automatically in the future.
