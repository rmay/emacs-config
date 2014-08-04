;;; el-orgmode.el starts here

;; If I'm on Windows
(if (eq system-type 'windows-nt)
  (progn
    ;; Use aspell instead of ispell
    (setq ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")
    (setq ispell-really-aspell t)
    (setq ispell-extra-args '("--sug-mode=fast"))

    ;; Org-mode Settings Begin
    (add-to-list 'load-path "c:/org/org-8.0.7/lisp")
    (add-to-list 'load-path "c:/org/org-8.0.7/contrib/lisp")
    (setq org-agenda-file "c:/Users/Russell/SkyDrive/Dropbox/org/tasks.org")
    (setq org-agenda-archive "c:/Users/Russell/SkyDrive/Dropbox/org/archive_personal.org::")

    ;; Capture

    ;; Commented out to try deft
    ;(global-set-key (kbd "<f9>") 'org-capture)
    ;(setq org-capture-templates
    ;'(("t" "Agenda Todo" entry
    ;	(file+headline "c:/Users/Russell/Dropbox/org/personal.org" "Agenda")
    ;	 "\n\n** TODO %?\n%T\n\n%i\n%a\n\n\n"
    ;	 :empty-lines 1)

    ;("j" "Journal" entry (file+datetree "c:/Users/Russell/Dropbox/org/journal.org")
    ;             "* %?\nEntered on %U\n  %i\n  %a")

    ;	("n" "Agenda Notes" entry
    ;	 (file+headline "c:/Users/Russell/Dropbox/org/personal.org" "Agenda")
    ;	 "\n\n** %?\n%T\n%i\n%a\n\n\n"
    ;	 :empty-lines 1)))
  
    ;; Set diary location
    (setq diary-file "C:/Users/Russell/SkyDrive/Dropbox/files/work/diary")
    
    (setq deft-dir "c:/Users/Russell/SkyDrive/Dropbox/PlainText/")
  
    (find-file "c:/Users/Russell/SkyDrive/Dropbox/org/tasks.org")
    (find-file "c:/Users/Russell/SkyDrive/Dropbox/org/personal.org")
  )
  (progn ; else
    ;;;(setq org-agenda-file "/home/russell/Dropbox/org/tasks.org")
    ;;;(setq org-agenda-archive "/home/russell/Dropbox/org/archive_personal.org::")
    (setq org-agenda-file "/home/russell/Dropbox/org/work.org")
    (setq org-agenda-archive "/home/russell/Dropbox/org/archive_work.org::")
    (setq deft-dir "/home/russell/Dropbox/PlainText/")
    (find-file "/home/russell/Dropbox/org/personal.org")
    (find-file "/home/russell/Dropbox/org/tasks.org")
    (find-file "/home/russell/Dropbox/org/work.org")
  )
)

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

;; Deft
(require 'deft)
(setq
  deft-extension "txt"
  deft-directory deft-dir
  ;deft-text-mode 'org-mode
  deft-use-filename-as-title 't
  )
(global-set-key (kbd "<f9>") 'deft)

;;; Turned it off because it was conflicting with deft
;;;(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))




(provide 'el-orgmode)
;;; el-orgmode.el ends here
