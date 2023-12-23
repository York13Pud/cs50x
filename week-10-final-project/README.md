# Using The Jupyter Notebook

## Restore the conda environment

NOTE: miniforge, condaforge or anaconda must be installed first.

Open a terminal an `cd` to the folder where the notebook is saved.

Next, restore the environment using the below command:

``` shell
conda env create -f environment.yml
```

Once done, copy the notebook to that folder, along with the modules folder. and `cd` to the folder that has the conda environment in.

The name of the environment is called cs50x.

## Activate the environment

``` shell
conda activate cs50x
```

## Run the notebook

``` shell
jupyter-lab dev-to-stats.ipynb
```

Once the notebook is opened, you will need to change the path to the database in section 3 of the notebook.
