;; A slew of my changes
(setq backup-inhibited t)
(prefer-coding-system 'utf-8)
(display-time)
(column-number-mode 1)
(global-visual-line-mode 1)
(global-hl-line-mode -1)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
;; (set-cursor-color "blue")
(global-set-key "\C-w" 'backward-kill-word)
(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)
(setq ns-pop-up-frames nil)
;;(tool-bar-mode -1)
(unless (display-graphic-p) (menu-bar-mode -1))
(global-auto-revert-mode t)
;; Enhancements for ido
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
  (defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
  (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
  (defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
    (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
    (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
  (add-hook 'ido-setup-hook 'ido-define-keys)


(global-linum-mode)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))



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

(load "el-orgmode.el")

;; Rainbows
(add-hook 'emacs-lisp-mode-hook       #'rainbow-delimiters-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook             #'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook #'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook           #'rainbow-delimiters-mode)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)


;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; powerline
(require 'powerline)


;; For MacTeX for LaTex
;;(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))


(setq insert-date-format "%m-%d-%Y %A")
(defun rmay/insert-date ()
  "Inserts the current date at point in the format specified by `insert-date-format'."
  (interactive "*")
  (insert (format-time-string insert-date-format)))

;; (define-key global-map [(control c)(m)] 'rmay/insert-date)

(defun rmay/open-gcal-agenda ()
  "Open my google calendar agenda file. The agenda is displayed in the buffer *gcal*."
  (interactive)
  ;; set name of calendar buffer and location of file containing my agenda
  (let ((tmp-buff-name "*gcal*") (cal-file (expand-file-name "~/Nextcloud/org/gcal")))
    ;; switch to calendar buffer
    (switch-to-buffer tmp-buff-name)
    ;; turn off read only to overwrite if buffer exists
    (read-only-mode -1)
    ;; clear buffer
    (erase-buffer)
    ;; insert agenda file
    (insert-file-contents cal-file)
    ;; turn on colours
    (display-ansi-colors)
    ;; turn on special mode
    (special-mode)
    ;; turn off line wrapping
    (visual-line-mode -1)))

(defun rmay/gcal-agenda-refresh ()
  "Call gcalcli to save agenda to a file."
  (interactive)
  (let ((default-directory "~/Nextcloud/org/")) (shell-command "gcalcli agenda > gcal")))


(defun rmay/weather ()
  "Call wttrin"
  (interactive)
  (wttrin "Draper"))

(defun rmay/add-checkbox ()
  "Quick checkbox add"
  (interactive)
  (insert "- [ ] "))
(define-key global-map [(control c)(m)] 'rmay/add-checkbox)

(defun rmay/project ()
  "Set up neotree"
  (interactive)
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
  ;;(setq neo-theme 'classic)
  (setq neo-theme 'ascii) 
  ;;(setq neo-theme 'arrow)
  ;;(setq neo-theme 'icons)
  ;;(setq neo-theme 'nerd)
  (neotree-toggle)
  (neotree-dir "~/Nextcloud/org")
  ;;(switch-to-buffer-other-window "*scratch*")
)

(require 'exec-path-from-shell) 
(exec-path-from-shell-initialize)
;;(when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))


(require 'dired )

(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-advertised-find-file

(define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file "..")))  ; was dired-up-directory

;(projectile-mode +1)
;(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)


;; Define word
(global-set-key (kbd "C-c d") 'define-word-at-point)


(load "el-decor.el")
