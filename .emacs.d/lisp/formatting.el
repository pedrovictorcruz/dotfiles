;; Formatting Configuration

(use-package reformatter
  :ensure t)

(defun biome-root-present-p ()
  "Check if biome.js exists in any parent directory."
  (locate-dominating-file default-directory "biome.js"))

(defun setup-biome-format ()
  "Enable biome formatting if biome.js is present in the project root."
  (when (biome-root-present-p)
    (reformatter-define biome-format
      :program "biome"
      :args '("format" "--stdin-filepath" buffer-file-name)
      :group 'biome)
    (biome-format-on-save-mode 1)))

(add-hook 'typescript-mode-hook #'setup-biome-format)

(provide 'formatting)
