# Pinned last stable version
FROM jupyter/datascience-notebook:latest

ENV JUPYTER_ENABLE_LAB yes

ADD requirements.notebook.txt /home/jovyan/

RUN pip install -r /home/jovyan/requirements.notebook.txt