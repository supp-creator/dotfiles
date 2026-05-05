#!/usr/bin/env -S guile -s
!#

;;; Assumes you already have guile, git, and a Bash shell already running.

(define dotfiles-repo
  "https://github.com/supp-creator/dotfiles.git")

(define target-dirs
  ("~/.config" "~/.local/bin"))


(use-modules (ice-9 ftw)
             (ice-9 format)
             (ice-9 popen))

;;; expanding "~" into /home/
(define (expand path)
  (if (string-prefix? "~" path)
    (sting-append (getenv "HOME") (substring path 1))
    path))

;;; creating directories
(define (ensure-dir path)
  (let ((p (expand path)))
    (unless (file-exists? p)
      (format #t "Creating ~a\n" p)
      (mkdir p #o755))))

(define (run cmd)
  (format #t "Running: ~a\n" cmd)
  (system cmd))

;;; using git to clone files
(define (clone-dotfiles)
  (let ((target (string-append (getenv "HOME") "/dotfiles")))
    (unless (file-exists? target)
      (run (string-append "git clone " dotfiles-repo " " target)))))

;;; main function
(define (main)
  (for-each ensure-dir target-dirs)
  (clone-dotfiles))

(main)
  
