.PHONY=help

ROOT_DIR = $(realpath .)

PACKAGES = beleza_app core external_dependencies home splash dashboard cart clube_boti disseminate news orders profile menu design_system http shared event_bus

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort


###
# Dependencies section
###

install:  ## Install dependencies
	@for i in $(PACKAGES); do \
		cd .. && cd $$i && flutter pub get; \
	done

upgrade:  ## Upgrade dependencies
	@for i in $(PACKAGES); do \
		echo "Upgrading $$i"; \
		cd .. && cd $$i && flutter pub upgrade; \
	done

clean:  ## Clean dependencies and build
	@for i in $(PACKAGES); do \
		echo "Cleaning $$i"; \
		cd .. && cd $$i && flutter clean; \
	done

clean-install: clean install ## Clean install

build-runner:  ## Run build runner with --delete-conflicting-outputs
	@for i in $(PACKAGES); do \
		echo "Building $$i"; \
		cd .. && cd $$i && flutter pub run build_runner build --delete-conflicting-outputs; \
	done

cache-repair:  ## Run flutter pub cache repair
	@for i in $(PACKAGES); do \
		echo "Building $$i"; \
		cd .. && cd $$i && flutter pub cache repair; \
	done

###
# Lint section
###
analyze:  ## Analyze files
	@flutter analyze
	@dartfmt ./ -n

formatter:  ## Format files
	@dartfmt -w .


###
# Tests section
###
test:  ## Run tests
	./tools/run_tests.sh

test-report:  ## Run tests with report output
	./tools/run_tests.sh --report


###
#	Build section
###
build: install analyze test  ## Install dependencies, analyze code and run tests
