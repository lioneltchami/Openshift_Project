FROM python:3.9-slim
WORKDIR /app
COPY ./api_server/* /app
RUN pip install -r requirements.txt
CMD ["python", "api.py"]
