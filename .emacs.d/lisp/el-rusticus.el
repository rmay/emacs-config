;;; el-rusticus.el --- My setup file

;;(setq warning-minimum-level :error)

(set-scroll-bar-mode 'right)

(require 'ido)
(ido-mode t)

;; Set the starting position and width and height of Emacs Window
;;(setq initial-frame-alist '((top . 10) (left . 30) (width . 120) (height . 35) ))
(setq initial-frame-alist '((width . 120) (height . 35) ))

;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

(set-cursor-color "blue")
 
(setq default-frame-alist
  '((cursor-color . "blue")))

(display-time)

(global-visual-line-mode 1)

;; Redirect backups
;(setq backup-directory-alist (quote ((".*" . "c:/.emacs_backups/"))))
(setq make-backup-files nil)
(setq auto-save-visited-file-name t)

;; remove toolbar
(tool-bar-mode -1)

(put 'upcase-region 'disabled nil)

(column-number-mode 1)
(show-paren-mode t)

;; Kill the start up message
(setq inhibit-startup-message t)

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Few of my tweaks
(global-set-key [f7] 'goto-line)
(global-set-key [f8] 'indent-region)
(global-set-key [f2] 'eshell)
(global-set-key [f3] 'calendar)
(global-set-key "\C-f" 'isearch-forward-regexp)
(global-set-key "\C-k" 'kill-whole-line)

;; Indentation
(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(setq-default tab-stop-list (list 2 4 6 8 10 12 14 16 18 20 22 24 26 28 60 64 68 72 76 80))
;(setq-default tab-width 2)
(set-default 'javascript-indent-level 2)
(setq-default indent-tabs-mode nil)

;; Backward word kill key binding
(global-set-key "\C-w" 'backward-kill-word)

;; smooth scrolling
(require 'smooth-scrolling)

;; Using my initials to avoid possible namespace collisions
(require 'linum)
(add-hook 'rdm-code-modes-hook
          (lambda () (linum-mode 1)))
(add-hook 'ruby-mode-hook
          (lambda () (run-hooks 'rdm-code-modes-hook)))
(add-hook 'html-mode-hook
          (lambda () (run-hooks 'rdm-code-modes-hook)))
(add-hook 'text-mode-hook
          (lambda () (run-hooks 'rdm-code-modes-hook)))
(add-hook 'python-mode-hook
          (lambda () (run-hooks 'rdm-code-modes-hook)))
  
;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Explicitly show the end of a buffer
(set-default 'indicate-empty-lines t)

;;; Highlight current line
(global-hl-line-mode 1)
;; Great for white background
(set-face-background 'hl-line "lemon chiffon")

;;; Auto revert mode
(global-auto-revert-mode 1)

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
    (setq org-agenda-file "/home/russell/Dropbox/org/tasks.org")
    (setq org-agenda-archive "/home/russell/Dropbox/org/archive_personal.org::")
    (setq deft-dir "/home/russell/Dropbox/PlainText/")
    (find-file "/home/russell/Dropbox/org/personal.org")
    (find-file "/home/russell/Dropbox/org/tasks.org")
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


;; CSS mode
(setq auto-mode-alist
      (append '(("\\.css$" . html-mode)) auto-mode-alist))

;; SVN
;;(require 'psvn)

;; Ruby
(require 'rusticusruby)

;; javascript mode
(require 'javascript-mode)
(setq auto-mode-alist
      (append '(("\\.js$" . javascript-mode)) auto-mode-alist))


;;(flyspell-mode 1)
(add-hook 'text-mode-hook
          (lambda () (flyspell-mode 1)))
(add-hook 'org-mode-hook
          (lambda () (flyspell-mode 1)))
(add-hook 'diary-mode-hook
          (lambda () (flyspell-mode 1)))
;;(add-hook 'diary-display-hook 'flyspell-mode)

(setq visible-bell t)

; This was bugging me with Deft, so I took it out
;;;(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

(require 'sr-speedbar)

(setq speedbar-frame-parameters
      '((minibuffer)
	(width . 10)
	(border-width . 0)
	(menu-bar-lines . 0)
	(tool-bar-lines . 0)
	(unsplittable . t)
	(left-fringe . 0)))
;(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
;(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-max-width 10)
(setq sr-speedbar-width-x 10)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 10)
'(sr-speedbar-open)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))


;;(add-to-list 'load-path "C:/Users/Russell/.emacs.d/color-theme/")
;;(require 'color-theme)
;;(eval-after-load "color-theme"
;;  '(progn
;;     (color-theme-initialize)
;;     ))
;; old setting - 
;(color-theme-hober)


;;(add-to-list 'load-path ;;"c:/Users/Russell/.emacs.d/emacs-color-theme-solarized/")
;;(require 'color-theme-solarized)
;;(color-theme-solarized-light)
;;(color-theme-snowish)





(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa" . 
      "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
    '("gnu" . 
      "http://elpa.gnu.org/packages/"))
(package-initialize)

(require 'auto-complete-config)
 ;(add-to-list 'ac-dictionary-directories
 ;    "~/.emacs.d/.cask/24.3.50.1/elpa/auto-complete-20130724.1750/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)

;(load-theme 'zenburn t)


;(require 'color-theme-sanityinc-tomorrow)

;(require 'smartparens-config)
;(require 'smartparens-ruby)
;(smartparens-global-mode)
;(show-smartparens-global-mode t)
;(sp-with-modes '(rhtml-mode)
;   (sp-local-pair "<" ">")
;   (sp-local-pair "<%" "%>"))



(provide 'el-rusticus)
;;; el-rusticus.el ends here

