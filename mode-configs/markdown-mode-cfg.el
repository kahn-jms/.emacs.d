;;;; Markdown mode configs

(use-package markdown-mode
             :ensure t
             :commands (markdown-mode gfm-mode)
             :mode (("README\\.md\\'" . gfm-mode)
                    ("\\.md\\'" . markdown-mode)
                    ("\\.markdown\\'" . markdown-mode))
             :init (setq markdown-command "multimarkdown")
             (lambda ()
               (when buffer-file-name
                 (add-hook 'after-save-hook
                           'check-parens
                           nil t))))
             )
