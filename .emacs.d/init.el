;; Interface
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-frame-font "BlexMono Nerd Font 20" nil t)

;; Diretório padrão
(setq default-directory "d:/Development")

;; Backups e avisos
(setq make-backup-files nil)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; Linhas, reload e subword
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(global-auto-revert-mode 1)
(global-subword-mode 1)

;; CUA mode
(cua-mode 1)

;; Diretórios de customizações locais
(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Package setup
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)

;; Evil
(use-package evil
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; General for leader key
(use-package general
  :config
  (general-create-definer my/leader
    :states '(normal visual)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (my/leader
    "f"  '(:ignore t :which-key "files")
    "f d" 'find-file
    "f f" 'formatting-buffer
    "b"  'switch-to-buffer
    "k"  'kill-buffer
    "g"  '(:ignore t :which-key "git")
    "g s" 'magit-status
    "q"  'save-buffers-kill-terminal))

;; IDO mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Temas
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'naysayer t)

;; Project
(use-package project)

;; Git
(use-package magit
  :commands magit-status
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer
        magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

;; Auto-refresh dired on file change
(add-hook 'dired-mode-hook 'auto-revert-mode)

;; Reformatter (formatting.el usa isso)
(use-package reformatter)

;; Tree-sitter
(use-package treesit-auto
  :config
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(setq major-mode-remap-alist
      '((c-mode          . c-ts-mode)
        (c++-mode        . c++-ts-mode)
        (json-mode       . json-ts-mode)
        (js-mode         . js-ts-mode)
        (typescript-mode . tsx-ts-mode)))

;; Simpc
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(define-key key-translation-map (kbd "C-c") (kbd "<escape>"))
(define-key evil-normal-state-map (kbd "C-r") 'evil-redo)

;; Formatting custom
(require 'formatting)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil-collection general json-mode kotlin-mode lsp-ui magit
		     reformatter treesit-auto typescript-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
