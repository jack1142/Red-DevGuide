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
if "%1" == "compiledeps" goto compiledeps
if "%1" == "livehtml" goto livehtml
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
echo.  compiledeps to update requirements.txt files to adhere to dependencies
echo.              declared in requirements.in files (with minimal version changes).
echo.  livehtml    to serve dirhtml documentation locally and auto-build on changes.
goto end

:bumpdeps
call :ensurevenv
echo.- Upgrading requirement files
venv\Scripts\pip-compile --quiet --upgrade
venv\Scripts\pip-compile --quiet --upgrade dev-requirements.in
call :aftercompiledeps
goto end

:compiledeps
call :ensurevenv
echo.- Compiling requirement files
venv\Scripts\pip-compile --quiet
venv\Scripts\pip-compile --quiet dev-requirements.in
call :aftercompiledeps
goto end

:livehtml
call :ensurevenv
venv\Scripts\sphinx-autobuild -b dirhtml -d %BUILDDIR%\doctrees %SOURCEDIR% %BUILDDIR%\dirhtml %SPHINXOPTS% %O%
goto end

:aftercompiledeps
venv\Scripts\pre-commit run mixed-line-ending --files requirements.txt dev-requirements.txt >nul
git diff -U1 -- requirements.txt dev-requirements.txt
echo.
call :ensurevenv
goto :eof

:end
popd
