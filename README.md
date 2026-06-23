# nodejs-ecs-deploy

To Install Required Packages use the following commands
    sudo apt install nodejs
    sudo apt install npm
Verify the Installed packages:
    node --version
    npm --version

Run this command to start the web app
    node main.js

Setup the Reqired Infrastructure the deploy the web app using terrraform

terraform init -backend-config=backends/dev.tfbackend

terraform plan -var-file=vars/live.tfvars


        

