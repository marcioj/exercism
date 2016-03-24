(ns rna-transcription)

(def nucleotides-map { "C" "G" "G" "C" "A" "U" "T" "A" })

(defn get-nucleotide [n]
  (let [result (get nucleotides-map (str n))]
    (if result result (throw (AssertionError.)))))

(defn to-rna [nucleotides]
  (clojure.string/join (map #(get-nucleotide %) nucleotides)))
