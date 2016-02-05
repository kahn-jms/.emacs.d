;;;; Setup for LaTeX preview pane, displays pdf in side pane while editing tex files

(add-hook 'LaTeX-mode-hook
          (lambda()
            ;; Enable latex preview pane
            (latex-preview-pane-enable)

            ;; Tell latex preview pane to get the master file from auctex
            (setq latex-preview-pane-multifile-mode 'auctex)

            ;; Tell it which compiler to use
            (setq pdf-latex-command "LatexMk")
            )
          )
