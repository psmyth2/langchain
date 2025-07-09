# LangChain + LangSmith DevContainer Environment

This repository provides a containerized Python 3.11 environment for working with [LangChain](https://www.langchain.com/) and [LangSmith](https://docs.smith.langchain.com/) for tracing, based on the official LangChain LLM Chain tutorial.

It is designed for use with Visual Studio Code DevContainers and Docker to streamline setup and eliminate local Python configuration issues.

## Prerequisites

Before you begin, install the following tools if you don't already have them:

- [Docker Desktop](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/psmyth2/langchain.git
cd langchain
````

### 2. Open in Visual Studio Code

Launch VS Code and open the folder you just cloned.

### 3. Rebuild and open the Dev Container

Open the Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P` on macOS) and run:

```
Dev Containers: Rebuild and Reopen in Container
```

This command will:

* Build the Docker container defined in `Dockerfile`
* Create a Python 3.11 environment using the dependencies in `environment.yml`
* Open the VS Code workspace inside the container

## API Key Configuration

You will need API keys from both:

* [OpenAI](https://platform.openai.com/account/api-keys)
* [LangSmith](https://smith.langchain.com/)

To configure your environment:

1. Copy the example configuration file:

   ```bash
   cp example_config.ini config.ini
   ```

2. Edit `config.ini` and fill in your keys:

   ```ini
   [langsmith]
   tracing = true
   api_key = YOUR_LANGSMITH_API_KEY
   project = YOUR_PROJECT_NAME

   [openai]
   api_key = YOUR_OPENAI_API_KEY
   ```

Note: `config.ini` is excluded from version control via `.gitignore`.

## Tutorial Notebook

The notebook `langchain.ipynb` is included as a starting point for running the steps in the [LangChain LLM Chain tutorial](https://python.langchain.com/docs/tutorials/llm_chain/). It is pre-configured to work within the container environment using the API keys you will provide in your `config.ini`.

## Notes

* The Python environment includes `langchain-core`, `openai`, `langsmith`, Jupyter, and other useful libraries.
* The `langchain.ipynb` notebook can be run straight from vscode in your container, but you will need to tell it to use the `langchain` python11 environment
* JupyterLab is also exposed on port 8888 if you prefer to launch notebooks from the browser.