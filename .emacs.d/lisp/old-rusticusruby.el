;;; rusticusruby.el --- Setup for ruby modes

;; Ruby mode
(require 'ruby-mode)
(require 'ruby-electric)
(require 'inf-ruby)

;; Set those modes!
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(?:^\\|/\\)Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;; Like c-in-literal, only for Ruby
(defun ruby-in-literal ()
  (let* ((here (point))
         (state (save-excursion
                  (ruby-beginning-of-defun)
                  (parse-partial-sexp (point) here))))
    (or (nth 3 state)
        (nth 4 state)
        nil)))

;; Like c-electric-backspace, only for Ruby
(defun ruby-electric-backspace (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (prefix-numeric-value arg))
    (let ((here (point)))
      (skip-chars-backward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify 1)))))

(defun ruby-electric-delete (arg)
  (interactive "*P")
  (if (or arg (ruby-in-literal))
      (backward-delete-char-untabify (- (prefix-numeric-value arg)))
    (let ((here (point)))
      (skip-chars-forward " \t\n")
      (if (/= (point) here)
          (delete-region (point) here)
        (backward-delete-char-untabify -1)))))

;; Pipe the current buffer through mfp's xmpfilter
(defun ruby-annotate-buffer ()
  "Send the current current buffer to the annotation filter."
  (interactive "*")
  (let ((initial-line (count-lines (point-min) (point)))
        (initial-char (- (point) (point-at-bol))))
    (shell-command-on-region (point-min) (point-max) "xmpfilter.rb -a" nil t)
    (goto-line initial-line)
    (forward-char initial-char)))

;; Redefine this ruby-electric function so that we can use
;; ruby-electric-space w/o the minor mode (which doesn't play nice w/
;; multiple major modes).
(defun ruby-electric-code-at-point-p()
  (let* ((properties (text-properties-at (point))))
    (and (null (memq 'font-lock-string-face properties))
         (null (memq 'font-lock-comment-face properties)))))

;; Continuation lines should be indented.  Make it so, commander.
(defadvice ruby-calculate-indent
  (after ruby-indent-continuation-lines activate)
  "Advise ruby-mode to further indent continuation lines."
  (save-excursion
    (goto-char (point-at-bol))
    (skip-chars-backward " \t\n")
    (when (eq ?\\ (char-before))
      (setq ad-return-value (+ ruby-indent-level ad-return-value)))))

;; Add the Unit::Test output to the list of regexps understood by the
;; compile buffer
(add-to-list 'compilation-error-regexp-alist
             '("\\(\\./[^:]*\\):\\([0-9]*\\)" 1 2))
;; (REGEXP FILE-IDX LINE-IDX
;(setq compilation-error-regexp-alist (cdr compilation-error-regexp-alist))

;; Hide-show
(add-to-list 'hs-special-modes-alist
  (list 'ruby-mode
        (concat "\\(^\\s-*"
                ruby-electric-simple-keywords-re
                "\\|{\\|\\[\\)")
        "end\\|\\]\\|}" "#"
        'ruby-forward-sexp nil))



;; Some ruby-specific key-bindings
(add-hook 'ruby-mode-hook 'llasram/ruby-extra-keys)
(defun llasram/ruby-extra-keys ()
  (define-key ruby-mode-map "\C-m"      'newline-and-indent)
  (define-key ruby-mode-map " "         'ruby-electric-space)
  (define-key ruby-mode-map [backspace] 'ruby-electric-backspace)
  (define-key ruby-mode-map "\C-h"      'ruby-electric-backspace)
  (define-key ruby-mode-map [delete]    'ruby-electric-delete)
  (define-key ruby-mode-map "\C-d"      'ruby-electric-delete)
  (define-key ruby-mode-map "\C-c\C-a"  'ruby-annotate-buffer))

;; RI everywhere!
(define-key help-map "r" 'ri)

;; Smooooth scrolling
;;;(require 'smooth-scrolling)

(provide 'rusticusruby)
;;; rusticusruby.el ends here