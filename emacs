;;;; .emacs
;;;; James Kahn's gloabal emacs configuration file

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Color theme settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set color theme on start
(load-theme 'wombat)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Document viewer settings (i.e. for PDF reading)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set doc-view resolution for viewing pdf files
(set 'doc-view-resolution '(200))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set up auto indentation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set tab width to 2 because 4 is unnecessary
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Auto indent yanked tex   t. Handles any  unwanted whitespace when pasting code blocks
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
    (and (not current-prefix-arg)
      (member major-mode '(emacs-lisp-mode lisp-mode
        clojure-mode    scheme-mode
        haskell-mode    ruby-mode
        rspec-mode      python-mode
        c-mode          c++-mode
        objc-mode       java-mode
        latex-mode      plain-tex-mode))
      (let ((mark-even-if-inactive transient-mark-mode))
        (indent-region (region-beginning) (region-end) nil))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Package Management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Initialise package management, only bundled with emacs24 and greater
(when (>= emacs-major-version 24)
  (require 'package)

  ;; Specify package repos here
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "https://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")))

  ;; Specify packages we want here
  (setq package-list '(undo-tree))
  
  ;; Activate all the packages
  (package-initialize)

  ;; fetch the list of packages available 
  (unless package-archive-contents
    (package-refresh-contents))

  ;; install the missing packages
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package)))

  ;; Load individual package configs (thank you Josh for the idea of this)
  (load "~/.emacs.d/package-configs/undo-tree-cfg.el")
  
)
