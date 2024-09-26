# This file is ment to test the input of different Janet types into the vector operations
# By default, the vector operations are meant to take in Janet arrays of Janet numbers. 
# These are then converted into a c++ vector of doubles.
# The vector functions should only take arrays of numbers and that are not nested.
# Since all of the vector functions use the same function on the backend to unwrap and validate the input, we only need to test one of the functions but cover a wide range of input types. 
# This file requires rvars module to generate random inputs for the tests.
# This module can be found at 

(import ../build/vector :as vec)
(import rvars :as rv)
(var errs 0)
(def num-test 1000)
(def num-functions (* 13 11))

(defn test-assertion [f]
  (try
    (f)
    ([e]
      (set errs (+ errs 1)) true)))


# Test all the inputs of the vector functions
# The vector functions should only take arrays of numbers and that are not nested.
(defn test []
  (for i 0 num-test

    # Dot Product
    (test-assertion (fn [] (vec/dot (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/dot (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Elementwise Addition
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/el-add (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Elementwise Subtraction
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/el-sub (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Elementwise Multiplication
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/el-mult (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Length
    (test-assertion (fn [] (vec/length (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "buffer" 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/length (rv/gen-rand-array "struct" 3))))

    # Norm
    (test-assertion (fn [] (vec/norm (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "table" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/norm (rv/gen-rand-array "buffer" 3))))

    # Normalize
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "table" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/normalize (rv/gen-rand-array "buffer" 3))))

    # Cross Product
    (test-assertion (fn [] (vec/cross (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/cross (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Outer Product
    (test-assertion (fn [] (vec/outer (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/outer (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Scaler addition
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/sc-add (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))

    # Scaler Mult
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-int 0 10) (rv/gen-rand-int 0 10))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-double 0 10) (rv/gen-rand-double 0 10))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-string 10) (rv/gen-rand-string 10))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-buffer 10) (rv/gen-rand-buffer 10))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-bool) (rv/gen-rand-bool))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-table 3) (rv/gen-rand-table 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "string" 3) (rv/gen-rand-array "string" 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "bool" 3) (rv/gen-rand-array "bool" 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "table" 3) (rv/gen-rand-array "table" 3))))
    # This test creates a nested array of ints This should not pass as a vector is not a nested array.
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "array" 3) (rv/gen-rand-array "array" 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "tuple" 3) (rv/gen-rand-array "tuple" 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "struct" 3) (rv/gen-rand-array "struct" 3))))
    (test-assertion (fn [] (vec/sc-mult (rv/gen-rand-array "buffer" 3) (rv/gen-rand-array "buffer" 3))))))


(test)
(assert (not (= errs num-test)) (string/format "Every test should have failed, but %d tests passed" (- num-test errs)))
(printf "there were %d errors\n" (- (* num-test num-functions) errs))
