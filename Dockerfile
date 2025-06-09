FROM python:3.12-slim

RUN apt update && \
    apt install -y build-essential curl

# Install uv using pip
RUN pip install uv

COPY requirements.txt /tmp
RUN uv pip install --system -r /tmp/requirements.txt
RUN uv pip install --system torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

RUN mkdir /home/work

EXPOSE 8888
CMD ["jupyter", "notebook", \
     "--port=8888", \
     "--ip=0.0.0.0", \
     "--allow-root", \
     "--no-browser", \
     "--NotebookApp.token=''", \
     "--NotebookApp.notebook_dir='/home/work'"]