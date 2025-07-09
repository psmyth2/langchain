FROM mambaorg/micromamba:1.5.5

# Set working directory
WORKDIR /app

# Install git via apt
USER root
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy environment file and create environment
COPY environment.yml .
RUN micromamba env create -f environment.yml -n langchain && \
    micromamba clean --all --yes

# Activate environment by default
SHELL ["/bin/bash", "-c"]
RUN echo "source activate langchain" >> ~/.bashrc
ENV PATH /opt/conda/envs/langchain/bin:$PATH

# Expose JupyterLab port
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
