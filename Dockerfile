# Use an official Python runtime as a parent image
FROM jupyter/scipy-notebook

LABEL maintainer="Juan Cruz-Benito <juan.cruz@ibm.com>"

USER $NB_UID

COPY ./requirements.txt .

RUN conda update notebook ipython ipywidgets nbconvert && \
    conda install graphviz python-graphviz pydot poppler pillow && \
    pip install -U -r requirements.txt && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Downloading corpus for EN & ES languages provided by Spacy
RUN python3 -m spacy download en && \
    python3 -m spacy download es

# Installing Jupyter extensions
RUN pip install jupyter_contrib_nbextensions && \
    jupyter contrib nbextension install --sys-prefix && \
    jupyter nbextension disable hinterland/hinterland --sys-prefix && \
    jupyter nbextension disable nbextensions_configurator/config_menu/main --sys-prefix

# Enabling RISE extension
RUN jupyter nbextension enable rise
