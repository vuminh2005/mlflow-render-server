FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["sh", "-c", "exec mlflow server \
  --host 0.0.0.0 \
  --port ${PORT:-10000} \
  --workers 1 \
  --backend-store-uri \"$DATABASE_URL\" \
  --serve-artifacts \
  --artifacts-destination \"$MLFLOW_ARTIFACT_URI\" \
  --allowed-hosts \"mlflow-tracking-server-vssx.onrender.com,localhost,127.0.0.1\""]