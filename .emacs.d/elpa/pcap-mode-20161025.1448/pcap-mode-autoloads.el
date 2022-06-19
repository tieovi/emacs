;;; pcap-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "pcap-mode" "pcap-mode.el" (0 0 0 0))
;;; Generated autoloads from pcap-mode.el

(defvar pcap-mode-tshark-executable (executable-find "tshark") "\
Path to the tshark executable.")

(custom-autoload 'pcap-mode-tshark-executable "pcap-mode" t)

(defvar pcap-mode-reload-pcap-when-filter-changes t "\
Whether to reload the pcap file after changing the filter.")

(custom-autoload 'pcap-mode-reload-pcap-when-filter-changes "pcap-mode" t)

(defvar pcap-mode-tshark-filter "" "\
Filter to apply to tshark invocations.")

(custom-autoload 'pcap-mode-tshark-filter "pcap-mode" t)

(defvar pcap-mode-tshark-single-packet-filter "-V -Y" "\
Filter to apply when displaying individual packets.")

(custom-autoload 'pcap-mode-tshark-single-packet-filter "pcap-mode" t)

(defvar pcap-mode-dfilters-file "~/.wireshark/dfilters" "\
Location of wireshark dfilters file containing predefined display filters.
Lines of file must be in the following form:
\"<NAME>\" <FILTER EXPRESSION>")

(custom-autoload 'pcap-mode-dfilters-file "pcap-mode" t)

(defvar pcap-mode-hook nil "\
Hook list run when a pcap file is opened.")

(defvar pcap-mode-reloaded-hook nil "\
Hook list run whenever the pcap file is loaded or reloaded.")

(defvar pcap-mode-quit-hook nil "\
Hook list run when a pcap file is closed.")

(defvar pcap-mode-map (let ((kmap (make-keymap))) (define-key kmap (kbd "<return>") 'pcap-mode-view-pkt-contents) (define-key kmap (kbd "t") 'pcap-mode-toggle-conversation-view) (define-key kmap (kbd "\25 t") (lambda nil (interactive) (pcap-mode-toggle-conversation-view 1))) (define-key kmap (kbd "f") 'pcap-mode-set-tshark-filter) (define-key kmap (kbd "F") 'pcap-mode-set-named-filter) (define-key kmap (kbd "c") 'pcap-mode-search-frames) (define-key kmap (kbd "\25 f") 'pcap-mode-set-tshark-single-packet-filter) (define-key kmap (kbd "s") 'pcap-mode-set-tshark-single-packet-filter) (define-key kmap (kbd "r") 'pcap-mode-reload-file) (define-key kmap (kbd "g") 'pcap-mode-clear-filter) (define-key kmap (kbd "\3 \4") (lambda nil (interactive) (message "tshark filter \"%s\"" pcap-mode-tshark-filter))) (define-key kmap (kbd "q") (lambda nil (interactive) (kill-buffer))) kmap) "\
Keymap for pcap major mode.")

(autoload 'pcap-mode "pcap-mode" "\
Major mode for viewing pcap files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.pcap\\'" . pcap-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pcap-mode" '("pcap-mode-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; pcap-mode-autoloads.el ends here
