# Oh, Well.
### A predictive analysis of rate of penetration as a function of drilling parameters of offshore wells

#### Overview
Offshore drilling can be a time-, labor-, and resource- intensive endeavor. Investment into new underwater rigs poses unique challenges to financiers, as tens of thousands of feet and rock must be displaced before acquisition of the precious oil. Luckily, insight gleaned from careful analysis of empirical data can minimize cost, ultimately maximizing profit and ensuring a competitive market position for the data fluent. Here, we attempt to model the role of controllable and preexisting drilling parameters in determining the rate of penetration in drill sites. With this model, we hope to assist in the creation of of the ultimate ‘Drilling Roadmap’,

#### Our Workflow
##### Step 0: Cleaning and Understanding Data
We started out by learning how to interpret the data through the data dictionary file, including the data types and meaning. Much of the data was encoded as strings, so we parsed numbers from longer strings and from doubles casted as strings. We then converted categorical variables to dummy variables using one-hot encoding.

##### Step 1: Exploring Scope of Data and Cartesian Products
To start feeling out relationships between the variables, we set up Cartesian cross products: we ran a double nested for-loop and paired up every variable with every other variable, although most of our focus was on the pairs linking x regressors to ROP. Using these coordinates, we built scatter plots to look for trends and correlations between every parameter and the ROP.

![Preliminary exploration](figures/Picture1.jpg)

We had a hunch that wellbore ID might be a significant categorical factor important to other x regressors and the ROP, and investigated further. We resolved to ask whether the test data would exclude the wellbore ID’s we had seen so far entirely.

##### Step 2: Segmenting Data
In order to understand and reduce shrinkage of the model when being tested, we split the provided training data further into our own train and test data, with 85% of the original training staying training and 15% acting as our “test” data. Then, we converted 15% of our training data into validation data.

##### Step 3: Exploring Potential Models
Not seeing a simple linear or exponential correlation, we decided to try some more advanced statistical models, including: 
Lasso model: We started out by running a simple model with default parameters, and, expectedly, achieved a high RMSE,  around 35.14 for the training data. To improve our accuracy, we performed hyperparameter tuning to determine which model architecture might suit our needs.


