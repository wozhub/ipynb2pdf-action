FROM jupyter/minimal-notebook

# Needed to write output pdfs on GITHUB_WORKSPACE
USER root
RUN echo "jovyan ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Back to "normality"
USER jovyan

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
