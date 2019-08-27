<p align="center">
  <img src="https://raw.githubusercontent.com/luyadev/luya/master/docs/logo/luya-logo-0.2x.png" alt="LUYA Logo"/>
</p>

# LUYA DOCKER PHP PROCESS

## Docker Compose embed

The PHP Process Docker Image.

docker-compose yml file:

```
luya_php:
    image: luyadev/luya-docker-php
```

Override PHP ini:

```php
luya_php:
    image: luyadev/luya-docker-php
    volumes:
      - ./:/app
      - ./docker/env.php:/app/configs/env.php
      - ./docker/env-local-db.php:/app/configs/env-local-db.php
      - ./docker/custom.ini:/usr/local/etc/php/conf.d/custom.ini
```

Add a custom.ini file in the docker folder with custom values. For example:

```
[PHP]

memory_limit = 256M
```

## Locales

In order to build locales bash into the container and run `locale-gen de_DE.utf` and `update-locale`.

## Test

In order to test the docker image, build it:

```
docker build -t luyadocker  .
```