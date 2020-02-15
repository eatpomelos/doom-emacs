;;; ~/.doom.d/misc.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "pomeloly"
      user-mail-address "2845748931@qq.com")

(setq company-idle-delay 0.1)

(use-package! youdao-dictionary
  :defer t
  :init
  (define-leader-key! "oy" 'youdao-dictionary-search-at-point+)
  (define-leader-key! "os" 'youdao-dictionary-play-voice-at-point)
  )

(use-package! edit-server
  :ensure t
  :config (edit-server-start))


(define-abbrev-table 'global-abbrev-table '(

                                            ;; math/unicode symbols
                                            ("7in" "∈")
                                            ("7nin" "∉")
                                            ("7inf" "∞")
                                            ("7luv" "♥")
                                            ("7smly" "☺")
                                            ("7en" "@~english")
                                            ("7zh" "@~chinese")
                                            ("7sp" "spacemacs")
                                            ;; email
                                            ("7me" "2845748931@qq.com")

                                            ;; computing tech
                                            ("7wp" "Wikipedia")
                                            ("7ms" "Microsoft")
                                            ("7g" "Google")
                                            ("7win" "Windows")

                                            ;; signature
                                            ("7pme" "pomelo")
                                            ("7zl" "zilongshanren")
                                            ;; emacs regex
                                            ("7d" "\\([0-9]+?\\)")
                                            ("7str" "\\([^\"]+?\\)\"")))

(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)

(add-hook 'find-file-hook 'pomelo/check-large-file)

 ;; 当输入lambda的时候变成一个符号
(global-prettify-symbols-mode 1)
