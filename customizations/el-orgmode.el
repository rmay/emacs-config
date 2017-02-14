;;; el-orgmode.el starts here

(setq base-dir "~/Documents/Dropbox/org/")
(setq org-agenda-file (concat base-dir "work.org"))
(setq org-agenda-archive (concat base-dir "archive_work.org::"))
(find-file (concat base-dir "dreadilk.org"))
(find-file (concat base-dir "personal.org"))
;;(find-file (concat base-dir "tasks.org"))
(find-file (concat base-dir "work.org"))


;; Org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\todo.txt\\'" . org-mode))
(setq org-agenda-files (list org-agenda-file))
(setq org-archive-location org-agenda-archive )
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;; For exporting orgmode to git flavored markdown
(require 'ox-gfm)

(provide 'el-orgmode)
;;; el-orgmode.el ends here
