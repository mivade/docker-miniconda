FROM debian:stable-slim AS build

RUN apt update && apt install -y wget
RUN useradd conda --home-dir /home/conda --create-home
WORKDIR /home/conda
USER conda 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -qO miniconda.sh
RUN chmod +x miniconda.sh && ./miniconda.sh -b -p /home/conda/miniconda
RUN /home/conda/miniconda/bin/conda clean -faipy

FROM debian:stable-slim
SHELL ["/bin/bash", "-c"]
RUN useradd conda
USER conda
COPY --from=build /home/conda /home/conda
WORKDIR /
RUN /home/conda/miniconda/bin/conda init
CMD ["/home/conda/miniconda/bin/python3"]
