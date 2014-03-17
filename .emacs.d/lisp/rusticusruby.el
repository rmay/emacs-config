;;; rusticusruby.el --- Setup for ruby modes

;; Ruby mode
(require 'ruby-mode)
(require 'ruby-electric)
;(require 'inf-ruby)


(add-to-list 'auto-mode-alist
               '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list 'auto-mode-alist
               '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))
;;(add-to-list 'auto-mode-alist
;;               '("\\.\\(erb\\)\\'" . ruby-mode))

;;(autoload 'run-ruby "inf-ruby"
;;      "Run an inferior Ruby process")
;;    (autoload 'inf-ruby-keys "inf-ruby"
;;      "Set local key defs for inf-ruby in ruby-mode")
;;    (add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;    ))
    
(eval-after-load "ruby-mode"
  '(add-hook 'ruby-mode-hook 'ruby-electric-mode))

(provide 'rusticusruby)
;;; rusticusruby.el ends here
