;;;; LaTeX mode configs using Auctex

(add-hook 'LaTeX-mode-hook
          (lambda()
            
            ;; Enable document parsing
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            
            ;; Make Auctex aware of multi-file document structure
            (setq-default TeX-master nil)
            
            ;; Set default compiler
            (setq TeX-command-default "latexmk")

            ;; Set spell check mode on
            (flyspell-mode 1)

            ;; Set default viewer
            ;; (setq TeX-view-program-selection "")
            ;; (setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))

            ;; Turn on predictive mode by default in LaTeX mode
            ;; (predictive-mode 1)

            ;; Enable synctex when compiling
            (setq TeX-source-correlate-mode t)

            )
          )
