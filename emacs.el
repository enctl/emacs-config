(package-initialize)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#1e1e1e" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "3577ee091e1d318c49889574a31175970472f6f182a9789f1a3e9e4513641d86" "a83f05e5e2f2538376ea2bfdf9e3cd8b7f7593b16299238c1134c1529503fa88" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" default)))
 '(epg-gpg-program "/usr/local/bin/gpg2")
 '(fci-rule-color "#37474F")
 '(fill-column 120)
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(ibuffer-deletion-face (quote dired-flagged))
 '(ibuffer-marked-face (quote dired-marked))
 '(jdee-db-active-breakpoint-face-colors (cons "#171F24" "#237AD3"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#171F24" "#579C4C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#171F24" "#777778"))
 '(magit-diff-use-overlays nil)
 '(objed-cursor-color "#D16969")
 '(org-agenda-restore-windows-after-quit t)
 '(package-selected-packages
   (quote
    (monokai-theme all-the-icons-dired all-the-icons-gnus all-the-icons-ibuffer cmake-mode org-mime mu4e-alert mu4e-conversation mu4e-jump-to-list mu4e-maildirs-extension mu4e-overview org-gcal calfw calfw-org transpose-frame hydra ace-window winum org-link-minor-mode org-bullets helm)))
 '(pdf-view-midnight-colors (cons "#d4d4d4" "#1e1e1e"))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(rustic-ansi-faces
   ["#1e1e1e" "#D16969" "#579C4C" "#D7BA7D" "#339CDB" "#C586C0" "#85DDFF" "#d4d4d4"])
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#1e1e1e")
 '(vc-annotate-color-map
   (list
    (cons 20 "#579C4C")
    (cons 40 "#81a65c")
    (cons 60 "#acb06c")
    (cons 80 "#D7BA7D")
    (cons 100 "#d8ab79")
    (cons 120 "#d99c76")
    (cons 140 "#DB8E73")
    (cons 160 "#d38b8c")
    (cons 180 "#cc88a6")
    (cons 200 "#C586C0")
    (cons 220 "#c97ca3")
    (cons 240 "#cd7286")
    (cons 260 "#D16969")
    (cons 280 "#ba6c6c")
    (cons 300 "#a37070")
    (cons 320 "#8d7374")
    (cons 340 "#37474F")
    (cons 360 "#37474F")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "SF Mono"))))
 '(mu4e-replied-face ((t :inherit mu4e-rw-default :foreground "Green")))
 '(mu4e-unread-face ((t :inherit mu4e-rw-default :foreground "DarkOrange"))))

;; Load monokai theme
(setq monokai-height-minus-1 0.8
      monokai-height-plus-1 1.0
      monokai-height-plus-2 1.0
      monokai-height-plus-3 1.0
      monokai-height-plus-4 1.0)
(load-theme 'monokai t)
;; Prefer newer packages
(setq load-prefer-newer t)
;; Enable encryption capabilities and disabling backup files
(require 'org-crypt)
(require 'epa-file)
(epa-file-enable)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
(setq org-crypt-key nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq epa-pinentry-mode 'loopback)

(setq linum-format "%d ")
(global-display-line-numbers-mode)
;; Setup spell checking capabilities
(setq ispell-program-name "aspell")
;; highlight line with the cursor, preserving the colours.
(require 'hl-line)
(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :foreground nil :underline nil)
;; Setup text wrapping and automatic filling mode
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 120)
;; Enabling TODO process and org-bullet
(setq org-log-done 'time)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; Enable clock-in history
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; Enable auto-strikethrough for done tasks
(defun my/modify-org-done-face ()
  (setq org-fontify-done-headline t)
  (set-face-attribute 'org-done nil
		      :strike-through t
		      :foreground "grey")
  (set-face-attribute 'org-headline-done nil
                      :strike-through t
                      :foreground "gray"))
(eval-after-load "org"
  (add-hook 'org-add-hook 'my/modify-org-done-face))
;; Enable iTerm2 mouse and clipboard integration
(unless window-system
   (require 'mouse)
   (xterm-mouse-mode t)
   (defun track-mouse (e))
   (setq mouse-sel-mode t)
   )
;; Enable MacOS clipboard integration
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
;; Prevent splash screen
(setq inhibit-splash-screen t)
;; Enable custom states for TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(s)" "|" "DONE(d)")
        (sequence "BLOCKED(b)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("PROGRESS" . (:foreground "black" :background "DarkOrange"))
        ("BLOCKED" . (:foreground "white" :background "red" :weight bold))))
;; Hydra configuration for window management
(defhydra hydra-frame-window (:color red)
  "
^Move^                  ^Window^                        ^Buffer^  
_h_: move-left          _v_: split-window-right         _b_: switch-buffer
_j_: move-down          _x_: split-window-below         _f_: find-files
_k_: move-up            _t_: transpose-window           _p_: decrypt-entry
_l_: move-right         _o_: delete-other-windows       _g_: org-mode-compose
_d_: delete-window      _s_: swap-window                _r_: htmlize-message
"

  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("t" transpose-frame)
  ("o" delete-other-windows :color blue)
  ("d" ace-delete-window)
  ("s" ace-swap-window)
  ("b" ido-switch-buffer)
  ("f" helm-find-files) 
  ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
       )
   ("x" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down)))
   ("p" org-decrypt-entry)
   ("r" org-mime-htmlize)
   ("g" org-mu4e-compose-org-mode)
   ("q" nil "cancel"))
(global-set-key (kbd "M-o") 'hydra-frame-window/body)

;; Setting up Google Calendar
(require 'org-gcal)
(setq org-gcal-client-id "[PLACEHOLDER-FOR-CLIENT-ID]"
      org-gcal-client-secret "[PLACEHOLDER-FOR-SECRET]"
      org-gcal-file-alist '(("[EMAIL-ADDRESS]" .  "~/org/schedule.org")))
;; Setting the dired configurations
(setq find-file-visit-truename t)
;; Setup org agenda files
(setq org-agenda-files
      '("~/org/next.org" "~/org/landing.org" "~/org/schedule.org"))
(setq org-refile-targets
      '((nil :maxlevel . 9)
        (org-agenda-files :maxlevel . 9)))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-reverse-note-order t)
;; Setup some capture templates
(setq org-capture-templates
      '(("p" "Project" entry (file+headline "~/org/next.org" "Projects")
	 (file"~/org/templates/project.org") :empty-lines 1)
	 ("t" "Task" entry (file+headline "~/org/landing.org" "Refile Actions")
	  (file"~/org/templates/task.org"))
	 ("m" "Meeting Minutes" entry (file+headline "~/org/landing.org" "Refile Meetings")
	  (file"~/org/templates/meeting.org") :empty-lines 1 :prepend t)
	 ("r" "Recurring Meeting Minutes" entry (file+headline "~/org/landing.org" "Refile Meetings")
	  (file"~/org/templates/rmeeting.org") :empty-lines 1 :prepend t)))
