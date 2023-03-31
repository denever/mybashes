# git status on command line
function parse_git_dirty {
  LANG=C
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}


function cup() {
     find -name '*~' -delete
     find -name '*.pyc' -delete
     find -name '\#*\#' -delete
}

function ksc() {
    ZONE=${3:-us-central1-a}
    USE_GKE_GCLOUD_AUTH_PLUGIN=True gcloud container clusters get-credentials  $1 --project $2 --zone $ZONE
}

function k8sgo () {
    if [ -z "$1" ]; then
        echo "Usage: k8sgo <namespace> <podname>"
        return 1
    fi
    if [ -z "$2" ]; then
        echo "Usage: k8sgo <namespace> <podname>"
        return 1
    fi
    RSHELL=${3:-/bin/bash}
    POD=$(kubectl get pods -n $1 -o name | grep $2 | cut -d/ -f 2)
    kubectl exec -ti $POD -n $1 $RSHELL
}

function vpb() {
    VPB=${1:-"1"}

    conda activate viralize-playbook-$VPB
    cd ~/workvir/viralize-playbook-$VPB
}

function goprod() {
   HOST=${1:-"1"}
   gcloud compute ssh $HOST --project viralize-143916
}

function goqa() {
   HOST=${1:-"1"}
   gcloud compute ssh $HOST --project viralize-qa
}

function goci() {
   HOST=${1:-"1"}
   gcloud compute ssh $HOST --project viralize-ci
}

function gostage() {
   HOST=${1:-"1"}
   gcloud compute ssh $HOST --project viralize-staging
}

function goerp() {
   HOST=${1:-"1"}
   gcloud compute ssh $HOST --project viralize-erp
}

function shpb() {
    SHPB=${1:-"1"}

    cd ~/workvir/showheroes-playbooks-$SHPB
    PS1="\[\033[1;33m\]\w\[\033[0m\]$ $(parse_git_branch)" poetry shell
}

function terra() {
    cd ~/workvir/showheroes-terraform
    PS1="\[\033[1;33m\]\w\[\033[0m\]$ $(parse_git_branch)" poetry shell
}
