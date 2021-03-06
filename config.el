;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.

(setq doom-theme 'doom-dracula)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/pomelo/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(if IS-WINDOWS
    (progn
      (setq-default browse-url-temp-dir "~/.local/tmp/")
      (setq-default temporary-file-directory "~/.local/tmp/")
      (setq-default mm-tmp-directory "~/.local/tmp/"))
  nil)

;; some directories
(setq deft-directory "~/pomelo/org/notes/")

;; local paclages path
(defvar pomelo-local-packages-dir (concat pomelo-doom-config-dir "/local/packages/"))

;; 下面的是为了解决之前输入中文卡顿的原因，同时也解决了一些字显示的问题。
(set-language-environment 'utf-8)

(load! "+ui")
(load! "+misc")
(load! "+prog")
(load! "+org")
(load! "+funcs")
(load! "+binding")
