;;; ~/.doom.d/misc.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "pomeloly"
      user-mail-address "2845748931@qq.com")

(setq company-idle-delay 0.1)
(setq default-directory "~")
;; (setq default-directory "D:/pomelo")

(use-package! youdao-dictionary
  :defer t
  :init
  (define-leader-key! "oy" 'youdao-dictionary-search-at-point+)
  (define-leader-key! "os" 'youdao-dictionary-play-voice-at-point)
  )

(if IS-WINDOWS
    (use-package! edit-server
      :ensure t
      :config (edit-server-start))
  nil)

(use-package! neotree
  :defer t
  :init
  (setq inhibit-compacting-font-caches t)
  (setq neo-theme 'icons)
  )

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
                                            ("7b" "baidu")
                                            ("7c" "chenbin")

                                            ;; some symbols
                                            ("7fm" "♀")
                                            ("7m" "♂")
                                            ("7win" "Windows")

                                            ;; website
                                            ("7doom" "https://github.com/hlissner/doom-emacs")
                                            ("7space" "https://github.com/syl20bnr/spacemacs/")
                                            ("7ec" "https://emacs-china.org/")
                                            ("7pur" "https://github.com/purcell/emacs.d")

                                            ;; signature
                                            ("7pme" "pomelo")
                                            ("7zl" "zilongshanren")
                                            ;; emacs regex
                                            ("7d" "\\([0-9]+?\\)")
                                            ("7str" "\\([^\"]+?\\)\"")))


(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)

(add-hook 'find-file-hook 'pomelo/check-large-file)

(setq ispell-dictionary "american")
(add-hook! org-mode  #'flyspell-mode)
(setq doom-scratch-buffer-major-mode 'org-mode)

;; 当输入lambda的时候变成一个符号
(global-prettify-symbols-mode 1)

;; 设置延迟加载，并且如果想要开启两重行号显示则运行linum-mode或者global-linum-mode，只运行一个相对行号就运行linum-relative-mode
(use-package! linum-relative
  :defer t
  :init
  (setq linum-relative-backend 'display-line-numbers-mode)
  (global-set-key (kbd "<f8>") 'linum-relative-toggle)
  (global-set-key (kbd "<f7>") 'linum-mode)
  )

;; 读取测试的简单配置
;; (load! "+test")
(setq recentf-exclude
      '("COMMIT_MSG"
        "COMMIT_EDITMSG"
        "github.*txt$"
        "/tmp/"
        "/ssh:"
        "/sudo:"
         "/TAGS$"
        "/GTAGS$"
        "/GRAGS$"
        "/GPATH$"
        "\\.mkv$"
        "\\.mp[34]$"
        "\\.avi$"
        "\\.pdf$"
        "\\.sub$"
        "\\.srt$"
        "\\.ass$"
        ".*png$"
        ".*bmp$"
        ".*db$"
        "init\\.el$"
        "/agenda/"
        "/autosave"
        "\\.doom\\.d/"))

(use-package! bongo
  :defer t)

(use-package! ace-pinyin
  ;; :hook
  :defer 5
  ;; (prog-mode . ace-pinyin-mode)
  :init (ace-pinyin-global-mode +1)
  :config
  (bind-key* "C-c /" #'ace-pinyin-jump-char-2)
  )

(setq-default abbrev-mode t)

;; If it is a better package then to learn how to use it or delete it
