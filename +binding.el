;;; ~/.doom.d/binding.el -*- lexical-binding: t; -*-

(map! (:map override
       "C-k" 'kill-line
       "C-c k" 'which-key-show-top-level
       "C-s" 'swiper
       "C-l" 'recenter-top-bottom
       "C-;" 'iedit-mode
       "<f9>" 'loop-alpha
       "<f12>" 'shell
       "<f2>" 'org-agenda
       "<f6>" 'abbrev-mode
       "<f5>" 'revert-buffer-with-coding-system
       )

      (:map prog-mode-map
       :g "C-c sa" #'hs-show-all
       :g "C-c ha" #'hs-hide-all
       :g "C-c sb" #'hs-show-block
       :g "C-c hb" #'hs-hide-block
       :i "C-c ," #'company-yasnippet
       :i "C-r" #'delete-backward-char)

      (:leader
       "0" 'winum-select-window-0-or-10
       "1" 'winum-select-window-1
       "2" 'winum-select-window-2
       "3" 'winum-select-window-3
       "4" 'winum-select-window-4
       "5" 'winum-select-window-5
       "6" 'winum-select-window-6)
      (:map c-mode-map
       "DEL" 'c-hungry-delete)

      ;; 直接更改org-mode-map和override 是不能直接改快捷键的，有可能是keymap的优先级的原因
      (:map evil-org-mode-map
       :i "C-a" #'org-beginning-of-line
       :i "C-e" #'org-end-of-line
       :i "C-k" #'kill-line
       :i "C-l" #'recenter-top-bottom)
      )

(global-set-key (kbd "C-c C-/") #'pop-global-mark)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "<f3>") 'pomelo-toggle-theme)

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

(map! :leader
      "wd" 'delete-window
      "w/" 'split-window-right
      "w-" 'split-window-below
      "bw" 'read-only-mode
      "ft" 'neotree-toggle
      "ld" 'pomelo-kill-paragraphs
      :nmv "SPC" #'counsel-M-x
      (:prefix ("f" . "file")
       "j" #'dired-jump)
      (:prefix "b"
       "s" #'doom/switch-to-scratch-buffer)
      ;; ebooks and notes
      (:prefix ("e" . "ebook/notes")
       "c" #'calibredb
       "d" #'deft)
      )
