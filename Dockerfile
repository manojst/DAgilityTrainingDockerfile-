# Specifying the ubuntu base image
FROM ubuntu

# Updating ubuntu and installing other necessary software
RUN apt-get update --yes \
&& apt-get install wget build-essential zlib1g-dev libncurses5-dev vim --yes

# Set command to bash
CMD ["/bin/bash"]
