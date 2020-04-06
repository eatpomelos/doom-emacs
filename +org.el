;;; ~/.doom.d/org.el -*- lexical-binding: t; -*-

;; 设置.txt为后缀的文件用org-mode打开
;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; 设置一下自己的任务管理的一些简单的配置,要是想放弃一个任务的时候，要进行说明，以后可能会再次启用这个任务
;; (setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "PAUSE(p@)" "|" "DONE(d)" "ABORT(a@/!)")))
;; (setq org-todo-keyword-faces '(("TODO" . "red")
;;                                ("DOING" . "yellow")
;;                                ("DONE" . "green")
;;                                ("ABORT" . "blue")
;;                                ("PAUSE" . "cyan1")))

;; 定义一个函数,在需要编写英语单词的时候,打开本地的文件用来进行单词的补全
;;;###autoload
(defun pomelo|load-localdictionary ()
  "Load local dictionary to complement."
  (interactive)
  (let ((pomelo-local-dictionary "~/pomelo/english/english-words.txt"))
    (find-file-read-only pomelo-local-dictionary)
    (evil-switch-to-windows-last-buffer)))

(global-set-key (kbd "C-c d") 'pomelo|load-localdictionary)

;; (use-package! org-pomodoro
;;   :if (with-eval-after-load 'org-agenda)
;;   :config
;;   (define-key org-agenda-mode-map (kbd "C-p") 'org-pomodoro))
