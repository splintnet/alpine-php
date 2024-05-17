<p align="center">
    <a href="https://www.splintnet.de">
        <img alt="Docker Alpine PHP Images Logo" width="190" src="https://raw.githack.com/splintnet/alpine-php/master/logo.svg" />
    </a>
</p>

<p align="center">
  <strong>Docker Alpine PHP images</strong>
</p>

<p align="center">
    <a href="https://hub.docker.com/splintnet/alpine-php"><img alt="Build Status" src="https://img.shields.io/docker/cloud/build/splintnet/alpine-php"></a>
    <a href="https://github.com/splintnet/alpine-php"><img alt="Source link" src="https://img.shields.io/badge/Source-GitHub-lightgrey.svg?style=flat-square"></a>
    <a href="https://www.splintnet.de"><img alt="Authors link" src="https://img.shields.io/badge/Authors-splintnet-lightgrey.svg?style=flat-square"></a>
    <a href="https://hub.docker.com/r/splintnet/alpine-php/"><img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/splintnet/alpine-php.svg?style=flat-square"></a>
    <a href="https://github.com/splintnet/alpine-php/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/github/license/splintnet/alpine-php.svg?style=flat-square"></a>
</p>

---

Docker images built on top of the [official PHP images](https://hub.docker.com/r/_/php/) with the addition of some common and useful extensions, installed with [mlocati/alpine-php-extension-installer](https://github.com/mlocati/alpine-php-extension-installer). You can find these images on the [Docker Hub](https://hub.docker.com/r/splintnet/alpine-php/) (and if you're reading this file, you're probably already there).

An automated build is set up, so they should be always up-to-date with the Dockerfiles in the [GitHub repository](https://github.com/splintnet/alpine-php). Also, every time an official PHP image is updated, a rebuild is triggered, so that you will always find the latest security patches installed in these images.

## Available tags and `Dockerfile` links
- [`latest` (_Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/Dockerfile)
- [`7.4` (_7.4/Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/7.4/Dockerfile)
- [`8.0` (_8.0/Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/8.0/Dockerfile)
- [`8.1` (_8.1/Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/8.1/Dockerfile)
- [`8.2` (_8.2/Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/8.2/Dockerfile)
- [`8.3` (_8.3/Dockerfile_)](https://github.com/splintnet/alpine-php/blob/master/8.3/Dockerfile)

As you might have guessed, all tags are built on top of the corresponding tag of the official image. Not all tags are supported in order to easen manteinance.

## Installed extensions
The following modules and extensions have been enabled,
in addition to those you can already find in the [official PHP image](https://hub.docker.com/r/_/php/):

- `bcmath`
- `bz2`
- `calendar`
- `exif`
- `iconv`
- `intl`
- `pcntl`
- `apcu`
- `gd`
- `iconv`
- `imagemagick`
- `ldap`
- `mbstring`
- `memcached`
- `mysqli`
- `pdo_mysql`
- `pdo_pgsql`
- `pgsql`
- `redis`
- `soap`
- `xsl`
- `Zend OPcache`
- `zip`
- `sockets`

You will probably not need all this stuff. Even if having some extra extensions loaded ain't a big issue in most cases, you will very likely want to checkout this repository, remove unwanted extensions from the `Dockerfile`, and build your own image — for sometimes removing is easier than adding. 😉

## Composer
[Composer](https://getcomposer.org) is installed globally in all images. Please, refer to their documentation for usage hints.


## Contributing
If you find an issue, or have a special wish not yet fulfilled, please [open an issue on GitHub](https://github.com/splintnet/alpine-php/issues) providing as many details as you can (the more you are specific about your problem, the easier it is for us to fix it).

Pull requests are welcome, too! 😁 Please, run `make build` and `make test` before attempting a pull request. Also, it would be nice if you could stick to the [best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/).

## Container Roles

- app
- worker
- scheduler
- horizon
- reverb

---

## License

Docker PHP Images is released under the [MIT](https://github.com/splintnet/alpine-php/blob/master/LICENSE) license.
