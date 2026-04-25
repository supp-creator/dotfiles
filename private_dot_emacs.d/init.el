;;; MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;;; QoL

(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)

;;; Indentaions and Completions using the TAB key
(setq tab-always-indent 'complete)
(setq tab-first-completion 'word-or-paren-or-punct)


;;; Dired and ls-lisp
(setq dired-free-space nil
      dired-dwin-target t
      dired-deletion-confirmer 'y-or-n-p
      dired-filter-verbose 1
      dired-recursive-deletes 'top
      dired-recursive-copies 'always
      dired-vc-rename-file t
      dired-create-destinations-dirs 'ask
      dired-clean-confirm-killing-deleted-buffers nil)


;;; Line Numbers

(global-display-line-numbers-mode 1)
(global-company-mode 1)

;;; Vertico
(use-package vertico
  :init
  (vertico-mode 1)
  :hook
  (rfn-eshadow-update-overlay . vertico-directory-tidy))

;;; Auto Save

(setq auto-save-no-message t)
(setq auto-save-default nil)
(setq make-backup-files nil)


(when noninteractive
  (setq enable-dir-local-variables nil)
  (setq case-fold-search nil))


;;; LSPs
(use-package lsp-mode
  :ensure t
  :hook
  (c-mode .  lsp)
  (python-mode . lsp)
  (rust-mode . lsp)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-keymap-prefix "C-c 1"))

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t
	lsp-ui-sideline-enable t))

;;; Marginalia
(use-package marginalia
  :after vertico
  :config
  (marginalia-mode))

;;; All the Icons
(use-package all-the-icons)
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

;;; Flycheck

(use-package flycheck
  :init
  (global-flycheck-mode))


;;; Magit
(use-package magit
  :custom
  (custom-set-faces
   '(magit-diff-hunk-heading-highlight ((t (:background "#282c34"))))
   '(magit-diff-context-highlight ((t (:background "#3e4452"))))))

;;; Multiple Cursors

(use-package multiple-cursors
  :init
  (setq mouse-1-click-follows-link nil)
  (define-key global-map [down-mouse-1] 'mouse-set-point)
  (define-key global-map [mouse-1] 'mouse-set-point))


;;; Indent Bars

(use-package indent-bars
  :hook (prog-mode . indent-bars-mode)
  :config
  (setq indent-bars--no-stipple))


;;; Company-Mode
(use-package company
  :after lsp-mode
  :hook
  (prog-mode . global-company-mode)
  (prog-mode . company-tng-mode)
  (prog-mode . electric-pair-mode)
  (org-src-mode . company-mode)

  :config
(company-idle-delay 0.0
	 company-minimum-prefix-lenght 3)

:custom
  (custom-set-faces
   '(company-tooltip ((t (:background "#3e4452"))))
   '(company-tooltip-selection ((t (:background "#454c59"))))
   '(company-tooltip-common ((t (:background "#3e4452"))))
   '(company-scrollbar-bg ((t (:background "#282c34"))))))


;;; org-mode

(use-package org-modern
:hook (org-mode . org-modern-mode))

(setq org-hide-emphasis-markers t)

(setq org-ellipsis " .")

(setq org-startup-indented t)

(setq org-startup-folded t)

;; render latex fragments inline

(setq org-pretty-entities t)
(setq org-pretty-entities-include-sub-superscripts t)
(setq org-use-sub-superscripts '{})

(setq org-startup-with-latex-preview t)

;;; Themes

(use-package ef-themes
  :config
  (load-theme 'ef-dark t))

;;; Enabling modes

(pixel-scroll-precision-mode 1)

(global-hl-line-mode t)

(use-package rust-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("2c7dc80264de0ba9409d4ebb3c7b31cf8e4982015066174c786f16a672db71b2"
     "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
     "9e5e0ff3a81344c9b1e6bfc9b3dcf9b96d5ec6a60d8de6d4c762ee9e2121dfb2"
     default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
