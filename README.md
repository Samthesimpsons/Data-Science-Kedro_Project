# Data-Science-Sample

Sample Data Science Project based off Kedro Framework

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
├───test.sh # script to run to run test units
├───docs # sphinx auto-documentation from docstrings
├───data # local directory for any data
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
    └───base
        ├───catalog.yaml # data catalog
        ├───parameters.yaml # parameters config
    ├───local
        └───credentials.yaml (do not push to github, set in .gitignore)
└───main.py # main scriptfor deployment
```

