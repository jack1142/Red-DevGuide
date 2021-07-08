@ECHO OFF

setlocal

pushd %~dp0

if "%PYTHON%" == "" (
	set PYTHON=py -3.8
)

REM Command file for Sphinx documentation

set SOURCEDIR=source
set BUILDDIR=build

if "%1" == "bumpdeps" goto bumpdeps
if "%1" == "" goto help

call :ensurevenv
set SPHINXBUILD=venv\Scripts\sphinx-build

echo.- Building documentation
%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:ensurevenv
if not exist venv (
	echo.- Setting up the virtual environment
	%PYTHON% -m venv venv
	echo.- Installing requirements into venv
	venv\Scripts\python -m pip install -r requirements.txt -r dev-requirements.txt
	echo.
	echo.- Installing pre-commit hook
	venv\Scripts\pre-commit install
	echo.
) else (
	echo.- Synchronizing requirements in venv
	venv\Scripts\python -m piptools sync requirements.txt dev-requirements.txt
	echo.
)
goto :eof

:help
call :ensurevenv
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
echo.---
echo.  bumpdeps    to bump dependencies in requirement files.
goto end

:bumpdeps
call :ensurevenv
echo.- Upgrading requirement files
venv\Scripts\pip-compile --quiet --upgrade
venv\Scripts\pip-compile --quiet --upgrade dev-requirements.in
venv\Scripts\pre-commit run mixed-line-ending --files requirements.txt dev-requirements.txt >nul
git diff -U1 -- requirements.txt dev-requirements.txt
echo.
call :ensurevenv
goto end

:end
popd
