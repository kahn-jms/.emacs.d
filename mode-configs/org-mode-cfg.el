;;;; Org mode configs

(add-hook 'org-mode-hook
          (lambda()

            ;; Enforce dependencies for all task lists
            (setq org-enforce-todo-dependencies t)
            (setq org-agenda-dim-blocked-tasks t)
            
            ;; Set TODO modes
            (setq org-todo-keywords
              '((sequence "TODO(t)" "IN_PROGRESS(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))

            ;; Enable TODO item completion time logging (and note taking)
            ;(setq org-log-done t)
            (setq org-log-done 'note)

            (add-to-list 'org-file-apps '("\\.pdf" . "evince %s"))
            )
          )
