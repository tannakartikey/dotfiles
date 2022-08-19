(require 'cl-lib)
(require 'ido)

;; Add MELPA as package archive. ELPA is default after Emacs 23
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)


;; START - package installation
;; https://wikemacs.org/wiki/Package.el
(defvar my-packages
  '(evil exec-path-from-shell magit org lsp-mode company projectile helm vterm)
  "List of packages to install")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
	   when(not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages
  (package-refresh-contents)

  ;; install missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;END


;; no-tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)


;; Start - Helm configure
(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
;; END


;; START - projectile config
;; https://docs.projectile.mx/projectile/installation.html
(require 'projectile)
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Ruby + RSpec
(projectile-register-project-type 'ruby-rspec '("Gemfile" "lib" "spec")
                                  :project-file "Gemfile"
                                  :compile "bundle exec rake"
                                  :src-dir "lib/"
                                  :test "bundle exec rspec"
                                  :test-dir "spec/"
                                  :test-suffix "_spec")

;; Ruby + Minitest
(projectile-register-project-type 'ruby-test '("Gemfile" "lib" "test")
                                  :project-file "Gemfile"
                                  :compile"bundle exec rake"
                                  :src-dir "lib/"
                                  :test "bundle exec rake test"
                                  :test-suffix "_test")

;; Rails + Minitest
(projectile-register-project-type 'rails-test '("Gemfile" "app" "lib" "db" "config" "test")
                                  :project-file "Gemfile"
                                  :compile "bundle exec rails server"
                                  :src-dir "lib/"
                                  :test "bundle exec rake test"
                                  :test-suffix "_test")

;; Rails + RSpec
(projectile-register-project-type 'rails-rspec '("Gemfile" "app" "lib" "db" "config" "spec")
                                  :project-file "Gemfile"
                                  :compile "bundle exec rails server"
                                  :src-dir "lib/"
                                  :test "bundle exec rspec"
                                  :test-dir "spec/"
                                  :test-suffix "_spec")
;; END


;; START - lsp languages list
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq lsp-enable-snippet nil)

;; Treat ERB as HTML in LSP
(add-to-list 'lsp-language-id-configuration '(".*\\.html\\.erb$" . "html"))

;; the JS files may try to install deno-ls automatically
;; and fail. Fire `lsp-install-server` and select 'ts-ls'
;; Opening the file now and firing 'lsp' should succeed.

;; JS files 2 space tab indent
(setq js-indent-level 2)
;;END


;; open split and focus
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; Enable Evil
(require 'evil)
;; (evil-mode 1)

;; "jk" as escape in evil-mode
(evil-define-key 'insert 'global (kbd "jk") 'evil-normal-state)
(evil-define-key 'insert 'global (kbd "jk") 'evil-visual-state)


;; Disable Emacs VC branch display
;; It does not update automatically when the branch is switched
;; https://magit.vc/manual/magit/The-mode_002dline-information-isn_0027t-always-up_002dto_002ddate.html
(setq-default mode-line-format
              (delete '(vc-mode vc-mode) mode-line-format))

;; START - remap del and help keybindings
;; https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
;; (keyboard-translate ?\C-h ?\C-?)

;; overrides mark-whole-buffer
;; (global-set-key "\C-xh" 'help-command)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Init-Rebinding.html#Init-Rebinding

;; other material on the subject:
;; https://www.emacswiki.org/emacs/BackspaceKey
;; https://ftp.gnu.org/old-gnu/Manuals/emacs-20.7/html_node/emacs_457.html
;; Keymap translates are different than keyboard-translate. Following is for keymap
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Translation-Keymaps.html#Interaction-with-normal-keymaps
;; END


;; Enable exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Display line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; Increase font-size
(set-face-attribute 'default (selected-frame) :height 200)
(set-face-attribute 'mode-line nil :height 120)

;; Load Tango Dark default theme
(load-theme 'tango-dark)

;; START
;; The following section has to be added automatically
;; It seems that it appeared because the packages were
;; installed manually using install-package option earlier
;;
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-enabled-themes '(tango-dark))
;;  '(evil-want-C-u-scroll t)
;;  '(package-selected-packages
;;    '(evil rust-mode ruby-electric minitest inf-ruby exec-path-from-shell)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; END
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(magit exec-path-from-shell evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
