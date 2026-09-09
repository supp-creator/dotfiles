;;; MELPA ----------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;;; QoL ------------------------------------------------------------------

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(pixel-scroll-precision-mode 1)
(global-hl-line-mode t)
(global-visual-line-mode 1)
(electric-pair-mode t)

;; Inhibit < from being paired (org angle brackets)
(add-function :before-until electric-pair-inhibit-predicate
              (lambda (c) (eq c ?<)))

;; TAB key: indent first, then complete
(setq tab-always-indent 'complete)
(setq tab-first-completion 'word-or-paren-or-punct)

;; No backup/autosave clutter
(setq auto-save-no-message t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Line numbers only in code buffers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Non-interactive session tweaks
(when noninteractive
  (setq enable-dir-local-variables nil)
  (setq case-fold-search nil))


;;; exec-path-from-shell --------------------------------------------------

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))


;;; epa-file (GPG encryption) --------------------------------------------

(require 'epa-file)
(epa-file-enable)

;;; Completion Stack: Vertico + Orderless + Marginalia + Consult ---------

(use-package vertico
  :init (vertico-mode 1)
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package vertico-posframe
  :after vertico
  :config
  (vertico-posframe-mode 1)
  (setq vertico-posframe-width 100
        vertico-posframe-height 20
        vertico-posframe-border-width 5
        vertico-posframe-poshandler #'posframe-poshandler-frame-center
        vertico-posframe-parameters
        '((left-fringe . 15)
          (right-fringe . 15)
          (internal-border-width . 20))))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :after vertico
  :config (marginalia-mode))

(use-package consult
  :bind (("C-x b"  . consult-buffer)
         ("M-s l"  . consult-line)
         ("M-s r"  . consult-ripgrep)
         ("M-s o"  . consult-outline)
         ("M-y"    . consult-yank-from-kill-ring)))


;;; Icons -----------------------------------------------------------------

(use-package all-the-icons)

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))


;;; Dashboard -------------------------------------------------------------

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t
        dashboard-display-icons-p t
        dashboard-icon-type 'all-the-icons
        dashboard-set-heading-icons t
        dashboard-set-file-icons t))

;;; Dired -----------------------------------------------------------------

(setq dired-free-space nil
      dired-dwim-target t
      dired-deletion-confirmer 'y-or-n-p
      dired-recursive-deletes 'top
      dired-recursive-copies 'always
      dired-vc-rename-file t
      dired-create-destination-dirs 'ask
      dired-clean-confirm-killing-deleted-buffers nil)


;;; Magit -----------------------------------------------------------------

(use-package magit)


;;; Company (in-buffer completion) ---------------------------------------

(use-package company
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 3)
  (global-company-mode 1)
  (company-tng-mode 1))

(use-package company-auctex
  :after (company tex)
  :config (company-auctex-init))


;;; Themes ----------------------------------------------------------------

(use-package doom-themes
  :config
  (load-theme 'doom-dracula t))

;;; PDF Tools -------------------------------------------------------------

(use-package pdf-tools
  :config (pdf-tools-install))

(add-hook 'pdf-view-mode-hook #'auto-revert-mode)


;;; Org-Mode --------------------------------------------------------------

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(use-package org-fragtog
  :hook (org-mode . org-fragtog-mode))

; (use-package visual-fill-column
;   :hook (org-mode . visual-fill-column-mode))
;
(use-package olivetti
   :hook (org-mode . olivetti-mode)
   :config (setq olivetti-body-width 200))

(use-package mixed-pitch
  :hook (org-mode . mixed-pitch-mode))

(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autolinks t
        org-appear-autosubmarkers t
        org-appear-autoentities t))

;; Org settings
(setq org-hide-emphasis-markers t
      org-ellipsis " ."
      org-startup-indented t
      org-startup-with-inline-images t
      org-pretty-entities t
      org-use-sub-superscripts '{}
      org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t
      org-src-window-setup 'current-window)

;; LaTeX preview via dvisvgm 

(setq org-preview-latex-default-process 'dvisvgm)
(setq  org-startup-with-latex-preview t)
      


;;; Org Agenda ------------------------------------------------------------

(setq org-agenda-include-diary t)

;;; Org Babel -------------------------------------------------------------

(use-package gnuplot)

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python     . t)
     (shell      . t)
     (gnuplot    . t)
     (latex      . t)
     (emacs-lisp . t))))


