;;; ~/.doom.d/ui.el -*- lexical-binding: t; -*-

(setq display-time-day-and-date t)

(display-time-mode)

(setq frame-title-format
      '("" invocation-name " pomelo - " (:eval (if (buffer-file-name)
                                                   (abbreviate-file-name (buffer-file-name))
                                                 ("%b")))))

 (use-package! winum
   :init
   :config
   (winum-mode)
   (map! :leader
         "0" 'winum-select-window-0-or-10
         "1" 'winum-select-window-1
         "2" 'winum-select-window-2
         "3" 'winum-select-window-3
         "4" 'winum-select-window-4
         "5" 'winum-select-window-5
         "6" 'winum-select-window-6
         )
   )

(pushnew! initial-frame-alist '(width . 200) '(height . 55))
(add-hook 'window-setup-hook #'toggle-frame-maximized)
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; 先装在这里，如果比较耗资源就删除
(use-package! nyan-mode
  :init
  (nyan-mode t))

(when IS-WINDOWS
  (define-leader-key! "sp" 'counsel-ag)
  (setq locale-coding-system 'gbk)
  (set-default 'process-coding-system-alist
               '(("[pP][lL][iI][nN][kK]" gbk-dos . gbk-dos)
                 ("[cC][mM][dD][pP][rR][oO][xX][yY]" gbk-dos . gbk-dos)
                 ("[rR][gG]" utf-8-dos . gbk-dos))))
