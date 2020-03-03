[![version](https://img.shields.io/badge/firefox-73-green.svg?style=flat-square)](https://packages.ubuntu.com/bionic/firefox) 

Dockerized Firefox in headless [Marionette](https://vakila.github.io/blog/marionette-act-i-automation/) mode.

A Fork from [deepsweet/firefox-headless-remote](https://github.com/deepsweet/firefox-headless-remote) with following changes:
    * Add support for Japanese environment,
    * Includ fonts in docker,
    * Tweak configuration file,
    * Upgrade firefox version.

## Usage

```sh
docker build ikawaha/firefox-headless-remote:73
docker run -it --rm --shm-size 2g -p 2828:2828 ikawaha/firefox-headless-remote:73
```

---
MIT