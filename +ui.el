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
   (define-leader-key! "1" 'winum-select-window-1)
   (define-leader-key! "2" 'winum-select-window-2)
   (define-leader-key! "3" 'winum-select-window-3)
   (define-leader-key! "4" 'winum-select-window-4)
   (define-leader-key! "5" 'winum-select-window-5)
   (define-leader-key! "6" 'winum-select-window-6)
   )
