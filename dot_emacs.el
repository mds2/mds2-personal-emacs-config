;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replacement for my traditional `.emacs` file which can be more easily
;; packaged in a git repo and shipped around
;;
;; It is intended that, should one use this, one's .emacs file should consist
;; solely of
;;
;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (load "~/.emacs.d/lisp/dot_emacs.el")


(add-to-list 'load-path "~/.emacs.d/lisp/solarized-emacs")
(add-to-list 'load-path "~/.emacs.d/lisp/dash.el")
(load "~/.emacs.d/lisp/solarized-emacs/solarized-dark-theme.el")

(add-to-list 'load-path "~/.emacs.d/lisp/slime")
(require 'slime-autoloads)
(setq inferior-lisp-program
      "/usr/local/bin/sbcl") ; why is the path not set right here???
;; (setq inferior-lisp-program
;;       (substring (shell-command-to-string "which sbcl") 0 -1))
(setq slime-contribs '(slime-fancy))

(add-to-list 'load-path "~/.emacs.d/lisp/clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(load "clojure-mode")

(when (member "Monaco" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Monaco")))

(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors.el")
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(require 'multiple-cursors)

