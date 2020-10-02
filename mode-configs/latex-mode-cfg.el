;;;; LaTeX mode configs using Auctex

(add-hook 'LaTeX-mode-hook
          (lambda()
            
            ;; Make Auctex aware of multi-file document structure
            (setq-default TeX-master nil)
            
            ;; Enable document parsing
            (setq TeX-auto-save t)
            (setq TeX-parse-self t)
            
            ;; Set default compiler
            (setq TeX-command-default "latexmk")

            ;; Set spell check mode on
            (flyspell-mode 1)

            ;; Set default viewer
						(setq TeX-view-program-selection '((output-pdf "Okular")))
						;; (setq TeX-view-program-list '(("Okular" "okular --page=%(outpage) %o")))
            ;; (setq TeX-view-program-list '(("Evince" "evince --page-index=%(outpage) %o")))

            ;; Turn on predictive mode by default in LaTeX mode
            ;; (predictive-mode 1)

            ;; Enable synctex when compiling
            (setq TeX-source-correlate-mode t)
            (setq TeX-source-correlate-method (quote synctex))
            (setq TeX-source-correlate-start-server t)
            (setq TeX-view-program-list (quote (("Okular" "okular --unique %o#src:%n%b"))))

            ;; (load "~/.emacs.d/mode-configs/latex-glossaries-cfg.el")
            )
          
          )
