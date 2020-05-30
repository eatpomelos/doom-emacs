;;; ~/.doom.d/prog.el -*- lexical-binding: t; -*-

;; highlight c
(defun my-c-mode-font-lock-if0 (limit)
  (save-restriction
    (widen)
    (save-excursion
      (goto-char (point-min))
      (let ((depth 0) str start start-depth)
        (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
          (setq str (match-string 1))
          (if (string= str "if")
              (progn
                (setq depth (1+ depth))
                (when (and (null start) (looking-at "\\s-+0"))
                  (setq start (match-end 0)
                        start-depth depth)))
            (when (and start (= depth start-depth))
              (c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
              (setq start nil))
            (when (string= str "endif")
              (setq depth (1- depth)))))
        (when (and start (> depth 0))
          (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  nil)

(defun my-c-mode-common-hook-if0 ()
  (font-lock-add-keywords
   nil
   '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook-if0)
;; ;;highlight end

;; load kbd macro file
;; (load-file macro-file-path)

;; some hooks
(add-hook 'c-mode-hook 'electric-pair-mode t)
;; (add-hook 'emacs-lisp-mode-hook 'lispy-mode t)

;; 设置代码折叠
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'perl-mode-hook 'hs-minor-mode)
(add-hook 'sh-mode-hook 'hs-minor-mode)

;; 补充C/C++的补全选项
;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             ;; (setq company-backends '(company-yasnippet)
;;             ;; (setq company-backends '(lsp-ccls))
;;             (setq company-clang-arguments
;;                   '("-std=c++1z"))
;;             ))

(use-package! minimap
  :defer 3
  :config
  (define-key prog-mode-map (kbd "C-c mp") 'minimap-mode))

(use-package! vc-msg
  :defer 5
  :config
  (global-set-key (kbd "C-c mi") 'vc-msg-show)
  (define-leader-key! "dm" 'vc-msg-show))

;; 将注释替换成evil-nerd-commenter 的替换方式，下面是map!的用法

(use-package! evil-nerd-commenter
  :defer 5
  :config
  (map! :map prog-mode-map
        :g "M-;" 'evilnc-comment-or-uncomment-lines
        :leader
        :n "lp" 'evilnc-comment-or-uncomment-paragraphs
        :v "ll" 'comment-or-uncomment-region)
  )

;; 在解释elisp函数的时候在下面显示一个示例
(use-package! elisp-demos
  :defer t
  :init
  (advice-add 'describe-function-1 :after #'elisp-demos-advice-describe-function-1)
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

;; (add-hook! (java-mode js2-mode) #'lsp)
;; (add-hook! prog-mode #'lsp)

(setq pomelo-enable-lsp-alist '(java-mode
                                c-mode
                                android-mode
                                c++-mode))

(add-hook! pomelo-enable-lsp-alist #'lsp)

(setq lsp-keymap-prefix "C-'")

(with-eval-after-load 'lsp-mode
  (add-hook! lsp-mode #'lsp-enable-which-key-integration)
  (setq flycheck-check-syntax-automatically '(mode-enabled))
  (setq android-mode-sdk-dir "/mnt/d/ly/AppData/Sdk/")
  (setq android-mode-avd "MY_AVD")
  )

;; (add-hook 'prog-mode-hook '(lambda () (setq company-backends
;;                                  '((company-lsp :with company-yasnippet) company-keywords company-files company-capf
;;                                   (company-dabbrev-code company-etags company-gtags)))))
