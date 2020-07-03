;;; ~/.doom.d/funcs.el -*- lexical-binding: t; -*-
;;set transparent effect
;;-
;; (setq alpha-list '((100 100) (75 45) (45 15)))
(setq alpha-list '((100 100) (75 45)))
(defun loop-alpha ()
  (interactive)
  (let ((h (car alpha-list))) ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))
    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )
;; 当打开一个大的文件的时候使用另外的模式提升性能,但是使用ｅｍａｃｓ来阅读ｐｄｆ的时候不需要打开使用此配置，之后如果有其他的需求的话可以考虑建立一个表
(defun pomelo/check-large-file ()
  (when (> (buffer-size) 500000)
    (if (string-match ".+\\.pdf" (buffer-name))
      nil
      (progn (fundamental-mode)
             (hl-line-mode -1)))))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	          (buffer-substring-no-properties
	           (region-beginning)
	           (region-end))
	        (let ((sym (thing-at-point 'symbol)))
	          (when (stringp sym)
              (regexp-quote sym))))
	      regexp-history)
  (call-interactively 'occur))

;; 当用swiper查找某一个单词之后，自动将这一行放到屏幕中间
(defadvice swiper (after pomelo-swiper-hack activate)
  (recenter-top-bottom))

(defadvice counsel-ag (after pomelo-ag-hack activate)
  (recenter-top-bottom))

(defadvice goto-line (after pomelo-goto-line-hack activate)
  (recenter-top-bottom))

(defadvice +default/search-project (after pomelo-helm-project-search-hack activate)
  (recenter-top-bottom))

;; 当关闭一个buffer的时候，如果当前的window 数大于1则删除这个window
(defadvice kill-current-buffer (after pomelo-kill-buffer-hack activate)
  (if (> (count-windows) 1)
      (+workspace/close-window-or-workspace)))

;; 定义一个自己函数用来建立snippet,这个函数是参考的源文件中的函数，中间有很多东西还不是很清楚
(defun pomelo/yas-new-snippet (&optional no-template)
  "Pops a new buffer for writing a snippet.

Expands a snippet-writing snippet, unless the optional prefix arg
NO-TEMPLATE is non-nil."
  (interactive "P")
  (let ((snippet-directories yas--default-user-snippets-dir)
        (yas-selected-text (or yas-selected-text
                               (and (region-active-p)
                                    (buffer-substring-no-properties
                                     (region-beginning) (region-end))))))

    (switch-to-buffer yas-new-snippet-buffer-name)
    (erase-buffer)
    (kill-all-local-variables)
    (snippet-mode)
    (yas-minor-mode 1)
    (set (make-local-variable 'yas--guessed-modes)
         'emacs-lisp-mode)
    (set (make-local-variable 'default-directory)
         snippet-directories)
    (if (and (not no-template) yas-new-snippet-default)
        (yas-expand-snippet yas-new-snippet-default))))

(defun pomelo/indent-buffer ()
  "Indent buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max)))
  )

;; when tiny expand finished indent this buffer
(defadvice tiny-expand (after pomelo-tiny-expand-hack activate)
  (pomelo/indent-buffer)
  )

;; ;; 让company-yasnippet只在.之前工作
;; (defun company-yasnippet/disable-after-dot (fun command &optional arg &rest _ignore)
;;   (if (eq command 'prefix)
;;       (let ((prefix (funcall fun 'prefix)))
;;         (when (and prefix (not
;;                            (eq
;;                             (char-before (- (point) (length prefix)))
;;                             ?.)))
;;           prefix))
;;     (funcall fun command arg)))
;; (advice-add #'company-yasnippet :around #'company-yasnippet/disable-after-dot)

(defadvice org-agenda (after pomelo-agenda-view-hack activate)
  (org-agenda-day-view))

(defadvice evilnc-comment-or-uncomment-lines (after pomelo-next-line-hack activate)
  (evil-next-line))

;; toggle my favorite theme
(defun pomelo-toggle-theme ()
  "Toggle theme in."
  (interactive)
  (let ((now-theme doom-theme)
        (toggle-theme))
    (setq toggle-theme (cond ((equal now-theme 'doom-dracula) 'doom-nord-light)
                             ((equal now-theme 'doom-nord-light) 'doom-dracula)
                             (t 'doom-dracula))
          )
    (load-theme toggle-theme)
    )
  )

;; 删除一个完整的段落
(defun evilnc--get-one-paragraph-region ()
  "Select a paragraph which has NO empty line."
  (let* ((b (save-excursion
              (cond
               ((re-search-backward "^[\n\t]*$" nil t)
                (forward-line)
                (line-beginning-position))
               (t
                1))))
         (e (save-excursion
              (cond
               ((re-search-forward "^[\n\t]*$" nil t)
                (forward-line -1)
                (line-end-position))
               (t
                (point-max))))))
    (list b e)))

(defun pomelo-kill-paragraphs ()
  "kill a paragaphs."
  (interactive)
  (let ((b (point-max))
        rlt
        (e (point-min)))
    (setq rlt (evilnc--get-one-paragraph-region))
    (setq b (nth 0 rlt))
    (setq e (nth 1 rlt))
    (kill-region b e))
  (while (pomelo--empty-line-p)
    (kill-line))
  )

(defun pomelo--empty-line-p ()
  "Test whether the point is on an \"empty\" line."
  (if (and (looking-back "^[[:space:]]*" (line-beginning-position))
           (looking-at "[[:space:]]*$"))
      t
    nil))
