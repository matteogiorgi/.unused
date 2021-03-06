; (setq user-emacs-directory "~/.emacs.d") 
; (require 'package)
; (require 'use-package)


; (package-initialize)
; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
; (add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))


;; Remove all bars and statup screen
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)


;; Add evil-mode
; (add-to-list 'load-path "~/.emacs.d/evil")
; (require 'evil)
; (evil-mode 1)


;; Open .v files with Proof General
; (load "~/.emacs.d/lisp/PG/generic/proof-site")


;; Display line numbers and other stuff
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))


(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)


(set-face-attribute 'default nil :font "mononoki Nerd Font-9")
(set-frame-font "mononoki Nerd Font-9" nil t)
