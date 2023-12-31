######################
#   initialization   #
######################
init:
	pip install -U pip
	pip install pdm
	pdm install
	pdm run pre-commit install

#######################
#   static analysis   #
#######################
check: format lint

format:
	pdm run black .

lint:
	pdm run mypy .
	pdm run ruff . --fix

######################
#   docker compose   #
######################
spark-cluster:
	docker compose up -d

spark-cluster-clean:
	docker compose down -v
	docker rmi \
		simple-spark-flow-spark-master simple-spark-flow-spark-notebook \
		simple-spark-flow-data-generator simple-spark-flow-spark-livy \
		simple-spark-flow-data-uploader
