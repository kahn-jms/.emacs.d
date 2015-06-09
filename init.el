;;;; .emacs
;;;; James Kahn's gloabal emacs configuration file


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set global configs first
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/global-configs/appearance-cfg.el")
(load "~/.emacs.d/global-configs/google-c-style.el")
(load "~/.emacs.d/global-configs/style-cfg.el")
(load "~/.emacs.d/global-configs/commands-cfg.el")
(load "~/.emacs.d/mode-configs/cc-mode-cfg.el")

;; Need to sort out why PDFs look bad ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Document viewer settings (i.e. for PDF reading)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set doc-view resolution for viewing pdf files
;(set 'doc-view-resolution '(200))


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
