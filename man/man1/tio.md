tio(1) -- Create a git.io/slug from a GitHub url
=================================================

## SYNOPSIS

tio *url* *slug*<br>
tio *slug* *url*<br>
tio *url*<br>

## USAGE

tio accepts a url (the "https://github.com" part is optional) and a *slug*, and attempts to shorten the url using the git.io service. If the operation is successful, the short url is printed to stdout.

```
tio short owner/repo
https://git.io/short
```

or

```
tio owner/repo short
https://git.io/short
```

### NO SLUG

If you don't need a slug, the following works too.

```
tio owner/repo
https://git.io/vwlMo
```
