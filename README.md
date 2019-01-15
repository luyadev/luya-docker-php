# LUYA DOCKER PHP PROCESS

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