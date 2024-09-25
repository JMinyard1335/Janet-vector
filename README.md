# Vector
This is a simple wrapper for Janet that takes Janet arrays and runs vector operations on them through the c++ vector class.
At the time I created this I just wanted a simple way to run some basic linear algebra calculations in Janet and took an existing implementation
of vector operations I had in c++ and used the Janet C API to wrap that up into a Janet module. was there a better way to do this probably.
Was there already a module in Janet that can do some vector math sure I think spork/math has a few vector functions and as a bonus those are written in Janet.
but I wanted to attempt to create a vector focused module and in the future expand it out to include more matrix operations. 


## Installation
To install vector follow the following steps.

### Install jpm
You first need to make sure that the Janet package manager is installed on your system. 
A guide to install [jpm](https://janet-lang.org/docs/jpm.html).

### Clone the repo
Once you have jpm installed on your machine the next step is to clone the repo.
```
git clone https://github.com/JMinyard1335/Janet-vector.git
```

### Install
Once the repo is installed move in to the directory you cloned it into and run the following commands:
```
jpm build
jpm install
```

### Use in project
at this point if there are no errors you are good to import the module into your project.
```
(import vector :as vec)

(vec/el-add @[1 2] @[3 4])
```


## Guide
To use the module simple import it into a project as follows:
```
(import vector :as vec)

# element-wise operations.
(vec/el-add @[1 2 3] @[4 5 6]) # => @[5 7 9]
(vec/el-sub @[1 2 3] @[4 5 6]) # => @[-3 -3 -3]
(vec/el-mult @[1 2 3] @[4 5 6]) # => @[4 10 18]

# dot and outer product
(vec/dot @[1 2 3] @[4 5 6]) # => 32
(vec/outer @[1 2 3] @[4 5 6]) # => @[@[4 5 6] @[8 10 12] @[12 15 18]]

# scaler operations
(vec/sc-add @[1 2 3] 10) # => @[11 12 13]
(vec/sc-mult @[1 2 3] 10) # => @[10 20 30]
```

the functionality is currently very simple and straight forward but it got the job I needed done.
