# emacs-config
The below is my emacs configuration that I mainly use for my productivity workflows using `org-mode`. 

## Display Customizations
I use [monokai-emacs](https://github.com/oneKelvinSmith/monokai-emacs) theme with some customization for the org-headings font size, line highlighting, numbering, line-wrapping, and [org-bullets](https://github.com/sabof/org-bullets) – you'll find the configuration snippets higlighted with comments. Also, I have custom faces for striking out the completed tasks in the org file

## GPG Encryption
To have the flexibility to sync my org files on any medium, I encrypt the headings that I need using the GPG package. The highlighted configurations enables emacs interaction with the installed GPG suite on your machine – I use the [GPG Tools](https://gpgtools.org/) for Mac. Also, remember to disable the auto-save to avoid unencrypted text leaking on the disk. 

## Custom TODO States
I am using GTD method to capture, track, and organize my tasks. I created multiple states to track my current active task, blocked/waiting, and cancelled ones. 
```elisp
;; Enable custom states for TODO
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(s)" "|" "DONE(d)")
        (sequence "BLOCKED(b)" "|" "FIXED(f)")
        (sequence "|" "CANCELED(c)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("PROGRESS" . (:foreground "black" :background "DarkOrange"))
        ("BLOCKED" . (:foreground "white" :background "red" :weight bold))))
```

## Capture Templates
I am using `org-capture` to capture and create the following artifacts, for all of them, I am using metadata properties to facilitate the cross-referencing and linking.

- **Project**: This is the high-level construct for grouping tasks, meetings, and resources
- **Task**: This is a TODO with time-based properties, and it falls under a project
- **Meeting Minutes**: This represents the minutes of a meeting. This could be tracked as datetree in the main org file, but it does not make it easy to move the meeting minutes headers from one file to another.
- **Recurring Meeting Minutes**: This is a meeting minutes for a series of meeting, I have created a separate template for this to put it under a dedicated org header representing the meeting series.

## Workflow
The projects are captured directly into my main org file (i.e. GTD Next Actions). The tasks and meetings are captured in thee landing file which makes it easy to capture without worrying about where to place it under the main org file structure. I then use org-mode refile to move the header between files/structures (using `C-c C-w` keybinding), and I am using the below configuration to enable helm completing the destination of the refile. 
```elisp
;; Setup org agenda files
(setq org-agenda-files
      '("~/org/next.org" "~/org/landing.org" "~/org/schedule.org"))
(setq org-refile-targets
      '((nil :maxlevel . 9)
        (org-agenda-files :maxlevel . 9)))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-reverse-note-order t)
```

`org-agenda` is an essential part of my everyday planning, and I am also using [org-gcal](https://github.com/myuhe/org-gcal.el) to sync my work calendar within the agenda view

## Hydra 
[Hydra](https://github.com/abo-abo/hydra) is very handy tool for creating keybindings, I have created the following keybindings for window management as well as the essential tasks I need
```elisp
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
```


