;; full path in title bar
(setq-default frame-title-format "%b (%f)")

(require 'doom-themes)
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; (load-theme 'doom-one t)
;(load-theme 'doom-dracula t)
;; (load-theme 'doom-molokai t)
;; Almost but too light (load-theme 'doom-nord-light t)
;; (load-theme 'doom-one-light t)

;; I really amd digging this one
(load-theme 'doom-peacock t)
(doom-themes-org-config)

(set-face-attribute 'region nil :background "#ff5d38")

(require 'ansi-color)
(defun display-ansi-colors ()
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

;;(setq initial-frame-alist '((top . 0) (left . 5) (width . 150) (height . 45)))

(defun rmay/size-it ()
  "Resize frame"
  (interactive)
  (set-frame-width (selected-frame) 150); adapt size
  (set-frame-height (selected-frame) 45)
  )

(rmay/size-it)
