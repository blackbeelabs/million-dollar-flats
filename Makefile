PYENV_VERSION=3.10.13
PROJECT_NAME=create-hdb-entities-pipeline
PYTHONPATH=$(HOME)/Developer/${PROJECT_NAME}/src

setup_env:
	pyenv virtualenv ${PYENV_VERSION} ${PROJECT_NAME}
	pyenv local ${PROJECT_NAME}
	pip install pip==24.0 # as of 1 Jan 2024
	pip install polars==1.8.2 # as of 1 Nov 2024 - use the latest version
	pip install pyarrow==17.0.0 # as of 1 Nov 2024  - polars dependency
	pip install pendulum==3.0.0 # as of 1 Jan 2024
	pip install numpy==1.26.3 # as of 1 Jan 2024
	pip install scipy==1.12.0 # as of 1 Jan 2024
	pip install requests==2.28.2 # as of 1 Jan 2024
	pip install notebook==6.5.7 # Freeze this version - you need the notebook to run the ingestion code.

notebook:
	pip install seaborn==0.13.1 # as of 1 Jan 2024
	pip install matplotlib==3.8.3 # as of 1 Jan 2024


teardown_env:
	pyenv uninstall ${PROJECT_NAME}

qa_data_loader:
	python ${PYTHONPATH}/pipelines/qa/qa_data_loader.py