# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line
PYTHON        = python3.8
SPHINXOPTS    =
SPHINXBUILD   = ./venv/bin/sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help: ensurevenv
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@echo "---"
	@echo "  bumpdeps    to bump dependencies in requirement files."
	@echo "  compiledeps to update requirements.txt files to adhere to dependencies"
	@echo "              declared in requirements.in files (with minimal version changes)."

.PHONY: help bumpdeps compiledeps ensurevenv Makefile

# Note to whoever sees this in future:
# Using indentation before `ensurevenv` lines breaks this target
ifeq ($(wildcard ./venv/.),)
ensurevenv: newenv
else
ensurevenv: syncenv
endif

newenv:
	@echo "- Setting up the virtual environment"
	$(PYTHON) -m venv venv
	@echo "- Installing requirements into venv"
	./venv/bin/python -m pip install -r requirements.txt -r dev-requirements.txt
	@echo
	@echo "- Installing pre-commit hook"
	./venv/bin/pre-commit install
	@echo

syncenv:
	@echo "- Synchronizing requirements in venv"
	./venv/bin/python -m piptools sync requirements.txt dev-requirements.txt
	@echo

ensurevenv: ;

bumpdeps: ensurevenv
	echo.- Upgrading requirement files
	./venv/bin/pip-compile --quiet --upgrade
	./venv/bin/pip-compile --quiet --upgrade dev-requirements.in
	$(MAKE) aftercompiledeps

compiledeps: ensurevenv
	echo.- Compiling requirement files
	./venv/bin/pip-compile --quiet
	./venv/bin/pip-compile --quiet dev-requirements.in
	$(MAKE) aftercompiledeps

aftercompiledeps:
	-./venv/bin/pre-commit run mixed-line-ending --files requirements.txt dev-requirements.txt >/dev/null
	git diff -U1 -- ./requirements.txt ./dev-requirements.txt
	@echo
	$(MAKE) ensurevenv

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile ensurevenv
	@echo "- Building documentation"
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
