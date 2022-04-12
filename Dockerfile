FROM ubuntu:latest
WORKDIR root/scientific-computing/
COPY . .

RUN apt-get update \
	&& apt-get install -y wget \
	&& apt-get install -y python3-pip \
	&& pip3 install -r requirements.txt \
	&& wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
	&& bash miniconda.sh -b -p /miniconda \
	&& wget https://julialang-s3.julialang.org/bin/linux/x64/1.7/julia-1.7.2-linux-x86_64.tar.gz -O julia.tar.gz \
	&& tar -xvzf julia.tar.gz \
	&& cp -r julia-1.7.2 /opt/ \
	&& rm -r julia-1.7.2 \
	&& ln -s /opt/julia-1.7.2/bin/julia /usr/local/bin/julia \
	&& rm julia.tar.gz 

ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda \
	&& conda install -y jupyter \
	&& rm miniconda.sh

RUN julia julia-kernel-installation.jl \
	&& rm Dockerfile julia-kernel-installation.jl

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--NotebookApp.token=''","--NotebookApp.password=''"]

