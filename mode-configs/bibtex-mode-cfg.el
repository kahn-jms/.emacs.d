;;;; Bibtex mode configs using Auctex

(add-hook 'bibtex-mode-hook
          (lambda()
            
            ;; Change comment character
            (setq comment-start "% ")
            )
          
          )
