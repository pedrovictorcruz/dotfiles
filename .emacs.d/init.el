(setq inhibit-startup-screen t)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(tool-bar-mode -1)

(set-frame-font "JetBrainsMonoNerdFont 20" nil t)

(setq make-backup-files nil)

(setq visible-bell 1)
(setq ring-bell-function 'ignore)

(global-display-line-numbers-mode 1)

(global-auto-revert-mode 1)

(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)
(setq ido-ignore-buffers '("\\` " "^\*"))
(ido-mode t)
(ido-everywhere t)

(global-set-key (kbd "C-x b") 'ido-switch-buffer)

(global-subword-mode 1)

;; Configura o Emacs para usar o Bash como shell padrão
(setq shell-file-name "/bin/bash")
(setq explicit-shell-file-name "/bin/bash")

;; Define o argumento padrão como shell interativo
(setq explicit-bash-args '("-i"))

;; Corrige problemas com caracteres estranhos no prompt
(setq comint-prompt-read-only t)

;; Move line up
(defun move-line-up ()
  "Move the current line up."
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

;; Move line down
(defun move-line-down ()
  "Move the current line down."
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

;; Keybindings for moving lines
(global-set-key (kbd "M-p") 'move-line-up)
(global-set-key (kbd "M-n") 'move-line-down)

(cua-mode t)

;; Adicionando MELPA
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Atualiza a lista de pacotes se ainda não estiver instalada
(unless package-archive-contents
  (package-refresh-contents))

;; Themes
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'naysayer t)

;; Modes
(add-to-list 'load-path (expand-file-name "modes" user-emacs-directory))

;; C - C++
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; Typescript
(require 'typescript-mode)
(add-to-list 'auto-mode-alist '("\\.[jt]s[x]?\\'" . typescript-mode))

;; Kotlin
(require 'kotlin-mode)
(add-to-list 'auto-mode-alist '("\\.kts?\\'" . kotlin-mode))

(setq magit-status-buffer-switch-function 'switch-to-buffer)
(setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)

;; Packages
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(reformatter magit json-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'formatting)
