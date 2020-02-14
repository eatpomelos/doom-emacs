;;; ~/.doom.d/ui.el -*- lexical-binding: t; -*-

(setq display-time-day-and-date t)

(display-time-mode)

(setq frame-title-format
      '("" invocation-name " pomelo - " (:eval (if (buffer-file-name)
                                                   (abbreviate-file-name (buffer-file-name))
                                                 ("%b")))))
