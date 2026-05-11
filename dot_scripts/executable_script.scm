#!/usr/bin/env -S guile -s
!#

(use-modules (ice-9 rdelim)
             (ice-9 format)
             (srfi srfi-1))

(define (count-lines filename)
  (call-with-input-file filename
                        (lambda (port)
                          (let loop ((count 0))
                            (let ((line (read-line port)))
                              (if (eof-object? line)
                                count
                                (loop (+ count 1))))))))

(define args (cdr (command-line)))

(if (null? args)
  (format #t "Usage: ./script.scm <files...>\n")
  (for-each
    (lambda (file)
      (format #t "~a: ~a lines\n" file (count-lines file)))
    args))
