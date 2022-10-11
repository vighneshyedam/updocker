From python:3.10.6

RUN pip install --upgrade pip

ARG USERNAME=shady19
ARG USER_UID=1000
ARG USER_GID=1000

RUN mkdir test
RUN groupadd -g $USER_GID $USERNAME 

RUN useradd -u $USER_UID -g $USER_GID -m $USERNAME 
   
RUN chown -R $USERNAME:$USERNAME test/


COPY --chown=$USERNAME:$USERNAME requirements.txt test/requirements.txt
COPY --chown=$USERNAME:$USERNAME Dockerfile test/Dockerfile
COPY --chown=$USERNAME:$USERNAME app.py test/app.py
WORKDIR test/
USER $USERNAME
