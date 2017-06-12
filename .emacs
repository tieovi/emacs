(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(flymake-google-cpplint-command "/usr/bin/cpplint")
 '(font-use-system-font t)
 '(inhibit-startup-screen t)
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

; start auto-complete with emacs
(global-auto-composition-mode t)
(require 'auto-complete)
; do default config for autocomplete
(require 'auto-complete-config)
(ac-config-default)

; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

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

;; (require 'projectile)
;; (projectile-global-mode)
;; (setq projectile-enable-caching t)
;; (global-set-key [f5] 'projectile-find-file)

; verilog mode 4 space
(setq default-tab-width 4)
;(defun my-verilog-hook()
 ; (setq indent-tabs-mode nil)
  ;(setq tab-width 4))
;(add-hook 'verilog-mode-hook 'my-verilog-hook)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;;; Verilog-mode customization.
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
(setq verilog-indent-level             4
      verilog-indent-level-module      4
      verilog-indent-level-declaration 4
      verilog-indent-level-behavioral  4
      verilog-indent-level-directive   1
      verilog-case-indent              2
      verilog-auto-newline             t
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        4
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

; disable creat backup file
(setq make-backup-files nil) 

;;;; Move between windows
;;(global-set-key (kbd "C-x j") 'windmove-down)
;;(global-set-key (kbd "C-x k") 'windmove-up)
;;(global-set-key (kbd "C-x h") 'windmove-left)
;;(global-set-key (kbd "C-x l") 'windmove-right)

(require 'org-gcal)
(put 'dired-find-alternate-file 'disabled nil)
