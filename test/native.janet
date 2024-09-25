(import ../build/Vectors :as vec)



# Seed the random number gernerator 
(var seed (math/rng (math/floor (os/clock))))
# This file is meant to test the following operations of the vector operations.
# The testing stragety here is to generate random vectors for each test
# The results are then compared with the results of running the equivalent map in Janet
# (vector/el-add v1 v2)
# (vector/el-mult v1 v2)
# (vector/el-sub v1 v2) 
# (vector/sc-add v1 n)
# (vector/sc-mult v1 n)
# (vector/dot v1 v2)
# (vector/outer v1 v2)

(defn generate-vector [len]
  (var v @[])
  (for i 0 len
    (let [val (math/rng-int seed 10000)]
      (array/push v val)))
  v)

(defn test-el-add [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          v2 (generate-vector size)
          expected (map + v1 v2)]
      (var results (vec/el-add v1 v2))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test-el-mult [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          v2 (generate-vector size)
          expected (map * v1 v2)]
      (var results (vec/el-mult v1 v2))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test-el-sub [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          v2 (generate-vector size)
          expected (map - v1 v2)]
      (var results (vec/el-sub v1 v2))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test-sc-add [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          n (math/rng-int seed 10000)
          expected (map (fn [x] (+ x n)) v1)]
      (var results (vec/sc-add v1 n))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test-sc-mult [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          n (math/rng-int seed 10000)
          expected (map (fn [x] (* x n)) v1)]
      (var results (vec/sc-mult v1 n))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test-dot [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          v2 (generate-vector size)]
      (var results (vec/dot v1 v2))
      (var expected (reduce2 + (map * v1 v2)))
      # account for the predicted map being nil instead of zero when the resulting dot product is zero
      (if (nil? expected)
        (set expected 0))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))


(defn test-outer [num-of-tests]
  (for i 0 num-of-tests
    (let [size (math/rng-int seed 10)
          v1 (generate-vector size)
          v2 (generate-vector size)]
      (var results (vec/outer v1 v2))
      (var expected (map (fn [x] (map (fn [y] (* x y)) v2)) v1))
      (assert (deep= results expected) (string/format "Test %d failed" i)))))

(defn test [runs]
  (test-el-add runs)
  (test-el-mult runs)
  (test-el-sub runs)
  (test-sc-add runs)
  (test-sc-mult runs)
  (test-dot runs)
  (test-outer runs))

(test 100)
