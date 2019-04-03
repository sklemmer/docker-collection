Kitchen
=======

### Usage
#### as alias
```bash
alias kitchen='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -v /var/run/docker.sock:/var/run/docker.sock -w /tmp/$(basename "${PWD}") sklemmer/kitchen:latest kitchen'
kitchen --version
``` 

#### as standalone command
```bash
docker run --rm -it \
    -v "$(pwd)":/tmp/$(basename "${PWD}") \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -w /tmp/$(basename "${PWD}") \
    sklemmer/kitchen:latest \
    kitchen --version
``` 