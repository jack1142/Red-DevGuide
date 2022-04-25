Making dependency changes
=========================

Updating Python package dependencies
------------------------------------

To update all dependencies, script for bumping deps (``tools/bumpdeps.py``) should be used.

When updating dependencies:

- Verify that all code commented with ``DEP-WARN`` is not affected by the new dependency versions
- Read the changelogs for dependencies to make sure there are no (breaking) changes
  that may affect our code
