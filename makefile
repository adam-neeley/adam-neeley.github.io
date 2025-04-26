# Makefile — orchestrate Org-Publish from the shell

# which Emacs to use (override if you like)
EMACS ?= emacs

EMACS_FLAGS ?= -Q --batch

PUBLISH_SCRIPT := publish.el

ORG_PROJECT := org-site-all

.PHONY: all publish clean serve

all: publish

publish:
	@echo "Publishing org → html…"
	$(EMACS) $(EMACS_FLAGS) \
	  -l $(PUBLISH_SCRIPT) \
	  --eval="(org-publish-all t)" \
	  --kill
	@echo "Done. Output is in public/"

deploy: publish
	@echo "Deploying public/ → gh-pages branch…"
	git subtree push --prefix public origin gh-pages
	@echo "Done."

clean:
	@echo "Cleaning public/…"
	rm -rf public

serve:
	@echo "Serving public/ on port 8000…"
	cd public && python3 -m http.server 8000
