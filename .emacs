(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(flymake-google-cpplint-command "/usr/bin/cpplint")
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("~/Documents/Learning/Udemy_SoC_Verif_SV/Resource/Source/SystemVerilogReference/projects/updown_counter/memo.org" "~/Org/DIP2FPGA.org" "~/Org/Diary.org" "~/Org/org_mobile.org")))
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update org org-attach-screenshot helm matlab-mode solarized-theme folding yasnippet toxi-theme projectile org-gcal neotree lua-mode lice iedit header2 google-c-style flymake-google-cpplint flymake-cursor calfw-gcal calfw auto-complete-c-headers)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)

;; Emacs theme
(load-theme 'solarized-dark t)

; auto-complete
(global-auto-composition-mode t)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

; auto-complete c header
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Keybinding
(define-key global-map (kbd "C-c ;") 'iedit-mode)
(global-set-key (kbd "C-x r p") 'replace-regexp)
(global-set-key (kbd "<f8>") 'neotree-toggle)
(global-set-key (kbd "C-x w j") 'windmove-down)
(global-set-key (kbd "C-x w k") 'windmove-up)
(global-set-key (kbd "C-x w h") 'windmove-left)
(global-set-key (kbd "C-x w l") 'windmove-right)
(global-set-key (kbd "M-*    ") 'pop-tag-mark)
(global-set-key (kbd "C-c r b") 'revert-buffer)

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
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

                                        ; Verilog-mode
(add-to-list 'load-path "~/.emacs.d/verilog")

(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             2
      verilog-indent-level-module      2
      verilog-indent-level-declaration 2
      verilog-indent-level-behavioral  2
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             'nil
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

;; Configure for Org sync
(require 'org)
(setq org-directory "~/Org")
(setq org-mobile-inbox-for-pull "~/Org/org_mobile.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
(setq org-mobile-files '("~/Org"))
(setq org-agenda-files (list "~/Org/DIP2FPGA.org"
                             "~/Org/Diary.org"
                             "~/Org/org_mobile.org"))
(setq org-todo-keywords
       '((sequence "TODO" "IN-PROGRESS" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

;; Misc
(show-paren-mode t)
(electric-pair-mode t)
(global-hl-line-mode)
(set-face-background 'highlight nil)
(set-face-foreground 'highlight nil)
(set-face-underline-p 'highlight t)
(setq show-paren-style 'mixed)
(global-linum-mode t)
(scroll-bar-mode 0)
(column-number-mode 1)
(setq make-backup-files nil)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq default-tab-width 4)
(setq truncate-lines 1)
(put 'dired-find-alternate-file 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Dired omit mode
;;(require 'dired-x)
;;(setq-default dired-omit-files-p t) ; Buffer-local variable
;;(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

;; Recenf
(recentf-mode t)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(run-at-time nil (* 5 60) 'recentf-save-list)

;; Change yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clean up white space
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq-default indent-tabs-mode nil)

;; Untabify when upon saving in verilog mode
(add-hook 'verilog-mode-hook '(lambda ()
  (add-hook 'write-file-functions (lambda()
    (untabify (point-min) (point-max))
    nil))))

;; Test for folding-mode
(add-hook 'verilog-mode-hook '(lambda ()
                                (folding-mode)))

(set-default 'truncate-lines t)

;; Paste overwrite
(delete-selection-mode 1)

;; Grep argument
(setq grep-command "grep -nir ")

(require 'compile)

(add-to-list 'compilation-error-regexp-alist
             '("^\\*\\\* Error: \\(.*?\\)(\\(.*?\\)):" 1 2))
(add-to-list 'compilation-error-regexp-alist
             '("^\\*\\\* Warning: \\(.*?\\)(\\(.*?\\)):" 1 2))
(add-to-list 'compilation-error-regexp-alist
             '("^# Stopped at \\(.*?\\) \\(.*?\\):" 1 2))

(add-to-list 'compilation-error-regexp-alist
             '("^\\*\\\* Error: \\(.*?\\)(\\(.*?\\)):" 1 2))

(setq compilation-context-lines 10)
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)

;;Helm
(require 'helm-config)

;; Underline the current lines
(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline t)

;; Org attach screen shot
(require 'org-attach-screenshot)

; (setq org-latex-create-formula-image-program 'dvisvgm)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defun my-org-latex-preview-advice (beg end &rest _args)
    (let* ((ov (car (overlays-in beg end)))
           (img (cdr (overlay-get ov 'display)))
           (new-img (plist-put img :ascent 90)))
      (overlay-put ov 'display (cons 'image new-img))))
(advice-add #'org--format-latex-make-overlay
            :after #'my-org-latex-preview-advice)

;; Start server
(server-start)
