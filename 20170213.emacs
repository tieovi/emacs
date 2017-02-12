(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-time-mode t)
 '(ede-project-directories (quote ("/mnt/Data/Studies/DIP/Src/Image_IO/src")))
 '(flymake-google-cpplint-command "/usr/bin/cpplint")
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("/home/tlv/Dropbox/Org/Daily_Org.org" "/home/tlv/Dropbox/Org/Design_For_Embedded_Image_Processing.org" "/home/tlv/Dropbox/Org/HRCP.org" "/home/tlv/Dropbox/Org/Japanese.org" "/home/tlv/Dropbox/Org/Video_Platform.org" "/home/tlv/Dropbox/Org/vivado_hls.org")))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(verilog-indent-level 0 t)
 '(verilog-indent-level-behavioral 2 t)
 '(verilog-indent-level-declaration 2 t)
 '(verilog-indent-level-module 2 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

; start auto-complete with emacs
;(global-auto-composition-mode t)
(require 'auto-complete)
; do default config for autocomplete
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
;;(require 'yasnippet)
;;(yas-global-mode 1)

; auto-complete c header
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/")
) 
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; iedit mode
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; start flymake-google-cpplint-load
; let's define a function for flymake init
(defun my:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;(require 'projectile)
;;(projectile-global-mode)
;;(setq projectile-enable-caching t)
;;(global-set-key [f5] 'projectile-find-file)

; verilog mode 4 space
(setq default-tab-width 4)
;(defun my-verilog-hook()
 ; (setq indent-tabs-mode nil)
  ;(setq tab-width 4))
;(add-hook 'verilog-mode-hook 'my-verilog-hook)

;;; Verilog-mode customization.
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
;;(setq verilog-indent-level             4
;;      verilog-indent-level-module      4
;;      verilog-indent-level-declaration 4
;;      verilog-indent-level-behavioral  4
;;      verilog-indent-level-directive   1
;;      verilog-case-indent              2
;;      verilog-auto-newline             t
;;      verilog-auto-indent-on-newline   t
;;      verilog-tab-always-indent        4
;;      verilog-auto-endcomments         t
;;      verilog-minimum-comment-distance 40
;;      verilog-indent-begin-after-if    t
;;      verilog-auto-lineup              '(all))

(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             t
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        2
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              '(all))
(setq auto-mode-alist
      (append
       '(("\\.v$" . verilog-mode))
       '(("\\.v\\.erb" . verilog-mode))
       '(("\\.v\\.in" . verilog-mode))
       auto-mode-alist))

(setq indent-tabs-mode nil)
(setq tab-width 4)

; enable linum mode
(global-linum-mode t)
(column-number-mode t)

; disable creat backup file
(setq make-backup-files nil) 

(require 'org-gcal)
;; Enable show-paren-mode for matching parenthesis
(show-paren-mode)
(put 'dired-find-alternate-file 'disabled nil)
;; Enable Icicle mode
;;(icicle-mode t)
;;
;;(require 'calfw-gcal)
;; Eshell color
(setq eshell-prompt-function
  (lambda ()
    (concat (format-time-string "%m-%d %H:%M" (current-time))
            (if (= (user-uid) 0) " # " " $ "))))

;; Define sudo-edit functions
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/su:root@ips"eval-sexp
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/su:root@ips:" buffer-file-name))))

;; Sudo mode
(global-set-key (kbd "C-x C-r") 'sudo-edit)

;; Google translate mode
(require 'google-translate)
(require 'google-translate-default-ui)
(global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-cT" 'google-translate-query-translate)

;; Cedet
(global-ede-mode 1)                      ; Enable the Project management system

;; String insert rectangle mode
;;(define-key global-map (kbd "C-x r i") 'string-insert-rectangle)

;; Evil mode
;;(add-to-list 'load-path "~/.emacs.d/evil")
;;(require 'evil)
;;(evil-mode 0)
;;(global-set-key (kbd "C-*") 'evil-search-symbol-forward)
;;(global-set-key (kbd "C-#") 'evil-search-symbol-backward)
;; Disable scroll bar
(scroll-bar-mode 0)
;; Auto-revert buffer
(auto-revert-mode 1)
;; Untabify upon saving
 ;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks 
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))
            nil ))

;; Org mode
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;org-mode configuration
;; Enable org-mode
(require 'org)
;; Make org-mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
;; To do workflow
(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; OrgMobile mode
(setq org-directory "~/Dropbox/Org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Dropbox/Org/HRCP.org")

;; etags
(setq path-to-ctags "/usr/bin/ctags")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f TAGS -e -R %s" path-to-ctags (directory-file-name dir-name)))
  )

;; auto revert mode
(auto-revert-mode t)

;; getting alias works in emacs
(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;; cperl-mode is preferred to perl-mode
;; "Brevity is the soul of wit" <foo at acm.org>
(defalias 'perl-mode 'cperl-mode)

;; Using Org-mode
(org-agenda-to-appt)

;; Run Emacs as server
(server-start)

;; Underline current line in emacs
(global-hl-line-mode t)
(set-face-background 'highlight "#222")
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)

;; Add for Verilog debugger
(require 'compile)

(add-to-list 'compilation-error-regexp-alist
             '("^\\*\\\* Error: \\(.*?\\)(\\(.*?\\)):" 1 2))

(setq compile-command "qverilog +cover covmerge1.sv -R -coverage")
(setq compilation-context-lines 10)
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)

;; Disable emacs dialog
(setq use-dialog-box nil)

;; Electric pair mode
(electric-pair-mode t)
