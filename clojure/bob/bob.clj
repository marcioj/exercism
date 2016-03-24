(ns bob)
(require '[clojure.string :as string])

(defn -silent? [msg]
  (= "" (string/trim msg)))

(defn -yell? [msg]
  (and (re-find #"[a-zA-Z]" msg) (= msg (string/upper-case msg))))

(defn -question? [msg]
  (string/ends-with? msg "?") )

(defn response-for [msg]
  (cond
    (-silent? msg)"Fine. Be that way!"
    (-yell? msg) "Woah, chill out!"
    (-question? msg) "Sure."
    :else "Whatever."))
