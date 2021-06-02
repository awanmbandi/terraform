# Terraform Features

1) Import 
This gives you the ability to import resources from other templates 
==> You use terraform import function to import resources that were manually provisioned by indivuals on the console to your terraform framework.
==> Import Command: terraform import aws_instance.ec2_created_by_mbandi_manually_import i-0e59940341795dd74

2) Provisioners
Terraform has some provisioner plugins that it comes with that enables you to run 
some commands locally and remotely accross your EC2 infrasture. There's local and remote assets that means you can either run these commands locally or remotely (resources). There are few other provisioners like Chef, Puppet or Ansible.

    ==> Local exec: local exec gives you the ability to copy specific resource attributes or make use of them. You can also copy to a file locally (on your computer). You can as well refer to ++Local Provisioner as SCP's++


3) Modules
Modules gives you the ability to create resource functions (EC2, ALB, VPC, Security Group, Database etc) then incoporate all these functions as Modules, so we can access these functions or modules from a script or a software project.

4) Workspace
Workspace gives you the ability to define different workspace or virtual environments and resource configuration for all these environments using Terraform (example... Dev (t2.micro), Test (t2.mediium), PreProd (t2.larg)and Prod (t3.xlarg)).


5) Remote Backend
Storing your state file locally is not scalable becasue if multiple people are working on thesame project, it will be hard to share the state file accross manually. That's when Remote Backend comes in which we can use things like a server, s3 bucket or GitHub etc and give developers or engineers access. Which with a simple copy command they'll be able to make the state file available in their local or if they're using CI/CD.


6) Alias
This enables you to carry out enterprise deploymnets like deploying resources accross multiple regions and environment. 


7) List & Count


8) Refresh
It update the state file with the aws resource current configuration or state (Resource on the console). So when you're running terraform plan, there's a refresh that takes place on the flight while you're running the command. It does a comparison with the terraform state file, the aws resource file and the current resources on the console from 