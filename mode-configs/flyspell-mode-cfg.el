;;;; Flyspell mode configs

(add-hook 'Flyspell-mode-hook
          (lambda()

            ;; (setq ispell-dictionary "british") 
            ;; easy spell check
            ;; (global-set-key (kbd "<f8>") 'ispell-word)
            (global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
            (global-set-key (kbd "<f8>") 'flyspell-buffer)
            (global-set-key (kbd "S-<f8>") 'ispell)
            ;; (global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
            (global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
            (defun flyspell-check-next-highlighted-word ()
              "Custom function to spell check next highlighted word"
              (interactive)
              (flyspell-goto-next-error)
              (ispell-word)
              )
            (global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
            )
          )
