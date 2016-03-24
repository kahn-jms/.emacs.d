;;;; python-mode-cfg.el
;;;; Pytho mode configs

;(add-hook 'python-mode-hook (setq-default tab-width 4))

;;  Set up some defaults for python tabbing
(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)
            (setq python-indent 4)))

;; Guess tab width of file we open
;; Can't get this to work for now :(
;; (add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (guess-style-guess-tab-width)))

