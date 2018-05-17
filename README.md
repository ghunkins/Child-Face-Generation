## Child Face Generation

This is the second and final architecture in the workflow of the dual-architecture system designed for predicting child facial features from parental facial features.

<img src="https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/system.png?raw=true">

The two stage system is:

* (1) Extract an encoding of the parental features and find a mid-point encoding
* (2) Find a probabilistic mapping from this encoding to child features

For this project, we use [BEGAN](https://arxiv.org/abs/1703.10717) coupled with [spherical interpolation](https://en.wikipedia.org/wiki/Slerp) for Stage I and [Pix2Pix cGAN](https://arxiv.org/abs/1611.07004) for Stage II. 

See the full report [**here**](https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/Predicting_Child_Facial_Features_Hunkins.pdf).

### Requirements 
------

To install the requirements, an [Anaconda](https://anaconda.org/) environment is highly recommended:

`conda create --name <env> --file requirements_conda.txt`

Additionally, a `requirements.txt` file for pip installation is created. This method is not tested or recommended:

`pip install -r requirements.txt`

### Dataset
------

The dataset in the format required can be downloaded [here](https://drive.google.com/file/d/1QohxBlBYrUggThQDrfdNPo00dFYNPC_w/view?usp=sharing).

Before training the model, move this file to the `data/processed` folder.

See the **Parent Child in the Wild (PCW)** section below for more information on the dataset.

### Running :running:
------

Activate the environment:

`source activate <env>`

Then navigate to `src/models` and run:

`python main.py --backend tensorflow --dset cupidV --nb_epoch 400 --generator deconv --img_dim 128 32 32`

This is to train the model for 400 epochs with the deconvolutional method for a 128x128 and a 32x32 patch size.

### Trained Model
------

The full trained model can be downloaded [here]().

### Experiments & Representative Output
------

In the following images, the rows from top to bottom are: input interpolated parent facial features, predicted child facial features, ground truth. Below is a representative output from the deconvolutional method:

<img src="https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/deconv.png?raw=true" width=350>

The upsampling method was also tested, but returned subjectively worse results. Below is a representative output:

<img src="https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/upsample.png?raw=true" width=350>

### Parent-Child in The Wild (PCW)
-----

No suitable datasets containing a mother-father-child relationship for facial images was found. As such, via scraping and validation methods described in the [report](https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/Predicting_Child_Facial_Features_Hunkins.pdf), this dataset was created. 


Example family photo for creating the dataset:

<img src="https://github.com/ghunkins/Child-Face-Generation/blob/master/resources/dataset.png?raw=true" height=200>

Families are grouped and all facial images are cropped, aligned, and annotated with predicted gender and age. 766 families are available.

Download the raw data [here](https://drive.google.com/file/d/1UfkTFqGqVapUKIpBJVx7vSNjZzIEa84g/view?usp=sharing). 
