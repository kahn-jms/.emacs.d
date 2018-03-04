;;;; Org mode configs

(add-hook 'org-mode-hook
          (lambda()
            
            ;; Enforce dependencies for all task lists
            (setq org-enforce-todo-dependencies t)
            (setq org-agenda-dim-blocked-tasks t)
            
            ;; Set TODO modes
            (setq org-todo-keywords
              '((sequence "TODO(t)" "IN PROGRESS(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
            (setq org-todo-keyword-faces
                  '(("TODO" . org-warning) ("IN PROGRESS" . "yellow")
                    ("CANCELLED" . "blue")))


            ;; Enable TODO item completion time logging (and note taking)
            ;(setq org-log-done t)
            (setq org-log-done 'note)

            ;; Replace the default pdf viewer
            (add-to-list 'org-file-apps '("\\.pdf" . "evince %s"))

            ;; Allow Beamer to split long lists over multiple slides
            (setq org-beamer-frame-default-options "[allowframebreaks,label=]")

            ;; Easy access to agenda
            (local-set-key (kbd "C-c a") 'org-agenda)

            ;; And some additional agenda commands
            ;; Display agenda from today to one week in future
            (setq org-agenda-start-on-weekday nil)
            ;; Better colours for printing
            (setq org-agenda-exporter-settings
                  '((ps-print-color-p 'black-white)))
            ;; Effort estimate ranges
            (setq org-global-properties
                  '(("Effort_ALL". "0 0:10 0:20 0:30 0:40 1:00 2:00")
                    ("COLUMNS" . "%50ITEM %TODO %1PRIORITY %5Effort{:} %5CLOCKSUM{Total}")))
            ;; Display items with times set first, then all the rest
            (setq org-agenda-custom-commands
                  '(("h" "Time specific first TODO Lists"
                     ((agenda)
                      (tags-todo "ANALYSIS")
                      (tags-todo "SOFTWARE")
                      (tags-todo "TASKS")
                      (tags-todo "MEETINGS")
                      ))
                    ;; Agenda for the day
                    ("d" "Daily Action List"
                     ((agenda "" ((org-agenda-ndays 1)
                                  (org-agenda-sorting-strategy
                                   (quote ((agenda time-up priority-down tag-up) )))
                                  (org-deadline-warning-days 0)
                                  )))))
                  )

            ;; Keep clocking times persistent over sessions
            (setq org-clock-persist 'history)
            (org-clock-persistence-insinuate)

            )
          )