;;; Org Roam --------------------------------------------------------------

(use-package org-roam
  :custom
  (org-roam-directory "~/NOTES/org/roam/")
  (org-roam-dailies-directory "daily")
  (org-roam-completion-everywhere t)
  (org-roam-node-display-template
   (concat "${title:*} " (propertize "${tags:20}" 'face 'org-tag)))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n l" . org-roam-buffer-toggle)
         ("C-c n c" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  (setq org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :if-new
           (file+head
            "%<%Y%m%d%H%M%S>-${slug}.org"
            "#+TITLE: ${title}\n\
#+AUTHOR: Tyrone\n\
#+STARTUP: showall latexpreview\n\
#+LATEX_COMPILER: xelatex\n\

#+LATEX_CLASS_OPTION: [11pt]\n\
#+LATEX_HEADER: \\usepackage[a4paper,margin=0.75in,top=0.85in]{geometry}\n\
#+LATEX_HEADER: \\usepackage{amsmath,amssymb,mathtools}\n\
#+LATEX_HEADER: \\usepackage{microtype}\n\
#+LATEX_HEADER: \\setlength{\parskip}{0.8em}\n\
#+LATEX_HEADER: \\setlength{\parindent}{0pt}\n\
#+LATEX_HEADER: \\usepackage{mathpazo}\n\
#+LATEX_HEADER: \\usepackage{titlesec}\n\
#+LATEX_HEADER: \\titleformat{\\section}{\\large\\bfseries}{}{0em}{}[\\titlerule]\n\
#+LATEX_HEADER: \\titleformat{\\subsection}{\\normalsize\\bfseries}{}{0em}{}\n\
#+LATEX_HEADER: \\usepackage{enumitem}\n\
#+LATEX_HEADER: \\setlist{noitemsep,topsep=4pt}\n\
#+LATEX_HEADER: \\usepackage{titling}\n\
#+LATEX_HEADER: \\pretitle{\\begin{center}\\large\\bfseries}\n\
#+LATEX_HEADER: \\posttitle{\\end{center}}\n\
#+OPTIONS: toc:nil num:t\n\
#+FILETAGS: \n\"")
           :unnarrowed t)

          ("l" "literature note" plain
           "* Source\n%?\n\n* Summary\n\n* Key Ideas\n\n* Quotes\n"
           :if-new
           (file+head
            "literature/%<%Y%m%d>-${slug}.org"
            "#+TITLE: ${title}\n#+AUTHOR: Tyrone\n#+FILETAGS: :literature:\n\n")
           :unnarrowed t)

          ("p" "permanent note" plain
           "* Idea\n%?\n\n* Connections\n\n"
           :if-new
           (file+head
            "permanent/%<%Y%m%d>-${slug}.org"
            "#+TITLE: ${title}\n#+AUTHOR: Tyrone\n#+FILETAGS: :permanent:\n\n")
           :unnarrowed t))))

(setq org-ide-method 'ts)

(use-package org-roam-ui
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t))

(use-package consult-org-roam
  :after org-roam
  :config (consult-org-roam-mode 1)
  :bind (("C-c n s" . consult-org-roam-search)
         ("C-c n b" . consult-org-roam-backlinks)
         ;; C-c n f is taken by org-roam-node-find above;
         ;; use C-c n F for the consult variant
         ("C-c n F" . consult-org-roam-file-find)))


;;; Quarto ----------------------------------------------------------------

(use-package quarto-mode
  :mode (("\\.qmd\\'" . quarto-mode)))

(defun my/quarto-render ()
  "Render the current file using Quarto."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (compile (concat "quarto render " (shell-quote-argument file)))
      (user-error "Buffer is not visiting a file"))))

