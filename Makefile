PYENV_VERSION=3.10.13
PROJECT_NAME=create-hdb-entities-pipeline
PYTHONPATH=$(HOME)/Developer/${PROJECT_NAME}/src

setup_env:
	pyenv virtualenv ${PYENV_VERSION} ${PROJECT_NAME}
	pyenv local ${PROJECT_NAME}
	pip install pip==24.0
	pip install notebook==6.5.6
	pip install polars==1.8.2
	pip install pendulum==2.1.2

teardown_env:
	pyenv uninstall ${PROJECT_NAME}

qa_data_loader:
	python ${PYTHONPATH}/pipelines/qa/qa_data_loader.py