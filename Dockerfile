FROM python:3.7-slim

RUN apt-get update -y && apt-get clean

WORKDIR /opt/aws_prometheus_exporter

COPY setup.py /opt/aws_prometheus_exporter/

RUN pip3 install --upgrade setuptools

RUN pip3 install .

COPY aws_prometheus_exporter/*.py /opt/aws_prometheus_exporter/

EXPOSE 9000

ENV PYTHONPATH="/opt"

ENTRYPOINT ["python", "-u", "/opt/aws_prometheus_exporter", "-p", "9000", "-f", "/mnt/metrics.yaml", "-s", "300"]
