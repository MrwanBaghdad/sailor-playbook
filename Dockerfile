FROM radekg/terraform-ansible
RUN wget https://github.com/adammck/terraform-inventory/releases/download/v0.9/terraform-inventory_0.9_linux_arm.zip &&\
    unzip terraform-inventory_0.9_linux_arm.zip 

ENTRYPOINT []
