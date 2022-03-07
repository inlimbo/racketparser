#lang racket

(define (dosomething n)
  (cond
    [(equal? #\space n)
     (print "there was a space")]
    [else
  (print n)]))

(define file-string (file->string "/Users/Crow/Documents/RacketParser/input.txt"))
  
(define file-list (string-split file-string #px"[\\s]+"))

(define (stmt list-number)
  (print "stmt"))

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