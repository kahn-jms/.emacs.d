;;;; commands-cfg.el
;;;; Global command customisations

;; Make command history persistent
(savehist-mode 1)

;; Add texlive bin to env variable PATH
(setenv "PATH" (concat (getenv "HOME")"/.local/texlive/2016/bin/x86_64-linux:" (getenv "PATH")))
;; And add it to exec-path variable
;(setq exec-path (append exec-path '("~/.local/texlive/2015/bin/x86_64-linux")))
