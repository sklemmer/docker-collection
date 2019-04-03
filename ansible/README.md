Ansible
=======

### Usage
Only consider using this when you want to provision another machines

#### as one alias
```bash
alias _ansible='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -w /tmp/$(basename "${PWD}") sklemmer/ansible:latest'
_ansible ansible-playbook --version
``` 

#### as multiple aliases
```bash
# add this to your alias file
_tools=(ansible ansible-playbook ansible-inventory ansible-galaxy)
for tool in "${_tools[@]}"; do
  alias "${tool}"='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -w /tmp/$(basename "${PWD}") sklemmer/ansible:latest "${tool}"'
done
unset _tools

# now you can use it as a standalone command
ansible --version
ansible-playbook --version
ansible-galaxy --version
``` 

#### as standalone command
```bash
docker run --rm -it \
    -v "$(pwd)":/tmp/$(basename "${PWD}") \
    -w /tmp/$(basename "${PWD}") sklemmer/ansible:latest \
    ansible-playbook --version
``` 