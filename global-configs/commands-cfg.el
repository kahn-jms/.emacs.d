;;;; commands-cfg.el
;;;; Global command customisations

;; Make command history persistent
(savehist-mode 1)

;; Add texlive bin to env variable PATH
(setenv "PATH" (concat (getenv "HOME")"/.local/texlive/2016/bin/x86_64-linux:" (getenv "PATH")))
;; And add it to exec-path variable
;(setq exec-path (append exec-path '("~/.local/texlive/2015/bin/x86_64-linux")))

;; easy spell check (for when flyspell minor mode enabled)
;; Can't use commands with C-M-f8 since this switches ttly's
;;(global-set-key (kbd "<f8>") 'ispell-word)
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode)
;;(global-set-key (kbd "C-M-<f8>") 'flyspell-buffer)
(global-set-key (kbd "<f8>") 'flyspell-buffer)
(global-set-key (kbd "C-<f8>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)
