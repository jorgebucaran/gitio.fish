# fish-gitio [![Releases](https://img.shields.io/github/release/jorgebucaran/fish-gitio.svg?label=&color=0080FF)](https://github.com/jorgebucaran/fish-gitio/releases/latest)

> Create a tiny URL. Powered by <a href=https://git.io title="GitHub URL Shortener">Git.io</a>.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher) (recommended):

```
fisher add jorgebucaran/fish-gitio
```

<details>
<summary>Not using a package manager?</summary>

---

Copy [`gitio.fish`](gitio.fish) to any directory on your function path.

```fish
set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
curl https://git.io/gitio.fish --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/gitio.fish
```

To uninstall it, remove `gitio.fish`.

</details>

### System Requirements

- [fish](https://github.com/fishshell) 2.0+
- [curl](https://github.com/curl/curl) [7.18.0](https://curl.haxx.se/changes.html#7_18_0)+

## Usage

You want to create a short URL for your GitHub profile, repositories, issues, release notes, gists, etc. Here's how:

```properties
gitio fish-gitio=https://github.com/jorgebucaran/fish-gitio
```

The `gitio` command takes a key, followed by an `=`, and a GitHub URL (see [supported hosts](#supported-hosts)).

```properties
gitio key=url
```

Don't need a custom key? Just enter the URL and Git.io will generate a random code automatically. If the command exits successfully, your new URL will be displayed on the console.

> **Note:** Once you've created a URL, there's no way to undo it. If you mess up, contact GitHub Support and ask them to remove it for you.

## Supported Hosts

- https://github.com
- https://gist.github.com
- https://codeload.github.com
- https://raw.githubusercontent.com
- https://gist.githubusercontent.com

## License

[MIT](LICENSE.md)
