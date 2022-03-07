#lang racket

(define (dosomething n)
  (cond
    [(equal? #\space n)
     (print "there was a space")]
    [else
  (print n)]))

(define parse
  (let ([source (open-input-file "/Users/Crow/Documents/RacketParser/input.txt")])
    (let kernel ([token "Accept"])
    (let ([nextval (read-char source)])
      (cond
        [(eof-object? nextval)
         (close-input-port source)
         (print token)]
        [else
        (dosomething nextval)
        (kernel token)])))))
        ;add result of dosomething to kernel
(define a (file->string "/Users/Crow/Documents/RacketParser/input.txt")
  (string-split "a b   c\nd" #px"[\\s]+"))
  
