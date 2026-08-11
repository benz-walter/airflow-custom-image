ARG AIRFLOW_IMAGE=oci.stackable.tech/sdp/airflow:3.0.6-stackable26.7.0@sha256:72d6e8817159af47b681207d74c692aa22c05ee6a62a34dee800167da444963b

FROM ${AIRFLOW_IMAGE} AS production

USER root

# Requried by lightgbm
RUN microdnf install libgomp

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

USER stackable
