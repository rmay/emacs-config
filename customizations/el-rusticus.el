;; A slew of my changes
(prefer-coding-system 'utf-8)
(display-time)
(column-number-mode 1)
(global-visual-line-mode 1)
(global-hl-line-mode 1)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(prefer-coding-system 'utf-8)
(set-cursor-color "blue")
(global-set-key "\C-w" 'backward-kill-word)
(fset 'yes-or-no-p 'y-or-n-p)
(setq create-lockfiles nil)

(global-linum-mode)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; full path in title bar
(setq-default frame-title-format "%b (%f)")


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

;; Projects and neotree
(setq base-development-dir "~/work/")
;;(find-file (concat base-development-dir "cra-reporting-rabbitmq-clojure/src/rabbitmq/process_factortrust_report.clj"))

;;;(require 'neotree)
;;;(global-set-key [f8] 'neotree-toggle)
;;(setq neo-theme 'classic)
;;(setq neo-theme 'ascii) 
;;(setq neo-theme 'arrow)
;;(setq neo-theme 'icons)
;;;(setq neo-theme 'nerd)

;;(neotree-toggle)
;;(neotree-dir "~/work")
;;;(switch-to-buffer-other-window "*scratch*")

;;;(require 'smooth-scrolling)
;;(smooth-scrolling-mode 1)

;;;; (split-window-right)

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


(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 45)))

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)
