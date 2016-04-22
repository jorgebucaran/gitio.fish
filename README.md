[![Slack Room][slack-badge]][slack-link]

# Tio

**Tio** is a [git.io] slug url cli for fish.

## Install

With [fisherman]

```
fisher tio
```

## Usage

tio accepts a url (the "https://github.com" part is optional) and a *slug*, and attempts to shorten the url using the [git.io] service. If the operation is successful, the short url is printed to stdout.

```
tio short owner/repo
https://git.io/short
```

or

```
tio owner/repo short
https://git.io/short
```

### No slug

If you don't need an slug, the following works too.

```
tio owner/repo
https://git.io/vwlMo
```

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://img.shields.io/badge/slack-join%20the%20chat-00B9FF.svg?style=flat-square
[fisherman]: https://github.com/fisherman/fisherman
[git.io]: https://git.io/
