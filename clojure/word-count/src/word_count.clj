(ns word-count
  (:require [clojure.string :refer :all]))

(defn- clean-sentence
  [sentence]
  (filter #(not (empty? %)) (split (replace sentence #"[^\w]" " ") #" ")))

(defn- downcase-words
  [words]
  (map #(.toLowerCase %) words))

(def extract-words (comp downcase-words clean-sentence))

(defn word-count
  [sentences]
  (let [words (extract-words sentences)]
    (reduce (fn [memo word]
              (let [word-count (memo word 0)]
                (assoc memo word (inc word-count)))) {} words)))
