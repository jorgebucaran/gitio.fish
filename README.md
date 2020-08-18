# gitio.fish

> Create a tiny GitHub URL. Powered by <a href=https://git.io title="GitHub URL Shortener">Git.io</a>.

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher) (recommended):

```console
fisher add jorgebucaran/gitio.fish
```

<details>
<summary>Not using a package manager?</summary>

###

Copy [`gitio.fish`](gitio.fish) to any directory on your function path.

```fish
curl https://git.io/gitio.fish --create-dirs -sLo ~/.config/fish/functions/gitio.fish
```

To uninstall, just remove `gitio.fish`.

</details>

## Quickstart

You want to create a short URL for your GitHub repos, issues, gists, etc. Here's how to do that with `gitio`:

```properties
gitio super=https://github.com/jorgebucaran/superfine
https://git.io/super
```

The `gitio` command expects a key, followed by an `=`, and a GitHub URL (see [supported hosts](#supported-hosts) below).

```properties
gitio key=url
```

Don't need a custom key? Just type the GitHub URL after `gitio` and we'll generate a random one for you. If the command exits successfully, the new URL will be displayed on your console.

> **Note:** Once you've created a URL, there's no way to undo it. If you mess something up, contact GitHub Support and ask them to remove it for you.

## Supported Hosts

- https://github.com
- https://gist.github.com
- https://codeload.github.com
- https://raw.githubusercontent.com
- https://gist.githubusercontent.com

## License

[MIT](LICENSE.md)
