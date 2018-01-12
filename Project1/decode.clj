; *********************************************
; *  341 Programming Languages                *
; *  Fall 2017                                *
; *  Author: Yakup Genc     				  *
; *  Student Name: Gökçe Demir				  *
; *  Student Id: 141044067		HW01		  *
; *********************************************

;; utility functions 
(load-file "include.clj") ;; "c2i and "i2c"


(use 'clojure.java.io)
(use '[clojure.string :only (join split)])


;(def alphabet '(a b c d e))  ;"Test için bu alfabe kullanıldı.."
(def alphabet '(a b c d e f g h i j k l m n o p q r s t u v w x y z))


(defn read-as-list
	"Reads a file containing one word per line and returns a list of words (each word is in turn a list of characters)."
	[filename]
	; Implement this function...
    '((a b c) (d e f))
	(def myfile (slurp filename))
    (def tempfile (split myfile #"\n"))
    (def mylist '())
    (dotimes [i (count tempfile)] 
    	(def mylist (conj mylist (seq(nth tempfile i) ) ) ) )
	
	(reverse mylist)
)
;; -----------------------------------------------------
;; HELPERS
;; *** PLACE YOUR HELPER FUNCTIONS BELOW ***


(defn my_permutations
	"This function creates cipher alphabet using permutations function. 26! "
  	[param]
  	(lazy-seq
   	(if (seq (rest param))
    	(apply concat (for [g param]
                    (map #(cons g %) (my_permutations (remove #{g} param)))))
  	[param]))
)

;; ----------------------------------------------------

(def readfile (slurp "deneme.txt"))
(def readfile (split readfile #"\n"))

(defn spell-checker-0 
	[word read_file]
	;you should implement this function

	(def result (.contains read_file word ) ) ;; readfile icinde word olup olmadıgına bakar
	 (if (= result true) true false)
	
)

(defn my_decoder
	[word my_map]

	(def decodeword (atom ""))
	(dotimes [k (count word)]
		(swap! decodeword str (my_map (symbol(str(nth word k)) ) ) )  "decode edilen kelime decodeword atanır"
	)
	@decodeword
)

(defn my_helper_function  
	[word_list parameter_alph ]
	"Bu fonksiyon parametre olarak aldığı encode edilmiş kelimeleri permutasyon sonucunda olusmus mapde dener"

	(dotimes [i (count parameter_alph)]
		(def my_map (zipmap  (nth parameter_alph i) alphabet ))  "olası cipher alfabe listesi"
		(def listem (atom '()))
		(dotimes [j (count word_list)]
			(def elem (nth word_list j))
			(swap! listem conj (my_decoder elem my_map))			
		)
		(def table (atom '()) )
		(dotimes [i (count (reverse @listem))]
			(swap! table conj (spell-checker-0 (nth (reverse @listem) i ) readfile ) )
		)

		(if (= (every? true? @table) true) (println "Founded: " readfile)  )
	)

)

(defn spell-checker-1
	[word]
 	;you should implement this function
)


;; -----------------------------------------------------
;; DECODE FUNCTIONS

(defn Gen-Decoder-A 
	[paragraph]
	;you should implement this function
	(my_helper_function paragraph (my_permutations alphabet)) 
)


(defn Gen-Decoder-B-0 
	[paragraph]
  	;you should implement this function
)

(defn Gen-Decoder-B-1 
	[paragraph]
  	;you should implement this function
)

(defn Code-Breaker 
	[document decoder]
  	;you should implement this function
)

;; -----------------------------------------------------
;; Test code...

(defn test_on_test_data
	[]
	(let [doc (read-as-list "dictionary1.txt")]
		(println doc)
	)
	
)


;; test code...
(test_on_test_data)

(Gen-Decoder-A '((h e l l o) (t h i s) (i s) (a) (t e s t) (d i c t i o n a r y) )) ; fonk cagırma
;(Gen-Decoder-A '((a b c) ( d c b a) (d c e c))) ;"Test için bu parametrelerle fonksiyo çağrıldı. "

;; Test ederken aşağıdaki alfababe ve kelimeler kullanıldı.
;;
;;
;;  origin alphabet: a b c d e
;;  cihper alphabet: c d e b a

;;  origin test:  eda
;;  chipher word: abc

;;  origin test:  bade
;;  chipher word: dcba

;;  origin test:  baca
;;  chipher word: dcec

