# Data-Science-Sample

Sample Data Science Project

# Pre-requisites

- Understand git commands (Setting up from a fresh repository, or pushing local files to existing repository, branching, reverting file changes, ..)
- Bash scripting

# 1. Folder Structure

This is an overview of the folder structure

```
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
        └───credentials.yaml (do not push to github, set in .gitignore)
└───main.py # main script for deployment
```

# 2. PEP Coding Conventions

Watch: https://www.youtube.com/watch?v=D4_s3q038I0

# 3. Docstring Conventions

Google style docstring: https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html

Advanced typing: https://docs.python.org/3/library/typing.html

# 4. Configurations

# 5. Linting Pre-hook

TODO

# 6. TODO

- Unit testing
- Sphinx Documentation
- Error Handling
