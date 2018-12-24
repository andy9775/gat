# env

Specifies a standard for sharing environment variables across actions. The env variables are written as key/value pairs to `$HOME/.envgat` by default. On GitHub Actions `$HOME` evaluates to
`/github/home`. In essence it's a key/value store that is persisted across actions
