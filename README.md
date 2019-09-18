# vmc-nginx-demo
Demo for essential PKS on VMC

This Demo shows the deployment of a stateless, redundant Web-Application (nginx) to an Essential PKS Cluster running on VMC. We are using a load-balancing service to make the service available outside the cluster and will show the Website in the browser.

### Clone The Repo
First step is to clone the github repo to your machine from where you´re going to run the demo. If you want the script to work out of the box make sure you clone the repository to "/home/ubuntu/demo".


### Run the script
    ./vmc-demo-lb.sh
 
 
### Now you only have to press "ENTER" and the script will run the next command for you
 
 
    ➜ demo-magic kubectl get nodes
    NAME           STATUS   ROLES    AGE   VERSION
    k8s-master01   Ready    master   29d   v1.15.2
    k8s-worker01   Ready    <none>   29d   v1.15.2
    k8s-worker02   Ready    <none>   29d   v1.15.2
    ➜ demo-magic cd /home/ubuntu/demo
    ➜ demo ls
    demo-magic  service-lb.yaml  service.yaml  vmc-nginx.yaml  wordpress
    ➜ demo cat vmc-nginx.yaml
    
    
    .
    .
    .
    ➜ demo curl http://172.30.118.6:80              # Open this URL in a Webbrowser to show the acces to our nginx webserver!
    <HTML>
    <HEAD> <TITLE>Welcome to the great World of K8s on VMC</TITLE> </HEAD>
    <BODY>
    <IMG SRC="vmc.gif">
    </BODY>

![webserver-image](https://raw.githubusercontent.com/appdess/vmc-nginx-demo/master/nginx.png)
