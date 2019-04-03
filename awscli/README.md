AWS Command Line Interface
=======

### Usage
#### as alias
```bash
alias aws='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -w /tmp/$(basename "${PWD}") sklemmer/awscli:latest'
aws --version
``` 

#### as standalone command
```bash
docker run --rm -it \
    -v "$(pwd)":/tmp/$(basename "${PWD}") \
    -w /tmp/$(basename "${PWD}") sklemmer/awscli:latest \
    awscli --version
``` 