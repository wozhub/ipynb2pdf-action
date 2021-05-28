FROM jupyter/minimal-notebook

COPY entrypoint.sh /entrypoint.sh

USER root

RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER jovyan

ENTRYPOINT ["/entrypoint.sh"]
