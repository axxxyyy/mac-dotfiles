# mac-dotfiles

### Installation

```sh
DOTS="$HOME/.config/nix"
sh <(curl -L https://nixos.org/nix/install)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/axyie/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
git clone https://git.axyria.dev/mac-dotfiles.git "$DOTS"
nix build .#darwinConfigurations.$(hostname).system
printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t
"$DOTS"/result/sw/bin/darwin-rebuild switch --flake "$DOTS"
```
