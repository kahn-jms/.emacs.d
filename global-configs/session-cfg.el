;;;; Session configurations to manage each emacs session

;; Save each session and restore when emacs is opened again (e.g. reopen
;; whichever buffers were open last time)
(desktop-save-mode 1)

;; Set emacs to auto save the session every so often in case of a crash
(setq desktop-dirname "~/.emacs.d/desktop/"
      desktop-auto-save-timeout 120
      desktop-save t
      desktop-path (list desktop-dirname)
      desktop-load-locked-desktop nil
      history-length 250
      ;desktop-path '("." "~/.emacs.d/" "~")
      )

;; Save the file name list, useful when working with modue files
(add-to-list 'desktop-globals-to-save 'file-name-history)
