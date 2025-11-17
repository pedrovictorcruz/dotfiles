;; Interface
(setq inhibit-startup-screen t)
(menu-bar-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(delete-selection-mode t)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Autosave (off)
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

;; Appearance
(defun rc/get-default-font ()
  (cond
   ((eq system-type 'windows-nt) "Consolas-20")
   ((eq system-type 'darwin) "Iosevka-20")
   ((eq system-type 'gnu/linux) "Iosevka-20")))
(add-to-list 'default-frame-alist `(font . ,(rc/get-default-font)))

;; Diretório padrão
(defun rc/get-default-directory ()
  (cond
   ((eq system-type 'windows-nt) "e:/")
   ((eq system-type 'darwin) "~/")
   ((eq system-type 'gnu/linux) "~/")))
(setq default-directory (rc/get-default-directory))

;; Linhas, reload e subword --------------------------------------------------
(global-display-line-numbers-mode 1)
(setq-default truncate-lines t)
(setq display-line-numbers 'relative)
(global-auto-revert-mode 1)
(global-subword-mode 1)

;; Add modes directory
(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))

(setq major-mode-remap-alist
      '((c-mode          . c-ts-mode)
        (c++-mode        . c++-ts-mode)
        (json-mode       . json-ts-mode)
        (js-mode         . js-ts-mode)))

;; Backups e avisos ----------------------------------------------------------
(setq make-backup-files nil)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; Tabs ----------------------------------------------------------------------
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)

(add-hook 'prog-mode-hook
          (lambda ()
            (setq-local indent-tabs-mode t)
            (setq-local tab-width 4)))

;; Modes --------------------------------------------------------------------

;; Simpc
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; TypeScript
(require 'typescript-mode)

;; Kotlin
(require 'kotlin-mode)


;; Package system ------------------------------------------------------------
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; IDO ----------------------------------------------------------------------
(require 'ido)
(ido-mode t)

;; C / C++ -------------------------------------------------------------------
(setq-default c-basic-offset 4)
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq-local c-basic-offset 4)
            (setq-local indent-tabs-mode t)
            (setq-local tab-width 4)
            (c-set-offset 'substatement-open 0)
            (c-set-offset 'substatement '+)))

;; Custom (Emacs auto-managed) -----------------------------------------------
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
 '(package-selected-packages '(eglot gruber-darker-theme magit)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
