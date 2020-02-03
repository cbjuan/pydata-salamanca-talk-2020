# Use an official Python runtime as a parent image
FROM jupyter/scipy-notebook

LABEL maintainer="Juan Cruz-Benito <juan.cruz@ibm.com>"

USER $NB_UID

RUN conda update notebook ipython ipywidgets nbconvert && \
    conda install graphviz python-graphviz pydot poppler pillow && \
    conda uninstall numpy --force && \
    pip install -U papermill  && \
    pip install -U nxpd && \
    pip install -U cvxpy && \
    pip install -U autopep8 && \
    pip install -U RISE && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Installing Jupyter extensions
RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --sys-prefix && \
    jupyter nbextension disable hinterland/hinterland --sys-prefix && \
    jupyter nbextension disable nbextensions_configurator/config_menu/main --sys-prefix

# Enabling RISE extension
RUN jupyter nbextension enable rise
