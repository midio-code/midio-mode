;;; midio-mode.el -*- lexical-binding: t; -*-

;; Define keywords, built-in types, and attribute names
(defvar midio-font-lock-keywords
  `(("\\<\\(native_dependencies_location\\|extern\\|parameter\\|instance\\|data_instance\\|true\\|false\\|module\\|type\\|func\\|event\\|in\\|out\\|trigger\\|property\\)\\>" . font-lock-keyword-face)
    ("\\<\\(Number\\|String\\|Bool\\|Any\\|Opaque\\)\\>" . font-lock-type-face)
    ("\\<\\(doc\\|hidden\\|consumes\\|borrows\\|provides\\|x\\|y\\|name\\)\\>" . font-lock-builtin-face)
    ("\"[^\"]*\"" . font-lock-string-face)
    ("\\b\\([0-9]+\\.[0-9]*\\|[0-9]+\\)\\b" . font-lock-constant-face)
    ("\\[\\([^]]*\\)\\]" . font-lock-variable-name-face)
    ("\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" . font-lock-variable-name-face)
    ("->" . font-lock-function-name-face)))

;; Define the Midio mode
(define-derived-mode midio-mode prog-mode "Midio"
  "Major mode for editing Midio files."
  (setq font-lock-defaults '(midio-font-lock-keywords))
  (setq-local comment-start "// ")
  (setq-local comment-end ""))

;; Associate Midio mode with .midio files
(add-to-list 'auto-mode-alist '("\\.midio\\'" . midio-mode))

(provide 'midio-mode)
