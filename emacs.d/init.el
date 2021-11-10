(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load "~/.emacs.d/checkos")

(exec-path-from-shell-initialize)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(when (my-system-type-is-darwin)
  (set-face-attribute 'default nil :height 200)
  )

(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))

(unless (package-installed-p 'ruby-electric)
  (package-install 'ruby-electric))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))

(unless (package-installed-p 'minitest)
  (package-install 'minitest))
(setq compilation-scroll-output t)

;; From rust-lange/rust-mode README
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))
(require 'rust-mode)

; rust style guide recommends spaces rather than tabs
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(global-set-key (kbd "C-x C-l") 'comint-clear-buffer)

; Code formatting
(setq rust-format-on-save t)

; Running / testing / compiling code
(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)

;; to focus on the split
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; kill the buffer without the prompt
;; https://superuser.com/a/354878/631899
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(tango-dark))
 '(package-selected-packages
   '(rust-mode ruby-electric minitest inf-ruby magit exec-path-from-shell undo-fu solarized-theme js2-mode evil-escape)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

