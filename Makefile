emacs ?= emacs
CASK ?= cask
BEMACS = $(emacs) -batch -l elpa/elpa.el
LOAD = -l lispyville.el

cask:
	$(shell EMACS=$(emacs) $(CASK) --verbose --debug)
	$(CASK) update

test:
	@echo "Using $(shell which $(emacs))..."
	$(BEMACS) -l lispyville-test.el $(LOAD) -f ert-run-tests-batch-and-exit

clean:
	rm -f *.elc

.PHONY: cask test clean
