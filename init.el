;; init.el ---Emacs configuration

;; INSTALL PACKAGES
;; --------------------

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/"))
;; This will automatically set package-enable-at-startup to nil, to avoid loading the packages again after processing the init file.
      package-enable-at-startup nil)

(package-initialize)

;; refresh the package list
;; (package-refresh-contents)

;; init the use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(defvar myPackages
  '(better-defaults
    material-theme))

;; BASIC CUSTOMIZATION
;; -------------------------
(global-linum-mode t) ;; enable line numbers globally

;; truncate lines if too long
(setq truncate-lines nil)

;; org-mode
(require 'org)
;; Mark org mode work with files ending in .org 
;; The above is the default in recent emacsen
(use-package org
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode)))

;; org-roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Desktop/learning/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol)
)


;; org-roam-ui
(use-package websocket
    :after org-roam)

(use-package org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t)
)


;; lsp-java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))

;; init.el ends

;; variables

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-babel-load-languages '((emacs-lisp . t) (python . t) (java . t)))
 '(package-selected-packages
   '(org-roam-ui use-package yasnippet org-roam php-mode markdown-mode lsp-java)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

