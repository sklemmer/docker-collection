Ansible Workspace
=================

A simple and stupid debian based workspace for working with ansible related tasks


### Usage
```bash
# no AWS
docker run -it -v $PWD:/workspace -w /workspace sklemmer/ansible-workspace /bin/bash

# using AWS environment variables
docker run -it -v $PWD:/workspace -w /workspace -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=us-east-2" sklemmer/ansible-workspace /bin/bash

# with AWS configuration files
docker run -it -v $PWD:/workspace -w /workspace -v $HOME/.aws:/root/.aws:ro sklemmer/ansible-workspace /bin/bash
```