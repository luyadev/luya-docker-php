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
    volumes:
      - ./:/app
```

## Commands

The luya docker php process contains certain commands which helps to either run commands or initialize your project:

|command|description
|-------|-----
|`docker-compose run luya_php setup`|Runs the migrate, import and admin/setup command and creates a default admin user with email `admin@admin.com` and password `admin`.
|`docker-compose exec luya_php luya <command>`|Runs any luya command like migrate,import,etc.

#### Custom PHP Init

```php
luya_php:
    image: luyadev/luya-docker-php
    volumes:
      - ./:/app
      - ./docker/custom.ini:/usr/local/etc/php/conf.d/custom.ini
```

Add a custom.ini file in the docker folder with custom values. For example:

```
[PHP]

memory_limit = 256M
```

#### Locales

In order to build locales bash into the container and run `echo 'de_CH.UTF-8 UTF-8' >> /etc/locale.gen && locale-gen`.
