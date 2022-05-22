# docker
## set docker
export COMPOSE_HTTP_TIMEOUT=120
alias get_docker_contaienr_id='docker ps -a | tail -n +2 | peco | cut -d" " -f1'
alias d='docker'
alias dl='docker logs'
alias db='docker build'
alias di='docker image'
alias din='docker inspect'
alias dc='docker container'
# Use like '$ dce bash' or '$ dce ash'
alias dce='docker container exec -it $(get_docker_contaienr_id)'
alias dv='docker volume'
alias dn='docker network'

## set docker-compose
alias com='docker-compose'
alias come='docker-compose exec'

## set docker-clean
alias dcl='docker-clean'

## set kubectl
alias ku='kubectl'
alias kuls='kubectl get pod'
alias get_k8s_pod_id='kubectl get pod | tail -n +2 | peco | cut -d" " -f1'
alias kulog='kubectl logs -f $(get_k8s_pod_id)'
alias kudel='kubectl delete pod $(get_k8s_pod_id)'

# circleci
alias ci='circleci'
alias civa='circleci config validate -c .circleci/config.yml'
alias cipr='circleci config process .circleci/config.yml > .circleci/process.yml'
alias cilo='circleci local execute -c process.yml --job'

# terraform
alias te='terraform'
