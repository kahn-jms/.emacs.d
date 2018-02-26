;;;; Setup reftex package/minor mode

;; Load reftex
(require 'reftex)

;; Switch on reftex minor mode when in AUCTeX LaTeX mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

;; Plug into AUCTeX
(setq reftex-plug-into-auctex t)

;; So that RefTeX also recognizes \addbibresource. Note that you
;; can't use $HOME in path for \addbibresource but that "~"
;; works.
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))              
        
