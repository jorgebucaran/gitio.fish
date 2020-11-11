# gitio.fish

> Create a [git.io](https://git.io) URL.

## Installation

With [Fisher](https://github.com/jorgebucaran/fisher):

```console
fisher install jorgebucaran/gitio.fish
```

## Quickstart

You want to create a short URL for your GitHub repos, issues, gists, etc. Here's how to do that with `gitio`:

<pre>
$ gitio super=https://github.com/jorgebucaran/superfine
<a href=https://git.io/super>https://git.io/super</a>
</pre>

You can enter a custom key, followed by an `=`, and a GitHub URL.

```properties
gitio key=url
```

Or just enter any GitHub URL and we'll generate a random git.io URL for you.

> **Warning:** Once you've created a URL, there's no way to undo it. Take it easy!

## License

[MIT](LICENSE.md)
