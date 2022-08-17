;; init.el ---Emacs configuration

;; INSTALL PACKAGES
;; --------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(global-linum-mode t) ;; enable line numbers globally

;; org-mode
(require 'org)
;; Mark org mode work with files ending in .org 
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; lsp-java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-java)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; init.el ends 
