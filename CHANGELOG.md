# Changelog
All notable changes to this project will be documented in this file.
Format for entries is <version-string> - release date.

## 0.0.0 - 2024-09-24
- Created this project.

## 0.0.1 - 2024-09-25
- added the following operations
    - (norm v1)
    - (cross v1 v2)
    - (normalize v1)
    - (length v1)

## 0.0.2 - 2024-09-26
#### Updated the test
There are now two test files.
- native.janet
    - Test the accuracy of the math.
- inputs.janet
    - Test the input validation of the functions.
    - These test can still be expanded to include more inputs.
         
#### Dependencies
- Added the rvars module, used for generating testing data.  