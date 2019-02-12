;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Replacement for my traditional `.emacs` file which can be more easily
;; packaged in a git repo and shipped around
;;
;; It is intended that, should one use this, one's .emacs file should consist
;; solely of
;;
;; (add-to-list 'load-path "~/.emacs.d/lisp")
;; (load "~/.emacs.d/lisp/dot_emacs.el")

(setq indent-tabs-mode '())

(add-to-list 'load-path "~/.emacs.d/lisp/solarized-emacs")
(add-to-list 'load-path "~/.emacs.d/lisp/dash.el")
(add-to-list 'load-path "~/.emacs.d/lisp/SusColors-emacs")
(if window-system
    (load "suscolors-theme"))
;; (load "~/.emacs.d/lisp/solarized-emacs/solarized-dark-theme.el")

(if (> (length (shell-command-to-string "which sbcl")) 0)
    (progn
      (message (concat "I think sbcl is at :: "
		       (substring
			(shell-command-to-string "which sbcl") 0 -1)))
      (add-to-list 'load-path "~/.emacs.d/lisp/slime")
      (require 'slime-autoloads)
      (setq inferior-lisp-program
	    (substring (shell-command-to-string "which sbcl") 0 -1))
      (setq slime-contribs '(slime-fancy)))
  (message "sbcl not found"))

;; consider adding
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))


(add-to-list 'load-path "~/.emacs.d/lisp/geiser/elisp/")
(load "geiser")

(add-to-list 'load-path "~/.emacs.d/lisp/clojure-mode")
(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
(load "clojure-mode")

(when (member "Monaco" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Monaco")))

(add-to-list 'load-path "~/.emacs.d/lisp/rust-mode")
(load "rust-mode")
(autoload 'rust-mode "rust-mode"
  "Major mode for editing rust files" t)
(add-to-list 'load-path "~/.emacs.d/lisp/yaml-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors.el")
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/julia-emacs")
(add-to-list 'load-path "~/.emacs.d/lisp/julia-shell-mode")
(require 'julia-shell)
(autoload 'julia-mode "julia-mode"
  "Major mode for editing Julia source files" t)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.jl\\'" . julia-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


(defun my-julia-mode-hooks ()
  (require 'julia-shell)
  )
(add-hook 'julia-mode-hook 'my-julia-mode-hooks)
(define-key julia-mode-map (kbd "C-c C-c") 'julia-shell-run-region-or-line)
(define-key julia-mode-map (kbd "C-c C-s") 'julia-shell-save-and-go)


(require 'multiple-cursors)

