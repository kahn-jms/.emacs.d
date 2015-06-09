;;;; cc-mode-cfg.el
;;;; Configs to manage CC mode (C, C++, Objective-C, Java, CORBA IDL (and the variants CORBA PSDL and CIDL), Pike and AWK code)
;;;; Official guide: http://cc-mode.sourceforge.net/html-manual/index.html


;;; Hook to implement google C style when switching to CC mode
;(add-hook 'c-mode-common-hook 'google-set-c-style)

;; And set RETURN key to move to right spot in next line
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;(add-hook 'java-mode-hook 'google-set-c-style)

(require 'google-c-style)
(add-hook 'c-mode-common-hook
          (lambda()
            (subword-mode)
            (google-set-c-style)
            (google-make-newline-indent) ))

(add-hook 'java-mode-hook
          (lambda()
            (subword-mode)
            (google-set-c-style)
;;             (setq indent-line-function 'insert-tab) ))
            (google-make-newline-indent) ))


(setq c-default-style '( (java-mode . "Google") ) )

;;; Set indent size
(setq-default c-basic-offset 2)
(setq indent-line-function 'insert-tab)
