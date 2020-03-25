;;; ~/.doom.d/binding.el -*- lexical-binding: t; -*-

(bind-key* "<f9>" 'loop-alpha)
(bind-key* "<f6>" 'abbrev-mode)
(bind-key* "<f12>" 'shell)
(bind-key* "C-;" 'iedit-mode)
(bind-key* "C-s" 'swiper)
(bind-key* "C-c k" 'which-key-show-top-level)

;; 代码折叠的快捷键
;; (define-key prog-mode-map (kbd "C-c sa") 'hs-show-all)
;; (define-key prog-mode-map (kbd "C-c ha") 'hs-hide-all)
;; (define-key prog-mode-map (kbd "C-c sb") 'hs-show-block)
;; (define-key prog-mode-map (kbd "C-c hb") 'hs-hide-block)
(map! :map prog-mode-map
      :g "C-c sa" #'hs-show-all
      :g "C-c ha" #'hs-hide-all
      :g "C-c sb" #'hs-show-block
      :g "C-c hb" #'hs-hide-block
      ;; :g "M-s o" #'occur-dwim
      :i "C-c ," #'company-yasnippet
      :i "C-r" #'delete-backward-char
      ;; :i "C-y" #'yank
      ;; :i "C-d" #'delete-char
      ;; :g "C-;" #'iedit-mode
      )

(global-set-key (kbd "C-c C-/") #'pop-global-mark)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)

;; 编辑相关的快捷键
(global-set-key (kbd "C-c v") 'set-mark-command)
(global-set-key (kbd "C-c C-l") 'goto-line)
(global-set-key (kbd "M-=") 'count-words)

;; 编程相关的一些快捷键
;; (define-key prog-mode-map (kbd "C-c ,") 'company-yasnippet)
(define-key! emacs-lisp-mode-map "C-c eb" #'eval-buffer)
(define-key! evil-insert-state-map "C-y" #'yank)
(define-key! evil-insert-state-map "C-k" #'kill-line)
(define-key! evil-insert-state-map "C-x C-s" #'save-buffer)
(define-key! evil-insert-state-map "C-." #'tiny-expand)
(define-key! evil-insert-state-map "C-c o" #'occur-dwim)
(define-key! evil-insert-state-map "C-=" #'er/expand-region)
(define-key! evil-insert-state-map "C-\-" #'er/contract-region)
(define-key! evil-insert-state-map "C-d" #'delete-char)
(define-key! org-agenda-mode-map "C-," #'org-pomodoro)
(define-key! evil-insert-state-map "C-n" #'next-line)
(define-key! evil-insert-state-map "C-p" #'previous-line)

(define-leader-key! "bw" 'read-only-mode)
(define-leader-key! "w/" 'split-window-right)
(define-leader-key! "w-" 'split-window-below)
