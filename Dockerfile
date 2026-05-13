ARG AIRFLOW_IMAGE=oci.stackable.tech/sdp/airflow:3.0.6-stackable25.11.0@sha256:7a88a27a3f8c2db69a3f6f9dee4c409ad1136e8c9e0ea6ca02a63f6f7f627204

FROM ${AIRFLOW_IMAGE} AS production

USER root

# Requried by lightgbm
RUN microdnf install libgomp

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

USER stackable
