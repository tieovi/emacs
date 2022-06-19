(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default))
 '(default-input-method "vietnamese-telex")
 '(fci-rule-color "#073642")
 '(flymake-google-cpplint-command "/usr/bin/cpplint")
 '(font-use-system-font t)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(org-agenda-files
   '("~/Documents/Learning/Udemy_SoC_Verif_SV/Resource/Source/SystemVerilogReference/projects/updown_counter/memo.org" "~/Org/DIP2FPGA.org" "~/Org/Diary.org" "~/Org/org_mobile.org" "~/Org/SystemVerilog_for_Verification.org"))
 '(package-selected-packages
   '(xah-find gtk-pomodoro-indicator org-pomodoro jupyter company flycheck lsp-mode magit anaconda-mode pylint auto-complete pcap-mode veri-kompass tabbar spacemacs-theme gnu-elpa-keyring-update org org-attach-screenshot helm matlab-mode solarized-theme folding yasnippet toxi-theme projectile org-gcal neotree lua-mode lice iedit header2 google-c-style flymake-google-cpplint flymake-cursor calfw-gcal calfw auto-complete-c-headers))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(show-paren-mode t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 113 :width normal)))))


(require 'package)
;(setq package-archives '(("elpaclone" . "~/elpaclone")))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)

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
;; Comment out
; (add-hook 'c-mode-hook 'my:flymake-google-init)
; (add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; Verilog-mode
(add-to-list 'load-path "~/.emacs.d/verilog")

;; Icicle
(add-to-list 'load-path "~/.emacs.d/icicles-master")
(require 'icicles)

;; Org mode bullet
;; (add-to-list 'load-path "~/.emacs.d/org-bullet/")
;; (require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


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
(menu-bar-mode t)
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

;;;;Helm
;;(require 'helm-config)

;; Underline the current lines
(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline t)

;; Org attach screen shot and shortcut
(require 'org-attach-screenshot)
(global-set-key (kbd "C-x t s") 'org-attach-screenshot)
(global-set-key (kbd "C-x t i") 'org-toggle-inline-images)

(add-to-list 'ac-modes 'org-mode)
(ac-set-trigger-key "TAB")

; (setq org-latex-create-formula-image-program 'dvisvgm)
(defun my-org-latex-preview-advice (beg end &rest _args)
    (let* ((ov (car (overlays-in beg end)))
           (img (cdr (overlay-get ov 'display)))
           (new-img (plist-put img :ascent 90)))
      (overlay-put ov 'display (cons 'image new-img))))
(advice-add #'org--format-latex-make-overlay
            :after #'my-org-latex-preview-advice)

;;; Vivado mode
;;(add-to-list 'load-path "~/.emacs.d/vivado-mode")
;;(require 'vivado-mode)

(setq auto-mode-alist
      (append
       '(("\\.xdc" . vivado-mode))
       auto-mode-alist))

;;================================================================================
;; Org bullet mode
;; Reference link: https://github.com/sabof/org-bullets
;;================================================================================
(add-to-list 'load-path "~/.emacs.d/org-bullet")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Start server
(server-start)

(defvar beg-flag-regexp (concat
  "\\(\\\\begin\{\\)\\("
  "[^}]*"
  "\\)\\(\}\\)" )
"Regexp matching the beginning of the folded region.")

(defun toggle-block ()
"When FLAG is non-nil, hide the region.  Otherwise make it visible.  For this
function to work, the cursor must be on the same line as the beginning regexp."
(interactive)
  (require 'outline)
  (cond
    ((or
        ;; sweet-spot
        (looking-at beg-flag-regexp)
        ;; point could be between backslash and before the letter n
        (let ((line-begin (save-excursion (beginning-of-line 1) (point))))
          (save-excursion
            (re-search-backward "\\\\" line-begin t)
            (looking-at beg-flag-regexp)))
        ;; point could be to the right of \begin
        (let ((line-begin (save-excursion (beginning-of-line 1) (point))))
          (save-excursion
            (re-search-backward "\\\\begin" line-begin t)
            (looking-at beg-flag-regexp)))
        ;; point could be to the left of \begin
        (let ((line-end (save-excursion (end-of-line 1) (point))))
          (save-excursion
            (re-search-forward "\\\\begin" line-end t)
            (backward-char 6)
            (looking-at beg-flag-regexp))))
      (let* (
          (flag (not (get-char-property (match-end 0) 'invisible)))
          (beg (match-end 0))
          end
          (base-flag-match (regexp-quote
            (buffer-substring-no-properties (match-beginning 2) (match-end 2))))
          (end-flag-match (concat "\\\\end\{" base-flag-match "\}"))
          (go-fish (concat "\\begin\{" base-flag-match "\}"))  )
        (save-excursion
          (if (re-search-forward end-flag-match nil t)
            (progn
              (setq end (point))
              (outline-flag-region beg end flag)
              (cond
                (flag
                  (overlay-put (make-overlay beg end) 'display "\u25be"))
                (t
                  (mapc 'delete-overlay (overlays-in beg end)))))
            (user-error "Error locating an ending match for:  %s." go-fish)))
        (if (> (point) beg)
          (goto-char beg)) ))
    (t
      (message "Sorry, you are not on a line containing the beginning regexp."))))

(require 'compile)

;; Resize the table in Org Mode
(add-to-list 'load-path "~/.emacs.d/ftable")
(require 'ftable)

(add-to-list 'compilation-error-regexp-alist
   '("^\\*\\\* Error: \\(.*?\\)(\\(.*?\\)):" 1 2))

(setq compile-command "verilator --default-language 1800-2012 -lint-only")
(setq compilation-context-lines 10)
(setq compilation-scroll-output t)
(setq compilation-auto-jump-to-first-error t)
(setq verilog-linter "verilator --default-language 1800-2012 -lint-only")

;;;; Emacs with lsp-mode
;;(use-package flycheck
;;             :ensure t
;;             :defer t
;;             :init  (global-flycheck-mode t))
;;
;;(use-package company
;;             :ensure t
;;             :defer t
;;             :init (global-company-mode t)
;;             :config
;;             ;; Company Flx adds fuzzy matching to company, powered by the sophisticated
;;             ;; sorting heuristics  in =flx=
;;             (use-package company-flx
;;                          :ensure t
;;                          :after company
;;                          :init (company-flx-mode t))
;;             ;; Company Quickhelp
;;             ;; When idling on a completion candidate the documentation for the
;;             ;; candidate will pop up after `company-quickhelp-delay' seconds.
;;             (use-package company-quickhelp
;;                          :after company
;;                          :ensure t
;;                          ;; :init (company-quickhelp-mode t)
;;                          :hook (prog-mode . (lambda ()
;;                                               (when (window-system)
;;                                                 (company-quickhelp-local-mode))))
;;                          :config
;;                          (setq company-quickhelp-delay 0.2
;;                                company-quickhelp-max-lines nil)))
;;
;;(use-package lsp-mode
;;             :defer t
;;             :ensure t
;;             :commands lsp
;;             :config
;;             (setq lsp-log-io nil
;;                   lsp-auto-configure t
;;                   lsp-auto-guess-root t
;;                   lsp-enable-completion-at-point t
;;                   lsp-enable-xref t
;;                   lsp-prefer-flymake nil
;;                   lsp-use-native-json t
;;                   lsp-enable-indentation t
;;                   lsp-response-timeout 10
;;                   lsp-restart 'auto-restart
;;                   lsp-keep-workspace-alive t
;;                   lsp-eldoc-render-all nil
;;                   lsp-enable-snippet nil
;;                   lsp-enable-folding t)
;;   ;;; lsp-ui gives us the blue documentation boxes and the sidebar info
;;             (use-package lsp-ui
;;                          :defer t
;;                          :ensure t
;;                          :after lsp
;;                          :commands lsp-ui-mode
;;                          :config
;;                          (setq lsp-ui-sideline-ignore-duplicate t
;;                                lsp-ui-sideline-delay 0.5
;;                                lsp-ui-sideline-show-symbol t
;;                                lsp-ui-sideline-show-hover t
;;                                lsp-ui-sideline-show-diagnostics t
;;                                lsp-ui-sideline-show-code-actions t
;;                                lsp-ui-peek-always-show t
;;                                lsp-ui-doc-use-childframe t)
;;                          :bind
;;                          (:map lsp-ui-mode-map
;;                                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;;                                ([remap xref-find-references] . lsp-ui-peek-find-references))
;;                          :hook
;;                          ((lsp-mode . lsp-ui-mode)
;;                           (lsp-after-open . (lambda ()
;;                                               (lsp-ui-flycheck-enable t)
;;                                               (lsp-ui-sideline-enable t)
;;                                               (lsp-ui-imenu-enable t)
;;                                               (lsp-lens-mode t)
;;                                               (lsp-ui-peek-enable t)
;;                                               (lsp-ui-doc-enable t)))))
;;  ;;; company lsp
;;             ;; install LSP company backend for LSP-driven completion
;;             (use-package company-lsp
;;                          :defer t
;;                          :ensure t
;;                          :after company
;;                          :commands company-lsp
;;                          :config
;;                          (setq company-lsp-cache-candidates t
;;                                company-lsp-enable-recompletion t
;;                                company-lsp-enable-snippet t
;;                                company-lsp-async t)
;;                          ;; avoid, as this changes it globally do it in the major mode instead (push
;;                          ;; 'company-lsp company-backends) better set it locally
;;                          :hook (lsp-after-open . (lambda()
;;                                                    (add-to-list (make-local-variable 'company-backends)
;;
;;                                                                 'company-lsp)))))

;; enable auto-complete-mode at global
(global-auto-complete-mode t)

;; auto complete for GNU octave
(require 'ac-octave)
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-setup)))

;; icycles
(add-to-list 'load-path "/home/tieovi/.emacs.d/icicles-master/")
(icy-mode 1)

;; find in buffer
(global-set-key (kbd "C-c g r") 'xah-find-text)

(global-set-key (kbd "C-x a l") 'align-regexp)

;; tramp
(require 'tramp)
(setq tramp-default-method "scp")

;; (defun connect-remote ()
;;   (interactive)
;;   (dired "/ssh:luanvt@10.42.0.71:/home/luanvt"))
