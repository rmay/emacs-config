;;; el-packages.el starts here

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



(provide 'el-packages)
;;; el-packages.el ends here
