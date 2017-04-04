#!/bin/bash

echo "In wich cloud service do you want your DigitalOnUs DevOps Dashboard"
echo "[A] Amazon Web Services "
echo "[B] Google Cloud Engine"

read coption
LOWEROPTION=$(echo "$coption" | tr '[:upper:]' '[:lower:]')


if [[  $LOWEROPTION = "a" ]] ; then
	echo "You choose Amazon Web Services"

git clone -b develop https://github.com/DigitalOnUs/kubernetes-terraform-aws.git
# preguntar acces key
echo "please enter your acceskey"
read cacceskey

#preguntar secret key
echo "please enter your secret key"
read csecretkey

#ask pem name
echo "Please enter the pem file to use on AWS"
read cpemname

#Sed para cambiar acceskey y secret key
cd kubernetes-terraform-aws
sed -i -- "s/foo/$cacceskey/g" terraform.tfvars
sed -i -- "s|bar|$csecretkey|g" terraform.tfvars
sed -i -- "s/pem_name/$cpemname/g" terraform.tfvars
  
terraform plan
sleep 5
terraform apply





elif [[  $LOWEROPTION = "b" ]] ; then
	echo "You choose Google Cloud Engine"

else 
	echo "You only can choose option A or B Please Try again"
	read coption
	while [[ $LOWEROPTION != "a" ||  $LOWEROPTION != "b" ]]; do
                        echo "You only can choose option A or B Please Try again"
                        read coption
        done
	export coption

fi


         

