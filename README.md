# lighttpd-cgi

An out-of-the-box lighttpd image for CGI scripts based HTTP server.

This image is available on the Docker Hub [zetaplusae/lighttpd-cgi](https://hub.docker.com/r/zetaplusae/lighttpd-cgi), and can be pulled from the official Docker registry:

```sh
docker pull zetaplusae/lighttpd-cgi
```

## How to use this image

### Run directly

```sh
docker run -d -p 80:80 -v "$PWD":/var/www/cgi-bin zetaplusae/lighttpd-cgi
```

By running the command above, a HTTP server will be started on port **80**. It will serve requests by executing CGI scripts on the same path as the one located under the `/var/www/cgi-bin` directory, which can be mounted externally. For instance, `http://hostname/hello.sh` will be served by `/var/www/cgi-bin/hello.sh`.

### Build an image

Copy all your CGI scripts to the `cgi-bin` directory.

```Dockerfile
FROM zetaplusae/lighttpd-cgi
COPY ./cgi-bin/ /var/www/cgi-bin/
```

## Configuration

The configuration file `lighttpd.conf` is located on `/etc/lighttpd/lighttpd.conf`. To customize the configuration, `COPY` your configuration to that path.

```Dockerfile
COPY ./your-lighttpd.conf /etc/lighttpd/lighttpd.conf
```

Or, instead of overwriting the main configuration file, you can copy a configuration to the directory `/etc/lighttpd/conf.d/`, where all files having suffix `.conf` will be included automatically.

See the [lighttpd configuration wiki](https://redmine.lighttpd.net/projects/lighttpd/wiki/TutorialConfiguration) for more information.

## License

This project is licensed under the [MIT license](./LICENSE).
