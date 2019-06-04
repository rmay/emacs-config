;;; el-orgmode.el starts here

;; Org mode
(require 'org)
(require 'ox-md)
(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))
(require 'ox-beamer)
(require 'ox-reveal)

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
(setq base-refile "inbox.org")
(setq base-project "projects.org")
(setq project-file-target (concat base-dir base-project))
(setq task-file-target (concat base-dir base-refile))
(setq org-agenda-file (concat base-dir "work.org"))
(setq org-agenda-archive (concat base-dir "archive_work.org::"))
(setq org-agenda-files (list org-agenda-file 
			     (concat base-dir base-refile) 
			     (concat base-dir "work.org")
			     (concat base-dir "projects.org") 
			     (concat base-dir "personal.org")))
(setq org-archive-location org-agenda-archive )
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-log-done t)

(setq org-default-notes-file (concat base-dir base-refile))

(setq diary-file (concat base-dir "diary.org"))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file task-file-target)
               "* TODO %?")
              ("n" "note" entry (file task-file-target)
               "* %? :NOTE:\n")
              ("j" "Journal" entry (file+olp+datetree diary-file)
               "* %?\n%U\n")
	      ("p" "project" entry 
	       (file project-file-target)
	       (file "~/Dropbox/org/templates/project-tmpl.txt"))
)))

;; Load up a bunch of files
(find-file (concat base-dir "resources.org"))
(find-file task-file-target)
(find-file (concat base-dir "personal.org"))
(find-file (concat base-dir "projects.org"))
(find-file (concat base-dir "work.org"))
;; (find-file (concat base-dir "slackup.org"))


(provide 'el-orgmode)
;;; el-orgmode.el ends here
