# Data-Science-Sample

Sample Data Science Project

# Pre-requisites

- Understand git commands (Setting up from a fresh repository, or pushing local files to existing repository, branching, reverting file changes, ..)
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

- Variables: hello_world (do not use camelCase)
- Constants: HELLO_WORLD (use caps, below import statements)
- Modules (python files): pep8.py
- Functions: hello_world()
- Class/Exception: HelloWorld (PascalCase)

  **Naming conventions:**

```python
class Test:
   def test(self):
       pass

   @classmethod
   def cls_method(cls):
       pass
```

**Spacing conventions:**

```python
class Test:
    pass


class Foo: # 2 blank lines
    def __init__(self):
        pass

    def foo(self): # 1 blank line
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

Nevertheless we can use auto formatter like `black`.

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

TODO

# 6. TODO

- YAML configurations
- IO class?
- Unit testing
- Sphinx Documentation
- Error Handling
