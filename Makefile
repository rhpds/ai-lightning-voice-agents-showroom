PORT ?= 8887
DOCS_DIR := $(shell pwd)
SITE_DIR := $(DOCS_DIR)/www

.PHONY: build serve clean

build:
	rm -rf $(SITE_DIR)
	npx antora site.yml --stacktrace

serve: build
	@echo "Serving at http://localhost:$(PORT)"
	python3 -m http.server $(PORT) --directory $(SITE_DIR)

clean:
	rm -rf $(SITE_DIR)
