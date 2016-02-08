;;;; undo-tree-cfg.el
;;;; James Kahn's undo tree specific configurations

;;; Switch to undo-tree mode on start and announce
(global-undo-tree-mode 1)

(provide 'undo-tree-cfg)

;; Show diffs when going through history
(setq undo-tree-visualizer-diff 0)
