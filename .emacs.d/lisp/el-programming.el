;;; el-programming.el starts here

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


;;(require 'sr-speedbar)

;;(setq speedbar-frame-parameters
;;      '((minibuffer)
;;	(width . 10)
;;	(border-width . 0)
;;	(menu-bar-lines . 0)
;;	(tool-bar-lines . 0)
;;	(unsplittable . t)
;;	(left-fringe . 0)))
;;;(setq speedbar-hide-button-brackets-flag t)
;;(setq speedbar-show-unknown-files t)
;;;(setq speedbar-smart-directory-expand-flag t)
;;(setq speedbar-use-images nil)
;;(setq sr-speedbar-auto-refresh t)
;;(setq sr-speedbar-max-width 10)
;;(setq sr-speedbar-width-x 10)
;;(setq sr-speedbar-right-side nil)
;;(setq sr-speedbar-width-console 10)
;;'(sr-speedbar-open)

;;(when window-system
;;  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
;;    (set-frame-width (selected-frame)
;;                     (+ (frame-width) sr-speedbar-width)))
;;  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)

;;  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
;;    (sr-speedbar-recalculate-width)
;;    (set-frame-width (selected-frame)
;;                     (- (frame-width) sr-speedbar-width)))
;;  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)


;;(require 'smartparens-config)
;;(require 'smartparens-ruby)
;;(smartparens-global-mode)
;;(show-smartparens-global-mode t)
;;(sp-with-modes '(rhtml-mode)
;;   (sp-local-pair "<" ">")
;;   (sp-local-pair "<%" "%>"))


(provide 'el-programming)
;;; el-programming.el ends here
