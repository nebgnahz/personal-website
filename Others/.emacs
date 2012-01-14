(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(initial-buffer-choice "C:\\Users\\v-benzh\\Desktop"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t nil (pc-select))
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil nil (tooltip))
 '(widget-menu-max-size 0))


; '(tool-bar-mode nil nil (tool-bar))
; '(tooltip-mode nil nil (tooltip))

;(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
; )

(setq ispell-program-name "/sw/bin/ispell")
(put 'upcase-region 'disabled nil)
(global-font-lock-mode 1)

(make-face 'paren-match-face)
(setq auto-save-default nil)
(setq show-paren-face 'paren-match-face)
(setq auto-mode-alist
      (cons '("\\.nc$" . c-mode) (cons '("\\.dot$" . graphviz-dot-mode) (cons '("\\.h$" . c++-mode) (cons '("\\.py$" . python-mode) auto-mode-alist)))))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
; (setq load-path (cons "C:\Program Files\emacs-20.7\lisp" load-path))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'graphviz-dot-mode "graphviz-dot-mode" "Dot editing mode." t)
(defun mouse-wheel-backward nil (interactive) (scroll-down 10))
(defun mouse-wheel-forward nil (interactive) (scroll-up 10))

(global-set-key [(mouse-4)] 'mouse-wheel-backward)
(global-set-key [(mouse-5)] 'mouse-wheel-forward)
; (setq inferior-lisp-program "/users/daniel/Applications/acl62_trial/alisp")
(global-set-key "\C-x\C-l" 'run-lisp)
(global-set-key "\C-xd" 'lisp-eval-defun)
(global-set-key "\C-x\C-d" 'lisp-eval-defun-and-go)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-x\C-a" 'compile)
;(font-lock-mode)


(setq c-indent-level 4)
(setq c-basic-offset c-indent-level)


(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 0)
    )
  "My C Programming Style")
(setq tab-width c-indent-level)
(defun my-c-mode-common-hook ()
  (c-add-style "PERSONAL" my-c-style t)
  (c-set-offset 'member-init-intro '++)
  ;; other customizations
  (setq tab-width c-indent-level
        indent-tabs-mode 1)
  ;; we like auto-newline and hungry-delete
  ;(c-toggle-auto-hungry-state 1)
  ;; keybindings for all supported languages.  We can put these in
  ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
  ;; java-mode-map, and idl-mode-map inherit from it.
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq fundamental-mode-hook
      '(lambda () (progn
		    (setq tab-width 4
				  indent-tabs-mode t))))

