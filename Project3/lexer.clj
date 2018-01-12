; *********************************************
; *  341 Programming Languages                *
; *  Fall 2017  - Project 1                   *
; *  Author: Yakup Genc     				  *
; *  Student Name: Gökçe Demir				  *
; *  Student Id: 141044067					  *
; *********************************************

(use '[clojure.string :only (join split)])
(use '[clojure.string :only (split)])
(require '[clojure.string :as str])

;;Coffee	– Syntax	
;;Terminals:
(def keywords '("and" "or" "not" "equal" "append" "concat" "set" "deffun" "for" "while" "if" "then" "else" ))
(def operators '("+" "-" "/" "*" "(" ")"))
(def binaryValue '("true" "false"))
(def Id '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"
           "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z") )


(defn convertInt
   "Convert string to integer value"
  [number-string]
  (try (Integer/parseInt number-string)
       (catch Exception err nil)) )

(defn convertChar [identfr]
	"convert string to identifer value"
  (def listem '())
  (dotimes [i (count identfr)]
    (if-not (= (.indexOf Id (str (nth identfr i))) -1) (def listem (conj listem true)))
  )
  (if (= (count listem) (count identfr)) true)   ;;eger gelen arguman identifer ise true dondurur..


  )
;;take a file name and perform lexical analysis of the program contained within this file
(defn lexer
  "Reads a file containing one expression per line."
  [filename]
  (def printlist '())
  (def myfile ( str(slurp filename)))  ;;dosyayi okuma
  (def line (str/replace myfile "(" "( "))    ;;dosyayi okuyup liste atar, parentez oncesi ve sonrasi bosluk atar
  (def nline (str/replace line ")" " ) "))     ;; bosluk ekler
  (def endline (split nline #"\s+"))         ;; her bir karekteri ayirma


  (dotimes [i (count endline)]    ;;listeleri kontrol etme
    (cond
      (not= (.indexOf operators (nth endline i)) -1) (def printlist (conj printlist (str (nth endline i) " : Operator Value.")))
      (not= (convertInt (nth endline i)) nil) (def printlist (conj printlist (str (nth endline i) " : Integer Value.")))
      (not= (.indexOf keywords (nth endline i)) -1) (def printlist (conj printlist (str (nth endline i) " : Keyword.")))
      (not= (.indexOf binaryValue (nth endline i)) -1) (def printlist (conj printlist (str (nth endline i) " : Binary Value.")))
      (not= (convertChar (nth endline i)) nil) (def printlist (conj printlist (str (nth endline i) " : Identifier value.")))
      :else (println (nth endline i) "ERROR")
      )
       )


  ;;print etme
  (dotimes [i (count printlist)]
    (println (nth (reverse printlist) i)))
  )

;;function call
(lexer "CoffeeSample.coffee")

