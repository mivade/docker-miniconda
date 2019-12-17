FROM debian:stable-slim AS build

RUN apt update && apt install -y wget
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -qO miniconda.sh
RUN chmod +x miniconda.sh && \
    ./miniconda.sh -b -p /opt/miniconda
RUN /opt/miniconda/bin/conda clean -faipy

FROM debian:stable-slim
COPY --from=build /opt/miniconda /opt/miniconda
WORKDIR /opt/miniconda
COPY ./entrypoint.sh .
RUN /opt/miniconda/bin/conda init
ENTRYPOINT ["/opt/miniconda/entrypoint.sh"]
CMD ["python3"]
