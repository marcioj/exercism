(ns anagram
  (:require [clojure.string :as string]))

(def normalize-word #(sort (string/lower-case %)))

(defn- valid-anagram?
  [sorted-word word]
  #(and (not= (string/lower-case word) %) (= sorted-word (normalize-word %))))

(defn anagrams-for
  [word words]
  (let [sorted-word (normalize-word word)]
    (apply vector (filter (valid-anagram? sorted-word word) words))))
