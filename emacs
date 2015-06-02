;; Set color theme on start
(load-theme 'wombat)

;; Set doc-view resolution for viewing pdf files
(set 'doc-view-resolution '(200))

;; Set tab width to 2 because 4 is unnecessary
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Auto indent yanked tex   t. Handles any  unwanted whitespace when pasting code blocks
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
    (and (not current-prefix-arg)
      (member major-mode '(emacs-lisp-mode lisp-mode
        clojure-mode    scheme-mode
        haskell-mode    ruby-mode
        rspec-mode      python-mode
        c-mode          c++-mode
        objc-mode       latex-mode
        plain-tex-mode))
      (let ((mark-even-if-inactive transient-mark-mode))
        (indent-region (region-beginning) (region-end) nil))))))
