Kubernetes Tools
=======

### Usage
#### as one alias
```bash
alias k8s='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -w /tmp/$(basename "${PWD}") sklemmer/k8s:latest'
k8s kubectl get  --version
k8s kubens
k8s kubectx
``` 

#### as multiple alias
```bash
# add this to your alias file
_tools=(helm helmsman kubectl kubens kubectx aws-iam-authenticator)
for tool in "${_tools[@]}"; do
  alias "${tool}"='docker run --rm -it -v "$(pwd)":/tmp/$(basename "${PWD}") -w /tmp/$(basename "${PWD}") sklemmer/k8s:latest "${tool}"'
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
    -w /tmp/$(basename "${PWD}") sklemmer/k8s:latest \
    kubectl --version
``` 