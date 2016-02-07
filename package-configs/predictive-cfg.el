;;;; Package setup for predictive mode (auto prediction of typing)

;; predictive install location
(add-to-list 'load-path "~/.emacs.d/cust_packages/predictive/")
;; dictionary locations
(add-to-list 'load-path "~/.emacs.d/cust_packages/predictive/latex/")
(add-to-list 'load-path "~/.emacs.d/cust_packages/predictive/texinfo/")
(add-to-list 'load-path "~/.emacs.d/cust_packages/predictive/html/")
;; load predictive package
(autoload 'predictive-mode "~/.emacs.d/cust_packages/predictive/predictive"
  "Turn on Predictive Completion Mode." t)

;; Some settings to make learning default.
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)
      ;predictive-main-dict 'rpg-dictionary)
