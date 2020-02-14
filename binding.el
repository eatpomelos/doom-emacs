;;; ~/.doom.d/binding.el -*- lexical-binding: t; -*-

(global-set-key (kbd "M-s o") 'occur-dwim)

(bind-key* "<f9>" 'loop-alpha)
(bind-key* "C-k" 'evil-delete-line)
(bind-key* "C-=" 'er/expand-region)
(bind-key* "C-\-" 'er/contract-region)
(bind-key* "C-r" 'delete-backward-char)
(bind-key* "C-c k" 'which-key-show-top-level)
(bind-key* "C-s" 'swiper)
(bind-key* "C-x C-s" 'save-buffer)

;; 代码折叠的快捷键
(define-key prog-mode-map (kbd "C-c sa") 'hs-show-all)
(define-key prog-mode-map (kbd "C-c ha") 'hs-hide-all)
(define-key prog-mode-map (kbd "C-c sb") 'hs-show-block)
(define-key prog-mode-map (kbd "C-c hb") 'hs-hide-block)

;; 编辑相关的快捷键
(global-set-key (kbd "C-c v") 'set-mark-command)
(global-set-key (kbd "C-c C-l") 'goto-line)
(global-set-key (kbd "C-c -") 'text-scale-decrease)
(global-set-key (kbd "C-c +") 'text-scale-increase)
(global-set-key (kbd "M-=") 'count-words)

;; 编程相关的一些快捷键
(define-key prog-mode-map (kbd "C-c ,") 'company-yasnippet)
(define-key emacs-lisp-mode-map (kbd "C-c eb") 'eval-buffer)
