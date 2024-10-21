.DEFAULT_GOAL := help
APPLICATION_TITLE := Semantic Release Sandbox \n ================
.PHONY: help
# See https://www.thapaliya.com/en/writings/well-documented-makefiles/
help: ## Display this help
	@awk 'BEGIN {FS = ":.* ##"; printf "\n\033[32;1m ${APPLICATION_TITLE}\033[0m\n\n\033[1mUsage:\033[0m\n  \033[31mmake \033[36m<option>\033[0m\n"} /^[%a-zA-Z_-]+:.* ## / { printf "  \033[33m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' ${MAKEFILE_LIST}

##@

##  ------------
##@ Action during release or pre-release
##  ------------

exec-release: ## acted during release (GitHub Action)
	@echo "===> $@ <==="
	@export NEXT_VERSION=${VERSION}
	@echo "${VERSION}" > version.txt
.PHONY: exec-release