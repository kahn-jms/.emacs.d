;;;; Rust mode configuration


(add-hook 'rust-mode-hook
        (lambda()
          ;; Change tab size to 2
          (setq rust-indent-offset 2) ))
