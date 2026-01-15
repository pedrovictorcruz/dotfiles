;;; init.el -*- lexical-binding: t; -*-

;; Evil Config
(setq evil-want-keybinding nil) ;; required by evil-collection
(setq evil-want-integration t)
(setq evil-want-C-u-scroll t)
(setq evil-want-C-i-jump t)

;; ---------------------------------------------------------------------------
;; Package system (early init)
;; ---------------------------------------------------------------------------
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defun rc/ensure-package-installed (&rest packages)
  "Install missing PACKAGES automatically."
  (dolist (pkg packages)
    (unless (package-installed-p pkg)
      (package-install pkg))))

;; Only real packages (local modes are NOT here)
(rc/ensure-package-installed
 'eglot
 'gruber-darker-theme
 'magit
 'typescript-mode
 'kotlin-mode
 'evil
 'evil-collection)

;; ---------------------------------------------------------------------------
;; Evil (Vim emulation)
;; ---------------------------------------------------------------------------

(require 'evil)
(evil-mode 1)

(require 'evil-collection)
(evil-collection-init)

;; ---------------------------------------------------------------------------
;; Interface
;; ---------------------------------------------------------------------------
(setq inhibit-startup-screen t)

(menu-bar-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(delete-selection-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; Disable backups / autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

;; ---------------------------------------------------------------------------
;; Appearance
;; ---------------------------------------------------------------------------
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-20")
   ((eq system-type 'darwin) "Comic Code-20")
   ((eq system-type 'gnu/linux) "Comic Code-20")))

(setq-default line-spacing 4)

(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

(load-theme 'gruber-darker t)

;; ---------------------------------------------------------------------------
;; Default directory
;; ---------------------------------------------------------------------------
(setq default-directory
      (cond
       ((eq system-type 'windows-nt) "e:/")
       (t "~/")))

;; ---------------------------------------------------------------------------
;; Editor behavior
;; ---------------------------------------------------------------------------
(global-display-line-numbers-mode 1)
(setq display-line-numbers 'relative)
(setq-default truncate-lines t)

(global-auto-revert-mode 1)
(global-subword-mode 1)

(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; ---------------------------------------------------------------------------
;; Tabs & indentation
;; ---------------------------------------------------------------------------
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode t)
            (setq-local tab-width 4)))

;; C / C++
(setq-default c-basic-offset 4)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'substatement-open 0)
            (c-set-offset 'substatement '+)))

;; ---------------------------------------------------------------------------
;; Tree-sitter remaps (Emacs 29+)
;; ---------------------------------------------------------------------------
(setq major-mode-remap-alist
      '((c-mode    . c-ts-mode)
        (c++-mode  . c++-ts-mode)
        (json-mode . json-ts-mode)
        (js-mode   . js-ts-mode)))

;; ---------------------------------------------------------------------------
;; IDO
;; ---------------------------------------------------------------------------
(require 'ido)
(ido-mode 1)

;; ---------------------------------------------------------------------------
;; Local modes (static)
;; ---------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; ---------------------------------------------------------------------------
;; Language packages
;; ---------------------------------------------------------------------------
(require 'typescript-mode)
(require 'kotlin-mode)

;; ---------------------------------------------------------------------------
;; LSP
;; ---------------------------------------------------------------------------
(add-hook 'prog-mode-hook #'eglot-ensure)

;; ---------------------------------------------------------------------------
;; Custom (Emacs managed)
;; ---------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
	 "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
	 default))
 '(package-selected-packages nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
