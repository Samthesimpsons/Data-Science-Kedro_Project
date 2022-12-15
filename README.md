# Data-Science-Sample

Sample Data Science Project. I learnt the following practises during my first job as a data scientist in DBS. Note the content are mainly derived from Lecia Lim who works at DBS, full credit to her.

The tutorial on OOP is a refresher compiled from Corey Schafer YouTube playlist on OOP.

# Pre-requisites

- Understand git (Setting up from a fresh repository, or pushing local files to existing repository, branching, reverting file changes, gitignore, ..)
- Classes and OOP (there is a tutorial under `notebooks/OOP.ipynb`)
- Error Handling (there is a tutorial under `notebooks/errorHandling.ipynb`)
- Bash scripting

# 1. Folder Structure

This is an overview of the folder structure

```python
sample_project
├───README.md # markdown file that includes instructions to the project
├───requirements.txt # package requirements
├───lint.sh # script to run to lint source codes
├───pip.sh # script to run to install the packages in requirements.txt
├───test.sh # script to run to run test units of each script in tests
├───docs # sphinx auto-documentation from docstrings
├───data # local directory for any temp data (do not push to github, set in .gitignore)
├───logs # logs files
├───notebooks # all the jupyter notebooks
├───src # all the relevant files
│   ├───data_processing
│   ├───eda
│   ├───feature_engineering
│   ├───modeling
│   ├───model_monitoring
│   ├───pipelines
│   └───utils
│       └───load_config.py # functions to load
└───tests # unit test codes, mirrors the src folder
    ├───data_processing
    ├───eda
    ├───feature_engineering
    ├───modeling
    ├───model_monitoring
    ├───pipelines
    └───utils
└───conf # yaml files
    └───base # configurations that are reused across team members
        ├───catalog.yaml # data catalog
        ├───parameters.yaml # parameters config
    └───local # configurations that are specific to the user such as credentials
        └───credentials.yaml # do not push to github, set in .gitignore
└───main.py # main script for deployment
```

# 2. PEP Coding Conventions

Watch: https://www.youtube.com/watch?v=D4_s3q038I0

Documentation: https://peps.python.org/pep-0008/

- Variables: hello_world (do not use camelCase)
- Constants: HELLO_WORLD (use caps, below import statements)
- Modules (python files): pep8.py
- Functions: hello_world()
- Class/Exception: HelloWorld (PascalCase)

**Spacing & Naming conventions:**

```python
class Test:
    pass


class Foo: # 2 blank lines
    def __init__(self):
        pass

    @classmethod # 1 blank line
    def cls_method(cls):
        pass


def bar(): # 2 blank lines
    pass
```

**Importing modules:**

```python
import os
import sys # different line
from os import path, stat # same line if from same module
```

**BONUS:**

```python
# Correct
foo = "bartender"

if foo.startswith("bar"):
    pass

# Wrong
if foo[:3] == "bar":
    pass
```

Nevertheless we can use auto formatter like `black` which reformats the files in-place with their own PEP8 compliant coding style.

# 3. Docstring Conventions

Google style docstring: https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html

```python
def sum_integers(num1: int, num2: int) -> int:
    ''' Add up two integer numbers.

    This function simply wraps the ``+`` operator,and does not do anything intersting.

    Args:
        num1 (int): First number to add
        num2 (int): Second number to add

    Returns:
        int: The sum of ``num1`` and ``num2``.

    Raises:
        AnyError: If anything goes wrong.
    '''
    return num1 + num2
```

Advanced typing: https://docs.python.org/3/library/typing.html

```python
# Specify the dictionary contains keys of `str` type and values of `int` type
def sum_dict(var: dict[str, int]):
    return sum(var[key] for key in var.keys())

# Using unions that allows set of diffent types for a single assignment
from typing import Union, Optional

def add(x: Union[int, float], y: Union[int, float]) -> Union[int, float]:
    return x + y

# Optional parameters
def add(x: int, y: int, op: Optional[str]) -> int:
    return x + y

def add(x: int, y: int, op: Union[None, str]) -> int:
    return x + y
```

# 4. Linting Pre-hook

Make sure current working directory is where git is initialized. Then check if the `hooksPath` is set up by running:

```bash
$ git config core.hooksPath
```

If nothing is returned, means the config needs to be updated. Inside the `.git/config` hidden file, set another line under `[core]`:

```sh
[core]
	hooksPath = ~/OneDrive/Desktop/DS_Project/.git/hooks
```

Re-run the previous command to check if the path exists.

Now to do our own pre-commit hooks, create the following script `~/OneDrive/Desktop/DS_Project/.git/hooks/pre-commit.sh` with the following content:

```bash
# Pre-commit hooks to lit code before each commit takes place.
echo "Running lint.sh before commit"
bash ~/OneDrive/Desktop/DS_Project/lint.sh
echo "Running lint.sh completed!"
```

Then in `lint.sh` file specify the following content:

```bash
# Linting script
echo "--------- Formatter with black ---------"
black ~/OneDrive/Desktop/DS_Project/src/ --line-length=88 --preview
echo "--------- Linting with flake8 ---------"
flake8 ~/OneDrive/Desktop/DS_Project/src/ --max-line-length=88
echo "--------- Type checking with mypy ---------"
mypy ~/OneDrive/Desktop/DS_Project/src/
```

# 5. Sphinx Documentation

https://www.youtube.com/watch?v=qRSb299awB0

```bash
sphinx-quickstart docs # Answer the questions

cd docs/

make html

cd build/html

python -m http.server
```

Convert the restructured text to markdown

```bash
pip install rst-to-myst[sphinx]

# Back in root directory
rst2myst convert docs/**/*.rst

# Then delete the rst file, since the md version exists
```

Under the `conf.py` in source, add `myst_parser`. Now we need sphinx to use myst_parser to parse our `index.md` markdown file in source. First we need install `myst-parser`.

```bash
pip install myst-parser
```

```
# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "myst_parser",
]
```

Then now running `make html` should work again. However, it is tedious to keep redoing these steps if we were to edit the `index.md` in our source folder. So we use automate it using `sphinx-autobuild`.

```bash
pip install sphinx-autobuild

# Back in root directory
sphinx-autobuild docs/source/ docs/build/html
```

```bash

# 6. TODO

- YAML configurations
- IO class?
- Unit testing
```
