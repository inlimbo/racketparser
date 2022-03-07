#lang racket

(define file-string (file->string "/Users/Crow/Documents/RacketParser/input.txt"))
  
(define file-list (string-split file-string #px"[\\s]+"))

(define (expr list-number)
  (define list-item (list-ref file-list list-number))
  (regexp-match-exact? #px"[A-z]+" list-item)
  (regexp-match-exact? #px"\\(" ))

(define (stmt list-number)
  (define list-item (list-ref file-list list-number))
  (define nextItem (list-ref file-list (+ list-number 1)))
  (cond
    [(equal? list-item "read")
     (regexp-match-exact? #px"[A-z]+" nextItem
      (equal? (list-ref file-list (+ list-number 2)) ";"
      (stmt-list (+ list-number 1))
      (print "Syntax Error"))
      (print "Syntax Error"))])
  (cond
    [(equal? list-item "write")
     (expr (+ list-number 1))]))

(define (stmt-list list-number)
  (cond
    [(equal? (list-ref file-list list-number) "$$")]

    [else
     (stmt (+ list-number 1))]))

(define program
  (cond
    [(equal? (list-ref file-list 0) "{")
       (stmt-list 1)]
    [else
     (cond
       [(equal? (length file-list) 0)
       (print "Empty File")]
       [else
        ("Syntax Error")])]))

;(define parse program)