# Terraform to create simple AWS infrastructure and start docker 

** Notes: ** Install [terraform](http://www.terraform.io) and configure system to run it 

1. Crate file terraform.tfvars under src/main/infrastructure folder and add following values

    ```
    access_key= "your access key"
    
    secret_key= "your secret key"
    
    application= "your docker image name with version if needed"
    
    application_name= "your application name, this will be name of the docker process"
    
    key_name= "your aws key pair to access using ssh"
    
    aws_access_key_file_name= "access key file location, please place "
    ```

2. Run plan to view order of infrastructure execution

    ```
    terraform plan
    ```
    
3. Run apply to execute plan
 
    ```
    terraform apply
    ```



