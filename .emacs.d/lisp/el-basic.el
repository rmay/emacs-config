;;; el-basic.el --- My setup file

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
;;(global-set-key [f8] 'indent-region)
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

(message "Flyspell mode")
(eval-after-load "flyspell"
    '(progn
       (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
       (define-key flyspell-mouse-map [mouse-3] #'undefined)))
(setq ispell-program-name "/usr/local/bin/aspell")
;;(flyspell-mode 1)
(add-hook 'text-mode-hook
          (lambda () (flyspell-mode 1)))
(add-hook 'org-mode-hook
          (lambda () (flyspell-mode 1)))
(add-hook 'diary-mode-hook
          (lambda () (flyspell-mode 1)))
;;(add-hook 'diary-display-hook 'flyspell-mode)

(setq visible-bell nil)



;; Frame title bar formatting to show full path of file
(setq-default
frame-title-format
(list '((buffer-file-name " %f" (dired-directory
dired-directory
(revert-buffer-function " %b"
("%b – Dir:  " default-directory)))))))


(provide 'el-basic)
;;; el-basic.el ends here
