# fish-gitio

[![Build Status](https://img.shields.io/travis/jorgebucaran/fish-gitio.svg)](https://travis-ci.org/jorgebucaran/fish-gitio)
[![Releases](https://img.shields.io/github/release/jorgebucaran/fish-gitio.svg?label=latest)](https://github.com/jorgebucaran/fish-gitio/releases)

fish-gitio is a CLI to [Git.io](https://git.io) for the [fish shell](https://fishshell.com). Use it to create a tiny URL like <a href=https://git.io/fish-gitio>git.io/<b>fish-gitio</b></a> for any GitHub URL.

## Installation

<pre>
<a href=https://github.com/jorgebucaran/fisher>fisher</a> add jorgebucaran/fish-gitio
</pre>

### Manual Installation

Not using a package manager? Download `gitio.fish` to any directory in your functions path.

```fish
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
curl https://git.io/gitio.fish --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/gitio.fish
```

To uninstall it from your system, remove the `gitio.fish` file and erase the function.

```
rm -f $XDG_CONFIG_HOME/fish/functions/gitio.fish && functions -e gitio
```

## System Requirements

- [fish](https://github.com/fishshell) 2.0+
- [curl](https://github.com/curl/curl) [7.18.0](https://curl.haxx.se/changes.html#7_18_0)+

## Usage

You can use `gitio` to create a tiny URL for your GitHub profile page, repositories, issues, release notes, tarballs, gists, raw files, etc. If the command exits successfully, the generated URL will be displayed on your console.

```fish
gitio code=url
```

The tiny URL for this repository was created using the following command.

```fish
gitio fish-gitio=https://github.com/jorgebucaran/fish-gitio
```

Don't need a custom code? If you provide only the URL, a random 4-letter code will be generated for you by Git.io.

Notice that once you've created a tiny URL, there's no way to undo this action. Your best option is to contact GitHub support and ask if they will remove it for you.

### What URLs are supported?

| Hostname                           | Example                                                                                                |
| ---------------------------------- | ------------------------------------------------------------------------------------------------------ |
| https://github.com                 | https://github.com/jorgebucaran/fish-gitio <br> https://github.com/jorgebucaran/fish-gitio/issues <br> |
| https://gist.github.com            | https://gist.github.com/jorgebucaran/c7954376c...5bb85feabb8                                           |
| https://codeload.github.com        | https://codeload.github.com/jorgebucaran/fish-gitio/tar.gz/master                                      |
| https://raw.githubusercontent.com  | https://raw.githubusercontent.com/jorgebucaran/fish-gitio/master/gitio.fish                            |
| https://gist.githubusercontent.com | https://gist.githubusercontent.com/jorgebucaran/c796.../raw/894a.../gitio.svg                          |

## License

[MIT](LICENSE.md)
