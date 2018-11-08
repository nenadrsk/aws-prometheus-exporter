FROM python:3.7-slim

RUN apt-get update -y && apt-get clean

WORKDIR /opt/aws_prometheus_exporter

COPY setup.py /opt/aws_prometheus_exporter/

RUN python -V

RUN pip install --upgrade pip

RUN pip install --upgrade setuptools

RUN pip install .

COPY aws_prometheus_exporter/*.py /opt/aws_prometheus_exporter/

EXPOSE 9000

ENV PYTHONPATH="/opt"

ENTRYPOINT ["python", "-u", "/opt/aws_prometheus_exporter", "-p", "9000", "-f", "/mnt/metrics.yaml", "-s", "300"]
