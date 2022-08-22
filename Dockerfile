FROM continuumio/miniconda3:4.12.0

RUN useradd conda --home-dir /home/conda --create-home
RUN chown -R conda /opt/conda
USER conda
RUN conda update conda
RUN conda install -c conda-forge mamba -y
RUN /opt/conda/bin/conda init
RUN /opt/conda/bin/mamba install -y pip
RUN /opt/conda/bin/conda clean -faipy
RUN rm -f /opt/conda/conda-meta/*
CMD ["/opt/conda/bin/python3"]
