DIRS = $(dir $(shell find . -maxdepth 2 -mindepth 2 -type f -name build.yml))
.PHONY: push force-push build forcebuild show-tag clean

OPTIONS ?=

build:
	@set -e; for d in $(DIRS); do linuxkit pkg build $(OPTIONS) "$$d"; done

forcebuild:
	@set -e; for d in $(DIRS); do linuxkit pkg build $(OPTIONS) --force "$$d"; done

clean:
