# sailor-playbook
> It's scary out there. Here's guide to help you start sailing in the digital ocean with kubernetes.

This repo is contains terraform config files, ansible playbooks and bash scripts to bootstrap a minimal
kuberentes cluster on digital ocean, with a single controller and a single worker.

## Terraform workflow: 

* `www-1.tf`: Contains the cluster resources definitions. Configure the count of the worker nodes.
* `start.sh`: Helper script to call terraform apply with `DO_TOKEN` digital ocean personal token,
`SSH_FINGERPEINT` the ssh fingerprint 
* `stop.sh`: Helper script to call terraform destroy with same variables as above.
* `run-docker.sh`: Start a docker container with terraform and terraform-inventory installed, More on that below.
* `Dockerfile`: A docker file containing the apporporiate tooling terraform, anisble, and terraform-inventory installed.
* `run-ansible`: A helper script to provision the cluster with anisble 

To start a cluster we run `run-docke.sh` helper script to start our dev environment inside docker,

Secondly, we run the `start.sh` to preform `terrform apply` and start the cluster. 


This would create a cluster with 2 droplets with.

## Ansible workflow:

Provisioning the cluster is done through `ansible-playbook` 
but since our cluster was dyanamically created using `terraform`. 
The state is in the `terraform.tfstate` file To get it to ansible invesntory format. We use the [ `terraform-inventory` ](https://github.com/adammck/terraform-inventory) binary. 


The `run-ansible.sh` helper script is used to correctly call the `terraform-inventory` binary. 

To provision the master node we call 
```sh
$ ./run-ansible.sh ansible-playbook/master.yml
```
To provision the worker node we call 

```sh
$ ./run-ansible.sh ansible-playbook/worker.yml
``` 

## Accessing the k8 cluster: 

The `kubeconfig` file can be found in `./ansible-playbook/.data` 
Use `KUBECONFIG` environment variable to pass the location of the configuration file you want `kubectl` to use

```sh
#from the project root call
$ EXPORT KUBECONFIG=./ansible-playbook/.data/config 
```
