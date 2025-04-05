;; Interface
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-frame-font "FiraMono Nerd Font 20" nil t)

;; Diretório padrão
(setq default-directory "~/development")

;; Backups e avisos
(setq make-backup-files nil)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; Linhas, reload e subword
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(global-auto-revert-mode 1)
(global-subword-mode 1)

(setq shell-file-name "/usr/bin/bash")
(setenv "SHELL" shell-file-name)

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

;; use-package bootstrap
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
    "f d" 'find-file
    "f f" 'lsp-format-buffer
    "b"  'switch-to-buffer
    "k"  'kill-buffer
    "g"  '(:ignore t :which-key "git")
    "g s" 'magit-status
    "q"  'save-buffers-kill-terminal
    "K"  'lsp-ui-doc-show
    "r n" 'lsp-rename
    "g d" 'lsp-find-definition
    "g r" 'lsp-find-references))

;; IDO
(use-package ido
  :init
  (setq ido-enable-flex-matching t
        ido-create-new-buffer 'always
        confirm-nonexistent-file-or-buffer nil
        ido-ignore-buffers '("\\` " "^\\*"))
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (global-set-key (kbd "C-x b") 'ido-switch-buffer))

(setq ido-create-new-buffer 'always)
(setq confirm-nonexistent-file-or-buffer nil)

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

;; JSON
(use-package json-mode)

;; Reformatter (formatting.el usa isso)
(use-package reformatter)

;; LSP
(use-package lsp-mode
  :hook ((typescript-mode . lsp)
         (kotlin-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (csharp-mode . lsp))
  :commands lsp
  :config
  (setq lsp-enable-snippet nil))

(use-package lsp-ui
  :commands lsp-ui-mode)

;; Linguagens
(use-package typescript-mode
  :mode ("\\.ts\\'" "\\.tsx\\'" "\\.js\\'" "\\.jsx\\'"))

(use-package kotlin-mode
  :mode ("\\.kts?\\'")
  :config
  (setq kotlin-tab-width 4))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(use-package csharp-mode
  :mode ("\\.cs\\'" . csharp-mode))

;; Move lines
(defun move-line-up () (interactive) (transpose-lines 1) (previous-line 2))
(defun move-line-down () (interactive) (next-line 1) (transpose-lines 1) (previous-line 1))
(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)

(define-key key-translation-map (kbd "C-c") (kbd "<escape>"))
(define-key evil-normal-state-map (kbd "C-r") 'evil-redo)

;; Formatting custom
(require 'formatting)

(custom-set-variables
 '(package-selected-packages nil))
(custom-set-faces)
