# Code for Bayesian inference and model selection using information criteria

This repository contains research code used in the analysis related to the 
paper,

David J. Warne, Ruth E. Baker, Matthew J. Simpson. Using experimental data and
information criteria to guide model sellection for reaction-diffusion problems
in mathematical biology. To appear in Bulletin of Mathematical Biology, 2019.
Pre-print available from bioRxiv.org [DOI:10.1101/444679](https://doi.org/10.1101/444679)

## Developer
David J. Warne (david.warne@qut.edu.au), School of Mathematical Sciences, Science and Engineering Faculty, Queensland University of Technology.

Google Scholar: (https://scholar.google.com.au/citations?user=t8l-kuoAAAAJ&hl=en)

## Dependencies

The Bayesian sampling rountines depend on the [Monte Carlo Library (MCL)](https://github.com/davidwarne/MCL) 
and the [Stochastic Simulation Algorithm Library (SSAL)](https://github.com/davidwarne/SSAL)


## License
This source code is licensed under the GNU General Public License Version 3.MCL: Monte Carlo Library
Copyright (C) 2019  David J. Warne

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Contents

This repositoty contains a number aof programs, functions and scripts that are
designed to assist in reproducability of our work. It is important to note that 
some of our scripts depend on particular folder structures and Linux cluster 
system. Therefore some customisation will be required for different environments.
However, the code we provide should be sufficient to reproduce all of our results.

```bash
The following are descriptions of the contents of each folder
|-- ABCSampling          Contains ABC sampling examples for the models we consider in the paper
|-- ClusterScripts       Examples of batch submission and postprocessing of ABC samplers
|-- InformationCriteria  MATLAB script the computes AIC, BIC and DIC from postprocessed data
|-- Plotting             Various plotting functions for reaction-diffusion model evolution and posterior density plots
```
