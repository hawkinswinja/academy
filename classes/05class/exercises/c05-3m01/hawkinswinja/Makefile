export BUCKET_NAME ?= test
export RUNNER = docker compose run --rm 3m

create_bucket:
	@$(RUNNER) make _create_bucket
.PHONY: create_bucket

_create_bucket:
	@scripts/create_bucket.sh
.PHONY: _create_bucket

delete_bucket:
	@$(RUNNER) make _delete_bucket
.PHONY: delete_bucket

_delete_bucket:
	@scripts/delete_bucket.sh
.PHONY: _delete_bucket

list_buckets:
	@BUCKET_NAME=$(BUCKET_NAME) $(RUNNER) printenv
	@echo 'your buckets:'
	@$(RUNNER) aws s3 ls
.PHONY: list_buckets
