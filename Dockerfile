# Specifying the ubuntu base image
FROM ubuntu
    
# Name and email of the person who maintains the file
MAINTAINER Rosalind Franklin rosalind.franklin@sbgenomics.com
  
# Set working directory as "/"
WORKDIR /
  
# Updating ubuntu and installing other necessary software
RUN apt-get update --yes \
&& apt-get install wget build-essential zlib1g-dev libncurses5-dev vim --yes
   
# Pulling SAMTools from its repository, unpacking the archive and installing
RUN wget https://github.com/samtools/samtools/releases/download/1.2/samtools-1.2.tar.bz2 \
&& tar jxf samtools-1.2.tar.bz2 \
&& cd samtools-1.2 \
&& make \
&& make install
  
# Set command to bash
CMD ["/bin/bash"]