(setq python-mode-hook
      '(lambda () (progn
		    (set-variable 'py-indent-offset 4)
		    (set-variable 'py-smart-indentation nil)
		    (set-variable 'indent-tabs-mode t) 
		    (setq tab-width 4
				  indent-tabs-mode t))))


(global-set-key "\C-c e" 'My-Compile)
(defun My-Compile()
 "Save all unsaved buffers, and runs 'compile'."
 (interactive)
 (save-some-buffers t)
 (compile compile-command))

; (load "/usr/local/acl70_trial/eli/fi-site-init")

(defun katester()
  "Sets the color scheme to katester"
  (interactive "")
  (setq default-frame-alist      
        '((foreground-color . "black")    
          (background-color . "ivory")
          ))
  (set-cursor-color "slateblue")
  (set-mouse-color "slateblue")
  (set-face-foreground 'modeline "black")
  (set-face-background 'modeline "mistyRose")
  (set-face-background 'region "lavender")
  (set-face-background 'highlight "mistyRose")
  (custom-set-faces
   '(default ((t (:foreground "#000000" :background "ivory"))))
   '(cursor    ((t (:background "slateblue" :foreground "black"))))
   '(highlight ((t (:background "mistyRose" :foreground "black"))))
   '(region    ((t (:background "lavender"     :foreground "black"))))
   '(modeline ((t (:foreground "navy" 
                               :background "mistyRose" 
                               :box (:line-width 1 
                                                 :color "grey75" 
                                                 :style released-button)))))
   '(font-lock-builtin-face ((t (:foreground "blue"))))
   '(margin-face ((t (:background "lightgray"))))
   '(font-lock-comment-face ((t (:foreground "navy"))))
   '(font-lock-constant-face ((t (:foreground "darkred"))))
   '(font-lock-function-name-face ((t (:underline t :bold t :foreground "blue" ))))
   '(font-lock-keyword-face ((t (:foreground "blue"))))
   '(font-lock-string-face ((t (:foreground "thistle4"))))
   '(font-lock-type-face ((t (:foreground "blue"))))
   '(font-lock-variable-name-face ((t (:foreground "black"))))
   )
  )
;
; yet another color theme - 
; 
(defun matrix()
  "Sets the color scheme to matrix"
  (interactive "")
  (setq default-frame-alist      
        '((foreground-color . "darkseagreen")    
          (background-color . "black")
          ))
  (set-cursor-color "#7eff00")
  (set-mouse-color "#7eff00")
  (set-face-foreground 'modeline "#101010")
  (set-face-background 'modeline "seagreen")   
  (set-face-background 'region "#7eff00")
  (set-face-background 'highlight "#7eff00")
  (custom-set-faces
   '(default   ((t (:background "black" :foreground "darkseagreen" ))))
   '(cursor    ((t (:background "yellow" :foreground "green1"))))
   '(highlight ((t (:background "yellow" :foreground "black"))))
   '(region    ((t (:background "yellow"     :foreground "black")))) 
   '(modeline ((t (:background "palegreen4" :foreground "yellow"  :weight bold))))
   '(font-lock-builtin-face ((t (:foreground "darkseagreen"))))
   '(font-lock-comment-face ((t (:italic t foreground: "" ))))
   '(font-lock-constant-face ((t (:bold t :foreground "palegreen"))))
   '(font-lock-function-name-face ((t (:bold t ))))
   '(font-lock-keyword-face ((t (:bold t :foreground "green"))))
   '(margin-face ((t (:inverse-video t))))
   '(font-lock-string-face ((t (:foreground "mediumseagreen"))))
   '(font-lock-type-face ((t (:bold t :foreground "limegreen"))))
   '(font-lock-variable-name-face ((t (:foreground "lightgreen"))))
   )
  )
;
; yet another color theme
; This one looks good with the bitstream vera fonts from GNOME
;
(defun basic()
  "A simple color scheme"
  (interactive "")
  (setq default-frame-alist      
        '((foreground-color . "white")    
          (background-color . "#303030")
          ))
  (set-cursor-color "midnightblue")
  (set-mouse-color "midnightblue")
  (custom-set-faces
   '(default   ((t (:background "#303030" :foreground "white" ))))
   '(cursor    ((t (:background "white"   :foreground "#303030" ))))
   '(highlight ((t (:background "yellow"  :foreground "black"))))
   '(region    ((t (:background "brown"   :foreground "white"))))
   '(font-lock-comment-face ((t (:italic t :foreground "lavender"))))
   '(font-lock-function-name-face ((t (:bold t :foreground "cyan"))))
   '(font-lock-builtin-face ((t (:bold t :foreground "aquamarine"))))
   '(font-lock-string-face ((t (:foreground "lemonchiffon"))))
   '(font-lock-constant-face ((t (:bold t :foreground "lavender"))))
   '(font-lock-keyword-face ((t (:bold t :foreground "aliceblue"))))
   '(font-lock-type-face ((t (:bold t :foreground "palegreen"))))
   '(font-lock-variable-name-face ((t (:foreground "yellow"))))
   '(margin-face ((t (:inverse-video t ))))
   '(cperl-array-face ((t (:foreground "yellow"))))
   '(cperl-hash-face ((t (:foreground "wheat"))))
   '(modeline ((t (:background "#606060" :foreground "white" :overline t :underline t)))) 
   )
  )

(defun original() 
  (set-background-color "gray9")
					;(set-foreground-color "turquoise")
  (set-foreground-color "wheat")
  (set-cursor-color "honeydew2")
  (set-face-background 'region "MistyRose4")
  (set-face-foreground 'region "white")
  (set-face-foreground 'paren-match-face "light gray")
  (set-face-background 'paren-match-face "Black")
  (custom-set-faces
;   '(default   ((t (:background "#303030" :foreground "white" ))))
;   '(cursor    ((t (:background "white"   :foreground "#303030" ))))
;   '(highlight ((t (:background "yellow"  :foreground "black"))))
;   '(region    ((t (:background "brown"   :foreground "white"))))
   '(font-lock-comment-face ((t (:italic t :foreground "DarkSeaGreen3"))))
;   '(font-lock-function-name-face ((t (:bold t :foreground "cyan"))))
;   '(font-lock-builtin-face ((t (:bold t :foreground "aquamarine"))))
;   '(font-lock-string-face ((t (:foreground "lemonchiffon"))))
;   '(font-lock-constant-face ((t (:bold t :foreground "lavender"))))
;   '(font-lock-keyword-face ((t (:bold t :foreground "aliceblue"))))
;   '(font-lock-type-face ((t (:bold t :foreground "palegreen"))))
;   '(font-lock-variable-name-face ((t (:foreground "yellow"))))
;   '(margin-face ((t (:inverse-video t ))))
;   '(cperl-array-face ((t (:foreground "yellow"))))
;   '(cperl-hash-face ((t (:foreground "wheat"))))
;   '(modeline ((t (:background "#606060" :foreground "white" :overline t :underline t)))) 
   '(modeline ((t (:background "#303030" :overline t :underline t)))) 
   )

)
  

;
; uncomment whichever theme I currently favor
;
;(katester)
;(matrix)
;(basic)
(original)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:italic t :foreground "DarkSeaGreen3"))))
 '(mode-line ((t (:background "#303030" :overline t :underline t)))))


; auto fill
(setq hippie-expand-try-functions-list 
'(try-expand-dabbrev
try-expand-dabbrev-visible
try-expand-dabbrev-all-buffers
try-expand-dabbrev-from-kill
try-complete-file-name-partially
try-complete-file-name
try-expand-all-abbrevs
try-expand-list
try-expand-line
try-complete-lisp-symbol-partially
try-complete-lisp-symbol))


; also auto fill
(add-hook 'c-mode-common-hook '(lambda ()
          ;; ac-omni-completion-sources is made buffer local so
          ;; you need to add it to a mode hook to activate on 
          ;; whatever buffer you want to use it with.  This
          ;; example uses C mode (as you probably surmised).
          ;; auto-complete.el expects ac-omni-completion-sources to be
          ;; a list of cons cells where each cell's car is a regex
          ;; that describes the syntactical bits you want AutoComplete
          ;; to be aware of. The cdr of each cell is the source that will
          ;; supply the completion data.  The following tells autocomplete
          ;; to begin completion when you type in a . or a ->
          (add-to-list 'ac-omni-completion-sources
                       (cons "\\." '(ac-source-semantic)))
          (add-to-list 'ac-omni-completion-sources
                       (cons "->" '(ac-source-semantic)))
          ;; ac-sources was also made buffer local in new versions of
          ;; autocomplete.  In my case, I want AutoComplete to use 
          ;; semantic and yasnippet (order matters, if reversed snippets
          ;; will appear before semantic tag completions).
          (setq ac-sources '(ac-source-semantic ac-source-yasnippet))
  ))
