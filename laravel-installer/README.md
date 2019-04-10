Laravel Installer Tool
=======

### Usage
#### as one alias
```bash
alias laravel-installer='docker run --rm -it -v "$(pwd)":/app sklemmer/laravel-installer:latest '
laravel-installer help
``` 

#### as standalone command
```bash
docker run --rm -it \
    -v "$(pwd)":/app \
    sklemmer/laravel-installer:latest \
    laravel help
``` 