# dcape-app-miniflux

[![GitHub Release][1]][2] [![GitHub code size in bytes][3]]() [![GitHub license][4]][5]

[1]: https://img.shields.io/github/release/dopos/dcape-app-miniflux.svg
[2]: https://github.com/dopos/dcape-app-miniflux/releases
[3]: https://img.shields.io/github/languages/code-size/dopos/dcape-app-miniflux.svg
[4]: https://img.shields.io/github/license/dopos/dcape-app-miniflux.svg
[5]: LICENSE

[miniflux](https://github.com/miniflux/v2) application package for [dcape](https://github.com/dopos/dcape).

## Docker image used

* [miniflux/miniflux](https://hub.docker.com/r/miniflux/miniflux)

## Requirements

* linux 64bit (git, make, sed)
* [docker](http://docker.io)
* [dcape](https://github.com/dopos/dcape) v3
* Git service ([github](https://github.com), [gitea](https://gitea.io) or [gogs](https://gogs.io))

## Install

### By mouse (deploy with drone)

* Gitea: Fork or mirror this repo in your Git service
* Drone: Activate repo
* Gitea: "Test delivery", config sample will be saved to enfist
* Enfist: Edit config and remove .sample from name
* Gitea: "Test delivery" again (or Drone: "Restart") - app will be installed and started on webhook host

### By hands

```bash
git clone --single-branch --depth 1 https://github.com/dopos/dcape-app-miniflux.git
cd dcape-app-miniflux
make config
... <edit .env.sample>
mv .env.sample .env
make up
```

## License

The MIT License (MIT), see [LICENSE](LICENSE).

Copyright (c) 2022 Aleksei Kovrizhkin <lekovr+dopos@gmail.com>
