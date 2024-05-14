#pull official base image

FROM python:3.12.3-slim

#set the working directory inside the container
WORKDIR /usr/src/WebProject

#set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

#install system dependencies
RUN apt-get update && apt-get install -y netcat-traditional

#install dependenscies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

#copy entrypoint.sh
COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/WebProject/entrypoint.sh
RUN chmod +x /usr/src/WebProject/entrypoint.sh

#copy project
COPY . .

#Specify the entrypoint script
ENTRYPOINT ["/usr/src/WebProject/entrypoint.sh"]