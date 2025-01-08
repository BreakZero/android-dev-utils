SHELL := /bin/bash

push:
	@branch=$(shell git branch --show-current); \
	if [ "$$branch" = "main" ]; then \
		echo "On main branch, proceeding with tag push."; \
		git tag $(tag); \
		git push origin refs/tags/$(tag); \
		echo "Tag $(tag) pushed to origin."; \
	else \
		echo "Not on main branch. Skipping tag push."; \
		exit 1; \
	fi
