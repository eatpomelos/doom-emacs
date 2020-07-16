;;; ~/.doom.d/misc.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "eatpomelos"
      user-mail-address "2845748931@qq.com")

(setq company-idle-delay 0.1)
(setq default-directory "~")
;; (setq default-directory "D:/pomelo")

(use-package! youdao-dictionary
  :defer t
  :init
  (map!
   (:leader
    (:prefix ("y" . "youdao")
     "o" #'youdao-dictionary-search-at-point+
     "s" #'youdao-dictionary-search-and-replace
     "p" #'youdao-dictionary-play-voice-at-point
     "i" #'youdao-dictionary-search-from-input
     )
    )
   (:map override
    "<f4>" #'youdao-dictionary-search-at-point+)))

;; 当当前的系统是windows的时候需要设置edit-server，但是其实这个功能没有必要加进自己的配置中，平时很少用到
(if IS-WINDOWS
    (use-package! edit-server
      :ensure t
      :config (edit-server-start))
  nil)

;; (use-package! neotree
;;   :defer t
;;   :init
;;   (setq inhibit-compacting-font-caches t)
;;   (setq neo-theme 'icons)
;;   )

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

;; 这里一行是为了增加大文件打开的速度来提升性能，但是由于打开ｐｄｆ的时候不需要启用其他ｍｏｄｅ，这里进行更改
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
        "\\.doom\\.d/"
        ))

;; (use-package! bongo
;;   :defer t)

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

;; snails config
;; (def-package! snails
  ;; :after)
;; (def-package! snails
  ;; :after (doom-themes)
  ;; :load-path "~/.doom.d/local/elpa/snails/"
  ;; :config
  ;; (require 'snails)
  ;; (defun snails3()
  ;;   (interactive)
  ;;   (snails '(snails-backend-awesome-tab-group
  ;; 	          snails-backend-buffer
  ;; 	          snails-backend-recentf)))
  ;; (add-hook 'snails-mode-hook (lambda () (evil-emacs-state)))
  ;; (global-set-key (kbd "C-S-p") 'snails3)
  ;; )
;; (add-to-list 'load-path "~/.doom.d/local/elpa/snails")
;; (require 'snails)

;; auto-mode-alist
;; (pdf-loader-install)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))

(use-package! calibredb
  :defer 2
  :init
  (setq sql-sqlite-program "/usr/bin/sqlite3")
  (setq calibredb-root-dir "~/Calibre-Book")
  (setq calibredb-db-dir (expand-file-name "metadata.bd" calibredb-root-dir))
  (setq calibredb-program "/usr/bin/calibredb")
  (setq calibredb-library-alist '(("~/EBOOK")
                                  ("~/EBOOK/哲学")
                                  ("~/EBOOK/算法")
                                  ("~/EBOOK/入门类")
                                  ("~/EBOOK/books")
                                  ("~/EBOOK/其他电子书")
                                  ("~/EBOOK/编程工具书类")
                                  ("~/EBOOK/C语言相关书籍")
                                  ("~/EBOOK/emacs相关")
                                  ))
  (defadvice calibredb (after pomelo-calibrebd-hack activate)
    (evil-emacs-state))
  )

(use-package! rainbow-fart
  :load-path "~/.doom.d/local/packages/rainbow-fart.el"
  :defer 3
  :config
  (global-set-key (kbd "C-c mr") 'rainbow-fart-mode)
  (rainbow-fart-mode 1)
  )


;; (setq calendar-chinese-all-holidays-flag t)
;; emacs 应用框架 在linux下能够在emacs中运行所有的程序，暂时试用了一下，没有必要，不安装这个也行
(use-package! eaf
  :load-path "~/.doom.d/local/packages/emacs-application-framework"
  :defer 2
  :custom
  (eaf-find-alternate-file-in-dired t)
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))

(use-package! smart-input-source
  :init
  ;; set the english input source
  ;;(setq-default smart-input-source-english "com.apple.keylayout.ABC")
  (require 'subr-x)
  (setq-default smart-input-source-english "1")
  ;; set the default other language input source for all buffer
  (setq-default smart-input-source-other "2")
  (setq-default smart-input-source-do-get
                (lambda () (string-trim (shell-command-to-string "fcitx-remote"))))
  (setq-default smart-input-source-do-set
                (lambda (source)
                  (pcase source
                    ("1" (start-process "set-input-source" nil "fcitx-remote" "-c"))
                    ("2" (start-process "set-input-source" nil "fcitx-remote" "-o")))))

  :hook
  ;; enable the /follow context/ and /inline region/ mode for specific buffers
  (((text-mode prog-mode) . smart-input-source-follow-context-mode)
   ((text-mode prog-mode) . smart-input-source-inline-mode))

  :config
  ;; enable the /cursor color/ mode
  (smart-input-source-global-cursor-color-mode t)
  ;; enable the /respect/ mode
  (smart-input-source-global-respect-mode t)
  ;; enable the /follow context/ mode for all buffers
  (smart-input-source-global-follow-context-mode t)
  ;; enable the /inline english/ mode for all buffers
  (smart-input-source-global-inline-mode t))
