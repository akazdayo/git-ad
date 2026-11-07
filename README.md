# git-ad

Ads for your typos. `git add` stages files. `git ad` delivers value to our sponsors.

```text
$ git ad .
git: 'ad' is not a git command. But it is an opportunity.

  +--------------------------------------------------+
  | Sponsored                                        |
  |                                                  |
  |              git add Premium                     |
  |       Your changes. On the stage they deserve.    |
  |                                                  |
  |       Starting at $0/month.       [ Add now ]     |
  +--------------------------------------------------+

Nothing staged. Everything advertised.
```

Displays one of three fictional advertisements. No network requests, tracking,
or changes to your files, index, or Git configuration. Arguments are ignored
except `--help` and `--version`. Advertisement selection is seeded by the time;
invocations in the same second can show the same ad.

## Install

Requires Git and a POSIX shell environment with standard utilities, including
`awk`. Intended for macOS, Linux, and WSL.

Download or clone this repository, then run from its root:

```sh
sh install.sh
```

This copies `bin/git-ad` to `~/.local/bin/git-ad`. If that directory is not on
your PATH, add this to your shell configuration (`~/.zshrc` or `~/.bashrc`):

```sh
export PATH="$HOME/.local/bin:$PATH"
```

Open a new terminal and make a typo:

```sh
git ad .
```

Git discovers executables named `git-<command>` on PATH, so no alias is needed.
An existing Git alias named `ad` takes precedence; remove that alias yourself
if you want to use this command instead.

Choose another installation directory with:

```sh
INSTALL_DIR="$HOME/bin" sh install.sh
```

The installer refuses to overwrite an existing file. To update, uninstall using
your old checkout before installing the new version.

## Uninstall

From the same release you installed:

```sh
sh uninstall.sh
```

For a custom directory, use the same `INSTALL_DIR` value. The uninstaller only
removes a copy matching this release. If you modified the installed script,
remove that file manually. Shell configuration is left to you.

## Try without installing

From the repository root:

```sh
PATH="$PWD/bin:$PATH" git ad .
```

## License

Licensed under either the [MIT License](LICENSE-MIT) or the
[Apache License, Version 2.0](LICENSE-APACHE), at your option.

SPDX license expression: `MIT OR Apache-2.0`.
