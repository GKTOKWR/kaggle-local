FROM condaforge/miniforge3:latest

RUN apt update && \
    apt install -y build-essential


COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

RUN mkdir /home/work

EXPOSE 8888
CMD ["jupyter", "notebook", \
     "--port=8888", \
     "--ip=0.0.0.0", \
     "--allow-root", \
     "--no-browser", \
     "--NotebookApp.token=''", \
     "--NotebookApp.notebook_dir='/home/work'"]