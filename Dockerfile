FROM jupyter/base-notebook:python-3.9

# Create a new directory for Jupyter Notebook
RUN pip install -U setuptools
# COPY  ./ ./
# RUN pip install -r requirements.txt
# RUN pip install pickle
RUN pip install matplotlib
RUN pip install numpy


COPY  ./files /home/jovyan/

RUN pip install jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --user
# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Run Jupyter Notebook on container start
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser"]

CMD ["jupyter", "notebook", "--NotebookApp.token=", "--NotebookApp.max_buffer_size=2000000000"]