(defun my/quarto-preview ()
  "Preview the current file using Quarto."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (progn
          (start-process "quarto-preview" "*quarto-preview*"
                         "quarto" "preview" file)
          (message "Quarto preview started."))
      (user-error "Buffer is not visiting a file"))))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c q r") #'my/quarto-render)
  (define-key org-mode-map (kbd "C-c q p") #'my/quarto-preview))


;;; AUCTeX ----------------------------------------------------------------

(use-package tex
  :ensure auctex
  :defer t
  :hook ((LaTeX-mode . visual-line-mode)
         (LaTeX-mode . LaTeX-math-mode)
         (LaTeX-mode . turn-on-reftex)
         (TeX-after-compilation-finished-functions . TeX-revert-document-buffer))
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-PDF-mode t
        TeX-engine 'xetex
        TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-mode t)
  (setq-default TeX-master nil))


;;; Spell Checking --------------------------------------------------------

;; lsp-ltex-plus: grammar and style via LanguageTool LSP
;; Spelling (MORFOLOGIK) is disabled — handled separately below
(use-package lsp-ltex-plus
  :defer t
  :init
  (setq lsp-ltex-plus-check-programming-languages nil
        lsp-ltex-plus-ls-plus-executable
        (expand-file-name "~/.local/share/ltex-ls-plus-18.6.1/bin/ltex-ls-plus")
        lsp-ltex-plus-disabled-rules
        '(:en-US ["spelling" "MORFOLOGIK_RULE_EN_US"]))
  (lsp-ltex-plus-enable-for-modes
    :restrict-to '(org-mode text-mode markdown-mode latex-mode LaTeX-mode quarto-mode)))

(use-package jinx
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$"   . jinx-correct)
         ("C-M-$" . jinx-languages))
  :config
  (setq jinx-languages "en_US"))


;;; citar (bibliography) — uncomment when you have a .bib file ----------

;; (use-package citar
;;   :after org
;;   :bind ("C-c b" . citar-insert-citation)
;;   :config
;;   (setq citar-bibliography '("~/references.bib")))
;;
;; (use-package citar-org-roam
;;   :after (citar org-roam)
;;   :config (citar-org-roam-mode))
 
;;; Window Management -----------------------------------------------------

(use-package ace-window
  :bind ("M-o" . ace-window))

(winner-mode 1)

(defun my/balance-windows-after-find-file ()
  (when (> (length (window-list)) 1)
    (balance-windows)))

(add-hook 'find-file-hook #'my/balance-windows-after-find-file)

(defun my/org-roam-node-find-other-window ()
  (interactive)
  (let ((display-buffer-overriding-action
         '((display-buffer-pop-up-window))))
    (org-roam-node-find)))

(global-set-key
 (kbd "C-c n o")
 #'my/org-roam-node-find-other-window)


(setq display-buffer-alist
      '(

	;; Anatomy of an entry
	;; (BUFFER-MATCHER
	;; LIST-OF-DISPLAY-FUNCTIONS
	;; &optional PARAMETERS)

	("\\*Occur\\*"
	 ;; List of Display Functions
	 (display-buffer-reuse-mode-window
	  display-buffer-below-selected)
	 ;; Parameters
	 (window-height . fit-window-to-buffer)
	 (dedicated . t)
	 
	 )

	))

;;; Custom ----------------------------------------------------------------
;; This block is managed by Emacs — do not edit by hand.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes t)
 '(org-agenda-files '("~/.logs/tasks.org"))
 '(org-export-backends '(ascii html icalendar latex md odt org))
 '(package-selected-packages
   '(ace-window all-the-icons-completion calfw citar-org-roam
		company-auctex consult-org-roam cyberpunk-theme
		dashboard doom-themes ef-themes emms
		evil-visual-mark-mode exec-path-from-shell fj flycheck
		gnuplot gotham-theme indent-bars jinx langtool
		latexdiff ligature log4e lsp-ltex-plus lsp-ui
		marginalia mixed-pitch multiple-cursors ob-rust
		olivetti orderless org-appear org-fragtog org-modern
		org-roam-ui pdf-tools quarto-mode rainbow-delimiters
		rust-mode spacemacs-theme sqlite3 vertico-posframe
		visual-fill-column xelb))
 '(send-mail-function 'mailclient-send-it))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "#3e4452"))))
 '(company-tooltip-common ((t (:background "#3e4452"))))
 '(company-tooltip-scrollbar-track ((t (:background "#282c34"))))
 '(company-tooltip-selection ((t (:background "#454c59"))))
 '(magit-diff-context-highlight ((t (:background "#3e4452"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "#282c34")))))
