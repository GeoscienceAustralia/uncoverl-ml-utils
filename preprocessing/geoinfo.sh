#!/usr/bin/env bash
#PBS -P ge3
#PBS -q express
#PBS -l walltime=20:00:00,mem=2GB,ncpus=1,jobfs=30GB
#PBS -l wd

module unload intel-cc
module unload intel-fc
module load python3/3.4.3 python3/3.4.3-matplotlib
module load hdf5/1.8.10 gdal/2.0.0
export PATH=$HOME/.local/bin:$PATH
export PYTHONPATH=$HOME/.local/lib/python3.4/site-packages:$PYTHONPATH
export VIRTUALENVWRAPPER_PYTHON=/apps/python3/3.4.3/bin/python3
export LC_ALL=en_AU.UTF-8
export LANG=en_AU.UTF-8
source $HOME/.local/bin/virtualenvwrapper.sh

# start the virtualenv
workon uncoverml

# the python command needs full path of the python script
geoinfo inspect /g/data/ge3/covariates/national_cat_LCC/ national_geoinfo.csv
