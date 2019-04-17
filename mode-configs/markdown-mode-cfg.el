;;;; Markdown mode configs

;; (use-package markdown-mode
;;              :ensure t
;;              :commands (markdown-mode gfm-mode)
;;              :mode (("README\\.md\\'" . gfm-mode)
;;                     ("\\.md\\'" . markdown-mode)
;;                     ("\\.markdown\\'" . markdown-mode))
;;              :init (setq markdown-command "multimarkdown")
;;              (lambda ()
;;                (when buffer-file-name
;;                  (add-hook 'after-save-hook
;;                            'check-parens
;;                            nil t))))

;; For PDF exporting
;; To use while editing markdown type `C-c / l`, the l means export/compile using latex
;; Must have pandoc installed via e.g. `sudo apt get install pandoc`
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)
