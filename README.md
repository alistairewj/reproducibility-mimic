# Reproducibility in MIMIC-III
This repository is evaluates the reproducibility of mortality prediction studies in the MIMIC-III database.
This study was presented at the Machine Learning in Healthcare (MLHC 2017) conference, and you can find the paper [here](http://proceedings.mlr.press/v68/johnson17a.html) ([pdf](http://proceedings.mlr.press/v68/johnson17a/johnson17a.pdf)).

# Using this repository

## Requirements

This repository assumes you have the MIMIC-III v1.4 database in a PostgreSQL database (v9.6+).

## Running the code

First clone this repository recursively: `git clone --recursive https://github.com/alistairewj/reproducibility-mimic.git`.

This repository depends on two others:

1. The `mimic-code` repository
2. The `mortality-prediction` repository

Cloning recursively will download these repositories at the appropriate commit. **These commits will be out of date**. If you want to use some of the data this code generates (e.g. hourly values), you should go to the [mimic-code](https://github.com/mit-lcp/mimic-code) repository instead, since everything is there and up to date.

Next, generate all the concepts in a PostgreSQL database by launching postgres in the `queries` subfolder and running: `\i make-all.sql`. You could equally run it from command line using `psql -f make-all.sql`. This query will take some time.

Once that is generated, you can run the notebooks present in the `notebooks` subfolder. These notebooks were built using Python 2.7, but should work in 3.5+ as well.

# Acknowledgement

This repository can be cited using the following persistent Digital Object Identifier (DOI):

[![DOI](https://zenodo.org/badge/97237814.svg)](https://zenodo.org/badge/latestdoi/97237814)

If you do find this repository useful in your work, we would be grateful if you would also cite our MLHC paper:

Johnson, A.E.W., Pollard, T.J. &amp; Mark, R.G.. (2017). Reproducibility in critical care: a mortality prediction case study. <i>Proceedings of the 2nd Machine Learning for Healthcare Conference, in PMLR</i> 68:361-376

```
@InProceedings{johnson17reproducibility,
  title = 	 {Reproducibility in critical care: a mortality prediction case study},
  author = 	 {Alistair E. W. Johnson and Tom J. Pollard and Roger G. Mark},
  booktitle = 	 {Proceedings of the 2nd Machine Learning for Healthcare Conference},
  pages = 	 {361--376},
  year = 	 {2017},
  editor = 	 {Finale Doshi-Velez and Jim Fackler and David Kale and Rajesh Ranganath and Byron Wallace and Jenna Wiens},
  volume = 	 {68},
  series = 	 {Proceedings of Machine Learning Research},
  address = 	 {Boston, Massachusetts},
  month = 	 {18--19 Aug},
  publisher = 	 {PMLR},
  pdf = 	 {http://proceedings.mlr.press/v68/johnson17a/johnson17a.pdf},
  url = 	 {http://proceedings.mlr.press/v68/johnson17a.html}
}
```
