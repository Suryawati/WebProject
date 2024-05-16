#pull official base image

#Use an official Python runtime as a parent image
FROM python:3.12.3-slim

#set the working directory inside the container
WORKDIR /usr/src/app

#set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1

#install system dependencies
RUN apt-get update && apt-get install -y netcat-traditional

#install dependenscies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

#copy entrypoint.sh
COPY entrypoint.sh .
RUN sed -i 's/\r$//g' /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

#copy project from the current directory into the container at /app
COPY .. /app

#Specify the entrypoint script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]