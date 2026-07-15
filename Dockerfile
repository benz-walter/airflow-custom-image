ARG AIRFLOW_IMAGE=oci.stackable.tech/sdp/airflow:3.0.6-stackable26.3.0@sha256:297ca0a8563f069994cec346b05d5df352a4619e5f52a7230c489d51b263f9b7

FROM ${AIRFLOW_IMAGE} AS production

USER root

# Requried by lightgbm
RUN microdnf install libgomp

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    rm requirements.txt

USER stackable
