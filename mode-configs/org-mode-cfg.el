;;;; Org mode configs

(add-hook 'org-mode-hook
          (lambda()
            
            ;; Enforce dependencies for all task lists
            (setq org-enforce-todo-dependencies t)
            (setq org-agenda-dim-blocked-tasks t)
            
            ;; Set TODO modes
            (setq org-todo-keywords
              '((sequence "TODO(t)" "IN_PROGRESS(w@/!)" "IN_REVIEW(r@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))
            (setq org-todo-keyword-faces
                  '(("TODO" . org-warning) ("IN_PROGRESS" . "yellow")
                    ("IN_REVIEW" . "purple") ("CANCELLED" . "blue")))


            ;; Enable TODO item completion time logging (and note taking)
            ;(setq org-log-done t)
            (setq org-log-done 'note)

            ;; Log all times even when items are rescheduled
            (setq org-log-reschedule 'time)

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
                  '((ps-left-header (list 'org-agenda-write-buffer-name))
                    (ps-right-header
                     (list "/pagenumberstring load"
                           (lambda () (format-time-string "%d/%m/%Y"))))
                    (ps-number-of-columns 1)
                    ;; (org-agenda-add-entry-text-maxlines 5)
                    (ps-print-color-p 'black-white)
                    (ps-landscape-mode t)))
            ;; Effort estimate ranges
            (setq org-global-properties
                  '(("Effort_ALL". "0 0:10 0:20 0:30 0:40 1:00 1:20 1:40 2:00")
                    ("COLUMNS" . "%60ITEM %TODO %1PRIORITY %5Effort{:} %5CLOCKSUM{Total}")))
            ;; Display items with times set first, then all the rest
            (setq org-agenda-custom-commands
                  '(("h" "Time specific first TODO Lists"
                     ((agenda)
                      (tags-todo "DEFENSE")
                      (tags-todo "SOFTWARE")
                      (tags-todo "ADD_TASKS")
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

            ;; define "R" as the prefix key for reviewing what happened in various
            ;; time periods
            (add-to-list 'org-agenda-custom-commands
                         '("R" . "Review" )
                         )

            ;; Common settings for all reviews
            (setq efs/org-agenda-review-settings
                  '((org-agenda-show-all-dates t)
                    (org-agenda-start-with-log-mode t)
                    (org-agenda-start-with-clockreport-mode t)
                    (org-agenda-archives-mode t)
                    ;; (org-agenda-files '("~/org/notes.org"
                    ;;                     "~/org/projects.org"
                    ;;                    ))
                    ;; I don't care if an entry was archived
                    (org-agenda-hide-tags-regexp
                     (concat org-agenda-hide-tags-regexp
                             "\\|ARCHIVE"))
                    ))
            ;; Show the agenda with the log turn on, the clock table show and
            ;; archived entries shown.  These commands are all the same exept for
            ;; the time period.
            (add-to-list 'org-agenda-custom-commands
                         `("Rw" "Week in review"
                           agenda ""
                           ;; agenda settings
                           ,(append
                             efs/org-agenda-review-settings
                             '((org-agenda-span 'week)
                               (org-agenda-start-day "-7d")
                               ;; (org-agenda-start-on-weekday 4)
                               (org-agenda-overriding-header "Week in Review"))
                             )
                           ("~/org/review/week.html")
                           ))


            (add-to-list 'org-agenda-custom-commands
                         `("Rd" "Day in review"
                           agenda ""
                           ;; agenda settings
                           ,(append
                             efs/org-agenda-review-settings
                             '((org-agenda-span 'day)
                               (org-agenda-overriding-header "Week in Review"))
                             )
                           ("~/org/review/day.html")
                           ))

            (add-to-list 'org-agenda-custom-commands
                         `("Rm" "Month in review"
                           agenda ""
                           ;; agenda settings
                           ,(append
                             efs/org-agenda-review-settings
                             '((org-agenda-span 'month)
                               (org-agenda-start-day "01")
                               (org-read-date-prefer-future nil)
                               (org-agenda-overriding-header "Month in Review"))
                             )
                           ("~/org/review/month.html")
                           ))
            )
          )
