;;; el-orgmode.el starts here

;; Org mode
(require 'org)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "|" "DONE(d)")
              (sequence "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("DONE" :foreground "forest green" :weight bold)
              ("HOLD" :foreground "red" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))


(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("HOLD" ("HOLD" . t))
              (done ("HOLD"))
              ("TODO" ("CANCELLED") ("HOLD"))
              ("DONE" ("CANCELLED") ("HOLD")))))

(setq org-cycle-separator-lines 0)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\todo.txt\\'" . org-mode))

(setq base-dir "~/Dropbox/org/")
(setq base-refile "refile-beorg.org")
(setq org-agenda-file (concat base-dir "work.org"))
(setq org-agenda-archive (concat base-dir "archive_work.org::"))
(setq org-agenda-files (list org-agenda-file (concat base-dir base-refile)))
(setq org-archive-location org-agenda-archive )
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done t)

(setq org-default-notes-file (concat base-dir base-refile))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file (concat base-dir base-refile))
               "* TODO %?\n%U\n")
              ("n" "note" entry (file (concat base-dir base-refile))
               "* %? :NOTE:\n")
              ("j" "Journal" entry (file+datetree (concat base-dir "diary.org"))
               "* %?\n%U\n"))))




(provide 'el-orgmode)
;;; el-orgmode.el ends here
