FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

CMD ["sh", "-c", "mlflow server --host 0.0.0.0 --port ${PORT:-5000} --backend-store-uri \"$DATABASE_URL\" --serve-artifacts --artifacts-destination \"$MLFLOW_ARTIFACT_URI\""]