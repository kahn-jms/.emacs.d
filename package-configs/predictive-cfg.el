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
;; turn on auto learning (as you type)
(setq predictive-auto-learn t
      predictive-add-to-dict-ask nil ; Do no ask to add to dictionary when exiting emacs
      predictive-use-auto-learn-cache t ; Learnt words are cached, only added to dict when emacs idle for flush-auto-learn-delay seconds
      predictive-flush-auto-learn-delay 30
      predictive-which-dict t)
      ;predictive-use-buffer-local-dict t)
      ;predictive-main-dict 'rpg-dictionary)
;; Turn off some annoying features that also slow down emacs a lot
(setq completion-auto-show nil
      completion-overwrite nil
      completion-ui-use-dynamic nil)
  
