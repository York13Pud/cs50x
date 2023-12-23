# dev.to Blog Statistics Collection And Visualization
#### Video Demo:  https://youtu.be/QKypKmI4NtI
#### Description:

The goal of this project is to collect stats from de.to's API using a Django web app and visualize with a Jupyter notebook.

##### Overview

For my final project, I have elected to create a solution to a problem I have had for a while. The website I use to write blog articles, dev.to, provides a selection of analytics but they are not very interactive. For example, it can be hard to read the number of views chart as none of the points on the chart show what the actual number of views is.

Other pain points include:

- Data is not granular enough (dauly total is the minimum)
- The interface has a habbit of crashing, requireing a refresh every 3-4 articles that you view stats for
- The total count doesn't update during the day
- Data is only available for the past 365 days. You cannot see beyond that

As a result, I propose that my final project will be built to address some of these points.

##### Requirements

The requirements I have identified for this project are:

- Gather article metrics every thirty minutes past each hour of the day from dev.to for all of my articles
- Store the data in a SQL database
- Visualise the data by:
    - Top 10 viewed articles by view count
    - Top 10 liked articles by liked count
    - Top 10 commented on articles by comment count
    - All views for all articles and be able to remove articles from the chart

##### Solution

The solution I have come up with is split into two parts:

Part one will collect the data using:

- dev.to's API that can gather the required information
- A Django web app will be used to do the following:
    - Create a user account that will store a users dev.to profile bio, along with:
    - A password for the web app
    - An API key that is used to access the dev.to API
- A view endpoint in the web app that is triggered using a Linux Cron job to run curl on that route every thirty minutes past each hour of the day that gathers the stats from the dev.to API.
- a SQLite database to store the processed data
    - Processing will include getting the last record for each article and working out the difference between that and the latest update to determine the change difference

- Uses the dev.to API to gather the information
- Use a Django web app to perform the data collection and processing
- Use a cron job to run curl to a route on the web app every thirty minutes past the hour
- Store the data in a SQLite database

Part two is to visualise the data by:

- Using a Python Jupyter notebook to analyse the data in the SQLite database
- Collecting the data from the database using the SQLite3 library and SQL queries
    - The SQL queries are stored in a separate file to help keep the notebook tidy
- Using Pandas to model the data into data frames to allow for easy interaction with the data
- Using Plotly to create the charts required

In this project folder, there are two folders:

- jp_notebook - This has the Jupyter notebook and modules, along with a YAML file to restore the environment.
- python-project-dev-to-stats2 - This contains the Django web app.

Both folders have a README.md file containing the instructions on how to use them.

##### Installation and usage

###### python-project-dev-to-stats2

Change to the project folder

``` shell
cd python-project-dev-to-stats2
```

Create a new virtual environment

``` shell
python3 -m venv venv && source ./venv/bin/activate
```

Activate the virtual environment

``` shell
source ./venv/bin/activate
```

Install the required libraries and packages

``` shell
pip install -r requirements.txt
```

Perform the database migrations

``` shell
python3 manage.py makemigrations
python3 manage.py migrate
```

Run the application

``` shell
python3 manage.py runserver
```

Lastly, create a cron job with the settings show in cron_settings.txt

Once that is all done, the URL to use will be show.

You can create the users in the user portal. An API key from dev.to will be required.


###### jp_notebook

###### Using The Jupyter Notebook

Restore the conda environment

NOTE: miniforge, condaforge or anaconda must be installed first.

Open a terminal an `cd` to the folder where the notebook is saved.

Next, restore the environment using the below command:

``` shell
conda env create -f environment.yml
```

Once done, copy the notebook to that folder, along with the modules folder. and `cd` to the folder that has the conda environment in.

The name of the environment is called cs50x.

Activate the environment

``` shell
conda activate cs50x
```

Run the notebook

``` shell
jupyter-lab dev-to-stats.ipynb
```

Once the notebook is opened (automatically in your default browser), you will need to change the path to the database in section 3 of the notebook.
