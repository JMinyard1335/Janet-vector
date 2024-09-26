(declare-project
  :name "vector"
  :description ``This module provides a set of vector opertions for janet arrays using the c++ vector library``
  :version "0.0.2"
  :author "Jachin Minyard"
  :liscense "MIT"
  :dependencies ["https://github.com/JMinyard1335/Janet-rvars.git"])

(declare-native
  :name "vector"
  :source @["src/module.cpp"
            "src/operations.cpp"
            "src/conversion.cpp"]
  :include-dirs @["include"])
