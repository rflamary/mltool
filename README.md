mltool
======

Matlab/Octave Machine Learning Toolbox for linear classification with applications in Brain-Computer Interfaces (BCI). This toolbox is distributed with GPL license along a tutorial chapter Machine learning for BCI in the [book](). 

### Features

* Linear models
    * Linear Discriminant Analysis (LDA)
    * Support Vector Machine (SVM)
    * Logistic Regression (LR)
    * Ridge Regression (RR)
    
* Validation strategies
	* Hold-out
	* Random sampling
	* K-fold cross validation
	* Leave_one-out bootstrap
    
* Performance measures
	* Accuracy (ACC)
	* Area Under the ROC curve (AUC)
	* Cohen's Kappa (k)	
	* Means Square Error (MSE)
	* Correlation coefficient (corr)
    
* Demo Datasets
    * Motor Imagery (MI) with CSP features
    * P300 Speller with temporal features
    * ECoG finger movement prediction dataset

### Installation

* Download current version [here](https://github.com/flam157/mltool/archive/master.zip)
* Extract in a subfolder
* Add path to Matlab/Octave with "addpath(genpath('path-to-mltool'))" to execute any function in the toolbox

### Short Documentation

All functions in the toolbox contain detailled documentation with parameters definition.

* *classifier* folder contains all the linear models estimation functions (only binary classification)
* *performance* folder contains all the performance computation functions
* *validation* folder contains all the pvalidation loops
* *figures* folder contains the script used for generating figures in the chapter

### Aknowlegment

* MI Dataset is extracted from IIa, BCI competition IV and has been pre-precessed by Fabien Lotte.
* Linear SVM Solver Copyright 2006 Olivier Chapelle

### Contact

- [Rémi Flamary](http://remi.flamary.com/)
- [Alain Rakotomamonjy](http://asi.insa-rouen.fr/enseignants/~arakoto/)


