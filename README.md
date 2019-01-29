# fish-gitio

[![Build Status](https://img.shields.io/travis/jorgebucaran/fish-gitio.svg)](https://travis-ci.org/jorgebucaran/fish-gitio)
[![Releases](https://img.shields.io/github/release/jorgebucaran/fish-gitio.svg?label=latest)](https://github.com/jorgebucaran/fish-gitio/releases)

[Git.io](https://git.io) CLI for the [fish shell](https://fishshell.com). Create a short URL like <[git.io/fish-gitio](https://git.io/fish-gitio)> for any GitHub URL.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```
fisher add jorgebucaran/fish-gitio
```

<details>
<summary>Not using a package manager?</summary>

---

Download `gitio.fish` to any directory on your functions path.

```fish
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
curl https://git.io/gitio.fish --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/gitio.fish
```

To uninstall it from your system, remove the file and erase the function.

```
rm -f $XDG_CONFIG_HOME/fish/functions/gitio.fish && functions -e gitio
```

</details>

### System Requirements

- [fish](https://github.com/fishshell) 2.0+
- [curl](https://github.com/curl/curl) [7.18.0](https://curl.haxx.se/changes.html#7_18_0)+

## Usage

You want to create a short URL for your GitHub profile page, repositories, issues, release notes, tarballs, gists—you name it.

How do you do that? Here's how I did it for this repository.

```fish
gitio fish-gitio=https://github.com/jorgebucaran/fish-gitio
```

The `gitio` command takes an optional vanity code, followed by an equal sign, and the GitHub URL. Don't need a vanity code? Use a bare URL (no code) and Git.io will generate a random 4-letter string for you.

If the command exits successfully, the short URL will be displayed on your console.

Notice that once you've created a URL, there's no way to undo this. Your best bet is to contact GitHub Support and ask if they will remove it for you.

## Supported URLs

| Hostname                           | Example                                                                                                |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------ |
| https://github.com                 | https://github.com/jorgebucaran/fish-gitio <br> https://github.com/jorgebucaran/fish-gitio/issues <br> |
| https://gist.github.com            | https://gist.github.com/jorgebucaran/c7954376c...5bb85feabb8                                           |
| https://codeload.github.com        | https://codeload.github.com/jorgebucaran/fish-gitio/tar.gz/master                                      |
| https://raw.githubusercontent.com  | https://raw.githubusercontent.com/jorgebucaran/fish-gitio/master/gitio.fish                            |
| https://gist.githubusercontent.com | https://gist.githubusercontent.com/jorgebucaran/c796.../raw/894a.../gitio.svg                          |

## License

[MIT](LICENSE.md)
