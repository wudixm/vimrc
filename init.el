
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
;;
(add-to-list 'load-path "~/.emacs.d/evil")
;;
(require 'evil)
(evil-mode 1)

;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(package-selected-packages '(use-package ##)))
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; )
;;(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

; https://github.com/daviwil/dotfiles/blob/master/Emacs.org
;; Thanks, but no thanks
(setq inhibit-startup-message t)

;;(scroll-bar-mode -1)        ; Disable visible scrollbar
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
;;(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
;;(set-fringe-mode 10)       ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar
(global-display-line-numbers-mode t)
; (setq display-line-numbers-type 'visual)
(setq display-line-numbers-type 't)

;; Set up the visible bell
(setq visible-bell t)
; (set-face-attribute 'default nil :font "Fira Code Retina" :height 170)
(set-face-attribute 'default nil :height 170)

;; Set the fixed pitch face
; (set-face-attribute 'fixed-pitch nil
                    ; :font "JetBrains Mono"
                    ; :weight 'light
                    ; :height (dw/system-settings-get 'emacs/fixed-face-size))

;; Set the variable pitch face
; (set-face-attribute 'variable-pitch nil
                    ; ;; :font "Cantarell"
                    ; :font "Iosevka Aile"
                    ; :height (dw/system-settings-get 'emacs/variable-face-size)
                    ; :weight 'light)

;; Set Frame width/height
; (setq default-frame-alist
        ; '((top . 25) (left . 275) (width . 105) (height . 60)))
(setq default-frame-alist '((left . 0) (width . 160) (fullscreen . fullheight)))




;; 自己加的包 2021-07-13
(add-to-list 'load-path "~/.emacs.d/key-chord")
 (require 'key-chord)
 (key-chord-mode 1)
					; (key-chord-define-global "jk"     "Esc")
					; (key-chord-define-global ",."     "<>\C-b")fdsfd
;(key-chord-define-global "jk"     'evil-normal-stated)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)


(load-theme 'tango-dark)

;; key mappings 快捷键
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "H") (kbd "H zz"))
;; (define-key evil-normal-state-map (kbd "H") (kbd "H zz"))
; (define-key evil-normal-state-map (kbd "C-r") 'isearch-backward) 
; https://stackoverflow.com/questions/44480585/how-to-rebind-c-r-undo-tree-redo-in-emacs-with-evil-mode
(define-key evil-normal-state-map (kbd "C-r") 'evil-scroll-line-up)



;; packages 包管理
;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)

;; Uncomment this to get a reading on packages that get loaded at startup
;;(setq use-package-verbose t)

;; On non-Guix systems, "ensure" packages by default
(setq use-package-always-ensure t)
(use-package command-log-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(org-roam deft undo-tree markdown-mode yafolding json-mode visual-fill-column org-superstar diminish wgrep flx ivy-rich ivy-hydra counsel ivy command-log-mode use-package ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)

  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  ;; Use different regex strategies per completion command
  (push '(completion-at-point . ivy--regex-fuzzy) ivy-re-builders-alist) ;; This doesn't seem to work...
  (push '(swiper . ivy--regex-ignore-order) ivy-re-builders-alist)
  (push '(counsel-M-x . ivy--regex-ignore-order) ivy-re-builders-alist)

  ;; Set minibuffer height for different commands
  (setf (alist-get 'counsel-projectile-ag ivy-height-alist) 15)
  (setf (alist-get 'counsel-projectile-rg ivy-height-alist) 15)
  (setf (alist-get 'swiper ivy-height-alist) 15)
  (setf (alist-get 'counsel-switch-buffer ivy-height-alist) 7))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package ivy-hydra
  :defer t
  :after hydra)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1)
  :after counsel
  :config
  (setq ivy-format-function #'ivy-format-function-line)
  (setq ivy-rich-display-transformers-list
        (plist-put ivy-rich-display-transformers-list
                   'ivy-switch-buffer
                   '(:columns
                     ((ivy-rich-candidate (:width 40))
                      (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
                      (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
                      (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
                      (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
                     :predicate
                     (lambda (cand)
                       (if-let ((buffer (get-buffer cand)))
                           ;; Don't mess with EXWM buffers
                           (with-current-buffer buffer
                             (not (derived-mode-p 'exwm-mode)))))))))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package flx  ;; Improves sorting for fuzzy-matched results
  :after ivy
  :defer t
  :init
  (setq ivy-flx-limit 10000))

(use-package wgrep)

(use-package ivy-posframe
  :disabled
  :custom
  (ivy-posframe-width      115)
  (ivy-posframe-min-width  115)
  (ivy-posframe-height     10)
  (ivy-posframe-min-height 10)
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters '((parent-frame . nil)
                                  (left-fringe . 8)
me-mode 1)))

(use-package diminish)


;; org mode 部分
(setq-default fill-column 80)
;; Turn on indentation and auto-fill mode for Org files
(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (diminish org-indent-mode))


(use-package org
  :defer t
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        ; org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))


;; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;(set-face-attribute 'org-document-title nil :weight 'bold :height 1.3)
;;(dolist (face '((org-level-1 . 1.2)
;;                (org-level-2 . 1.1)
;;                (org-level-3 . 1.05)
;;                (org-level-4 . 1.0)
;;                (org-level-5 . 1.1)
;;                (org-level-6 . 1.1)
;;                (org-level-7 . 1.1)
;;                (org-level-8 . 1.1)))
;;  (set-face-attribute (car face) nil :weight 'medium :height (cdr face)))

(defun dw/org-mode-visual-fill ()
  (setq visual-fill-column-width 110
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :defer t
  :hook (org-mode . dw/org-mode-visual-fill))

(set-face-attribute 'default nil :height 200)

; 有关备份文件
; https://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files
(setq backup-directory-alist `(("." . "~/.saves")))

; org tree slide
; https://github.com/takaxp/org-tree-slide/blob/master/README.org
(add-to-list 'load-path "~/.emacs.d/org-tree-slide")
(require 'org-tree-slide)

(with-eval-after-load "org-tree-slide"
  (define-key org-tree-slide-mode-map (kbd "<f9>") 'org-tree-slide-move-previous-tree)
  (define-key org-tree-slide-mode-map (kbd "<f10>") 'org-tree-slide-move-next-tree)
  )

(add-to-list 'load-path "~/local/softwares/common/emacs/orgmode-master/contrib/lisp" t)

(require 'ox-confluence)

; redo undo 和vim u C_r 同样效果
; https://github.com/ProofGeneral/PG/issues/430
;; undo tree
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(use-package undo-tree
  :config
  (turn-on-undo-tree-mode))
(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
(define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)

; dift 相关配置https://github.com/jrblevin/deft 2021-11-19添加
;(setq deft-extensions '("txt" "tex" "org"))
;(setq deft-recursive t)
;(setq deft-use-filename-as-title t)
;(setq deft-use-filter-string-for-filename t)
;(setq deft-file-naming-rules '((noslash . "-")
;                               (nospace . "-")
;                               (case-fn . downcase)))
;(setq deft-text-mode 'org-mode)
;(setq deft-org-mode-title-prefix t)
;(setq deft-strip-summary-regexp
; (concat "\\("
;         "[\n\t]" ;; blank
;	 "\\([\n ]\\|[[:upper:]_]+:.*$\\)"
;         "\\)"))
(setq deft-extensions '("txt" "tex" "org" "md"))
(setq deft-directory "/Users/wuxiaoming/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org")
(setq deft-recursive t)
(setq deft-file-naming-rules '((noslash . "_")))
(setq deft-text-mode 'org-mode)
(setq deft-use-filter-string-for-filename t)
(setq deft-org-mode-title-prefix t)
(setq deft-use-filename-as-title nil)
(setq deft-strip-summary-regexp
      (concat "\\("
              "[\n\t]" ;; blank
              "\\|^#\\+[[:upper:]_]+:.*$" ;; org-mode metadata
              "\\|^#\\+[[:alnum:]_]+:.*$" ;; org-mode metadata
              "\\)"))
(global-set-key [f4] 'deft)

(global-set-key [f6] 'toggle-truncate-lines)

(setq org-roam-v2-ack t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "/Users/wuxiaoming/local/tempFiles/org_roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
	 :map org-mode-map
         ("C-M-i"    . completion-at-point)
	 )
  :config
  (org-roam-setup))

(setq org-roam-node-display-template "${title} ${tags}")
