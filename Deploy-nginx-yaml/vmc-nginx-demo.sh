#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
# TYPE_SPEED=20

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear


# check if the cluster is healthy (Showing a "Ready" status)
pe "kubectl get nodes"
pe "cd /home/ubuntu/demo"
pe "ls"
pe "cat vmc-nginx.yaml"
pe "kubectl apply -f vmc-nginx.yaml"
# check the state of the deployment:
pe "kubectl get deploy"
# show the pods which have been created by our deployment - we filter them by their label "vmc-nginx". You will notice that each pod got it´s own IP by our overlay-network (Calico). This is K8s internal networking and not accessible from the outside.
pe "kubectl get pods -l run=vmc-nginx -o wide"

# show the service-definition
pe "cat service-lb.yaml"
pe "kubectl apply -f service-lb.yaml"
pe "kubectl get svc"

#  show the Kubernetes Worker Node-IPs:
# pe "kubectl get nodes -o wide"
#show that it works:
pe "curl http://172.30.118.6:80"
# cleanup the stuff
pe "kubectl -n default delete deployment,po,svc --all"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
