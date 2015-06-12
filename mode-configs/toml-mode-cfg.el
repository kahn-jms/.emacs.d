;;;; Toml mode configuration


(add-hook 'toml-mode-hook
          (lambda()
            ;; Change tab size to 2
            (setq tab-stop-list (number-sequence 2 60 2)) ))
