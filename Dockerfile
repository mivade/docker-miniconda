FROM continuumio/miniconda3:4.10.3

RUN useradd conda --home-dir /home/conda --create-home
RUN chown -R conda /opt/conda
USER conda
RUN conda update conda
RUN /opt/conda/bin/conda init
RUN /opt/conda/bin/conda clean -faipy
RUN /opt/conda/bin/conda install -y pip
CMD ["/opt/conda/bin/python3"]
