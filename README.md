# Reproducibility in MIMIC-III
Evaluating the reproducibility of mortality prediction studies in the MIMIC-III database

# How to run the code

First clone this repository recursively: `git clone --recursive https://github.com/alistairewj/reproducibility-mimic.git`.

This repository depends on two others:

1. The `mimic-code` repository
2. The `mortality-prediction` repository

Cloning recursively will download these repositories at the appropriate commit. **These commits will be out of date**. If you want to use some of the data this code generates (e.g. hourly values), you should go to the [mimic-code](https://github.com/mit-lcp/mimic-code) repository instead, since everything is there and up to date.

Next, generate all the concepts in a PostgreSQL database by launching postgres in the `queries` subfolder and running: `\i make-all.sql`. You could equally run it from command line using `psql -f make-all.sql`. This query will take some time.

Once that is generated, you can run the notebooks present in the `notebooks` subfolder. These notebooks were built using Python 2.7, but should work in 3.5+ as well.

# Acknowledgement

[![DOI](https://zenodo.org/badge/97237814.svg)](https://zenodo.org/badge/latestdoi/97237814)

You can cite the code in this repository using the above DOI.
