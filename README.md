# dco

Docker Compose CLI v2 alias with proper shell completion for bash<!--/zsh/fish-->

> [!warning]
> This code is provided as-is. As long as your shell is bash<!--, zsh, or fish-->, most versions of Docker should be compatible. Compose CLI v1 (`docker-compose`) is explicitly unsupported.
>
> Please open an issue if a future version of Docker or Docker Compose introduces new features, CLI arguments, flags, etc. that are missing when using this alias, or if future versions break this alias entirely.

## Installation

The alias and completion script can be installed [automatically](#automatic-configuration) or added [manually](#manual-configuration).

### Automatic Configuration

Inspecting [`dco-bash.awk`](dco-bash.awk) is encouraged before executing.

```bash
mkdir -p ~/.local/share/bash-completion/completions
echo 'function dco { docker compose "$@"; }' >> ~/.bashrc
docker completion bash | awk -f <(curl -sL https://raw.githubusercontent.com/nv6/dco/master/dco-bash.awk)
```

or with wget:
```bash
docker completion bash | awk -f <(wget -qO- https://raw.githubusercontent.com/nv6/dco/master/dco-bash.awk)
```

> [!tip]
> This was tested on Debian 13 but should work with any OS running bash normally. In the rare case the output dir `~/.local/share/bash-completion/completions` needs to be modified, do so [here](./dco-bash.awk#L2).

### Manual Configuration

- [ ] TODO

## Usage

After installing, exit and reopen the terminal session, or just run `. ~/.bashrc`.

You should now be able to tab-complete the alias `dco` identically to `docker compose`.
