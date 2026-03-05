# dco

Docker Compose CLI v2 alias with proper shell completion for bash<!--/zsh/fish-->

> [!warning]
> This code is provided as-is. As long as your shell is bash<!--, zsh, or fish-->, most versions of Docker should be compatible. Compose CLI v1 (`docker-compose`) is explicitly unsupported.
>
> Please open an issue if a future version of Docker or Docker Compose introduces new features, CLI arguments, flags, etc. that are missing when using this alias, or if future versions break this alias entirely.

## Installation

### bash

```bash
curl -fsL https://raw.githubusercontent.com/nv6/dco/master/install.bash | bash
. ~/.bashrc
```

> [!tip]
> This was tested on Debian 13 and Ubuntu 24 LTS, but should work with any OS running bash normally. In the rare case the completions path `~/.local/share/bash-completion/completions` must be changed, do so [here](./dco-bash.awk#L2).

### zsh

- [ ] TODO

## Usage

`dco` acts nearly identical to `docker compose` including tab-completions.

Some convenience enhancements are also added. Run `dco -H` to show extra functionality.
