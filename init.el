;;;; .emacs
;;;; James Kahn's gloabal emacs configuration file


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set global configs first
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "~/.emacs.d/global-configs/appearance-cfg.el")
(load "~/.emacs.d/global-configs/google-c-style.el")
(load "~/.emacs.d/global-configs/style-cfg.el")
(load "~/.emacs.d/global-configs/commands-cfg.el")
(load "~/.emacs.d/global-configs/session-cfg.el")
(load "~/.emacs.d/mode-configs/cc-mode-cfg.el")
(load "~/.emacs.d/mode-configs/rust-mode-cfg.el")
(load "~/.emacs.d/mode-configs/toml-mode-cfg.el")
(load "~/.emacs.d/mode-configs/flyspell-mode-cfg.el")
(load "~/.emacs.d/mode-configs/latex-mode-cfg.el")
(load "~/.emacs.d/mode-configs/python-mode-cfg.el")
(load "~/.emacs.d/mode-configs/org-mode-cfg.el")


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
                           ("melpa" . "https://melpa.org/packages/") ;))
                           ("melpa" . "https://stable.melpa.org/packages/") ;))
                           ("melpa2" . "http://melpa.milkbox.net/packages/")))

  ;; Specify packages we want here
  (setq package-list '(undo-tree
                       rust-mode
                       toml-mode
                       smart-tabs-mode
                       auctex
                       auctex-latexmk
                       latex-preview-pane
                       google-c-style))
  
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
  (load "~/.emacs.d/package-configs/smart-tab-mode-cfg.el")
  (load "~/.emacs.d/package-configs/auctex-latexmk-cfg.el")
  ;(load "~/.emacs.d/package-configs/latex-preview-pane-cfg.el")
  ;; Also load package configs for non-repo packages
  ;(load "~/.emacs.d/package-configs/predictive-cfg.el")
  ; Not sure if ordering matters but load reftex configs after auctex
  (load "~/.emacs.d/package-configs/reftex-cfg.el")
  
)
;; Fix color scheme (can't read on dark bg)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Documents/lrz-sync/PhD-writings/OrgMode/gtd.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-column ((t (:background "gray15" :strike-through nil :underline nil :slant normal :weight normal :height 128 :family "Ubuntu Mono"))))
 '(org-scheduled ((t (:foreground "green"))))
 '(org-scheduled-today ((t (:foreground "green")))))

;; won't work in flyspell-mode-config, dunno why
(setq ispell-dictionary "british") 
