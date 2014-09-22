;; I'm in Australia now
;; I'm in Australia now
(setq system-time-locale "C")
(setq gdb-many-windows t)

;;set the scroll
(global-set-key (kbd "<C-down>") 'scroll-down-line)
(global-set-key (kbd "<C-up>") 'scroll-up-line)

;;shortcut key bindings
(defun switch-to-scratch ()
  "switch to *scratch*"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode)))) 
(global-set-key (kbd "C-x s") 'switch-to-scratch)


(defun visit-.custom ()
  "visit.custom"
  (interactive)
  (find-file (concat "~/.emacs.d/" "custom.el")))
(global-set-key (kbd "C-x E") 'visit-.custom)

(defun visit-org-log ()
  "visit-org-test-file"
  (interactive)
  (find-file (concat "~/org/" "test.org")))
(global-set-key (kbd "C-x g") 'visit-org-log)



; Personal Information
	(setq user-mail-address "emacs2vim@gmail.com")
	(setq user-full-name    "hammer")




;;http://www.emacswiki.org/cgi-bin/wiki/FullScreen
(defun my-fullscreen ()
	      (interactive)
	      (set-frame-parameter nil 'fullscreen
				   (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'my-fullscreen)



;;;copy the name of the current file
(defun copy-file-name (&optional full)
  "Copy file name of current-buffer.
If FULL is t, copy full file name."
  (interactive "P")
  (let ((file (buffer-name)))
    (if full
        (setq file (expand-file-name file)))
    (kill-new file)
    (message "File `%s' copied." file)))
;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map java-mode-map sh-mode-map
;;                        c-mode-base-map text-mode-map ruby-mode-map html-mode-map
;;                        java-mode-map conf-javaprop-mode-map conf-space-mode-map
;;                        python-mode-map py-mode-map cperl-mode-map)
;;  `(("C-c M-C" copy-file-name)))
(global-set-key (kbd "C-c M-C") 'copy-file-name)


(defun revert-buffer-no-confirm ()
  "excute `revert-buffer' with no confirm"
  (interactive)
  (when (buffer-file-name)
    (let ((emaci emaci-mode))
      (revert-buffer buffer-file-name t)
      (emaci-mode (if emaci 1 -1)))))
;; (eal-define-keys-commonly
;;  global-map
;;  `(("C-x u"   revert-buffer-no-confirm)
;;    ("C-x M-K" revert-buffer-with-gbk)
;;    ("C-x U"   revert-buffer-with-coding-system-no-confirm-sb)))
(global-set-key (kbd "C-x U") 'revert-buffer-no-confirm)





;
;; 重新定义`help-command',因为C-h已经绑定为删除前面的字符
(global-set-key (kbd "C-x /") 'help-command)

(eal-define-keys-commonly
 global-map
 `(
   ("C-c C-d" eval-defun)
;;   ("C-c B"  eval-buffer)
   ("C-c R"  eval-region)
   ("C-h" delete-backward-char)  
   ))



;; (eal-define-keys-commonly
;;  global-map
;;  `(
;;    ;; ("M-k" kill-whole-paragraph)
;;    ("M-C-k" kill-paragraph)
;;    ;; ("M-C" copy-whole-paragraph)
;;    ;; ("C-x c" copy-whole-buffer)
;;    ("C-x C" kill-whole-buffer)
;;    ;; ("M-W" which-copy)
;;    ;; ("M-w" smart-copy)
;;    ;; ("C-x M-w" insert-cur-line)
;;    ;; ("C-x M-W" insert-cur-sexp)
;;    ;; ("C-M-w" copy-sentence)
;;    ;; 删除整行
;;    ("M-K" kill-line)
;;    ("C-k" smart-kill)
;;    ("C-\\" delete-indentation)
;;    ("C-x M-M" mark-invisible-region)
;;    ("M-U" del-to-begin)
;;    ("C-^" case-trans)
;;    ("C-6" case-trans)
;;    ("C-w" backward-kill-word-or-kill-region)
;;    ("C-x S" mark-whole-sexp)
;;    ("C-x W" kill-whole-sexp)
;;    ;; ("C-x w" copy-sexp)
;;    ("M-D" my-kill-word)
;;    ("C-x TAB" indent-whole-buffer)
;;    ;; ("C-h" c-electric-backspace-kill)  
;;    ("C-h" delete-backward-char)  
;; ;   ,(if window-system '("C-z" undo))
;;    ("M-Y" redo)
;;    ("M-m" beginning-of-line-text)
;;    ("C-M-\\" smart-indent)
;;    ("M-q" fill-paragraph-justify)
;;    ("<escae> SPC" just-one-space)))

;; (eal-define-keys
;;  'c-mode-base-map
;;   `(("C-c f" copy-function)
;;     ("C-c F" kill-function)
;;     ("C-c C" comment-function)
;;     ("C-M-h" mark-function)))


;; (eal-define-keys
;;  `(emacs-lisp-mode-map lisp-interaction-mode-map)
;;  `(
;;    ("C-c C-d" eval-defun)
;;    ("C-c B"  eval-buffer)
;;    ("C-c R"  eval-region)
;;    ))


;;for not to prompt while kill the buffer
(global-set-key (kbd "C-x k") 
        '(lambda () (interactive) 
           (let (kill-buffer-query-functions) (kill-buffer))))



















;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;original from binchen


;; {{ stardict
;; (setq sdcv-dictionary-simple-list '("&#26391;&#36947;&#33521;&#27721;&#23383;&#20856;5.0"))
;; (setq sdcv-dictionary-complete-list '("WordNet"))
;; ;; }}
 
;; ;; {{ elpa-mirror
;; (setq elpamr-default-output-directory "~/myelpa")
;; (setq elpamr-repository-name "myelpa")
;; (setq elpamr-repository-path "https://dl.dropboxusercontent.com/u/858862/myelpa/")
;; (setq elpamr-email "myname@mydomain.com")
;; ;; }}
 
;; ;; lock my package
;; (if (file-readable-p (expand-file-name "~/Dropbox/Public/myelpa/archive-contents"))
;;      (setq package-archives '(("myelpa" . "~/Dropbox/Public/myelpa/"))))
 
;; ;; {{ Set up third party tags
;; (defun insert-into-tags-table-list(e)
;;   (add-to-list 'tags-table-list e t)
;;   )
;; (defun delete-from-tags-table-list (e)
;;   (setq tags-table-list (delete e tags-table-list))
;;   )
 
;; (defun add-wx-tags (&amp;optional del)
;;   "Add or delete(C-u) wxWidgets tags into tags-table-list"
;;   (interactive "P")
;;   (let (mytags)
;;     ; here add your third party tags
;;     (setq mytags (list "~/tags/wx/osx/TAGS"))
;;     (if del (mapc 'delete-from-tags-table-list mytags)
;;       (mapc 'insert-into-tags-table-list mytags)
;;       )
;;     )
;;   )
;; ;; }}
 
;; ;; (getenv "HOSTNAME") won't work because $HOSTNAME is not an env variable
;; ;; (system-name) won't work because as Optus required, my /etc/hosts is changed
;; (defun my/at-office ()
;;   (interactive)
;;   (let ((my-hostname (with-temp-buffer
;;                        (shell-command "hostname" t)
;;                        (goto-char (point-max))
;;                        (delete-char -1)
;;                        (buffer-string))
;;                      ))
;;     (and (string= my-hostname "my-sydney-workpc")
;;          (not (or (string= my-hostname "sydneypc")
;;                   (string= my-hostname "ChenBinMacAir")
;;                   (string= my-hostname "eee")
;;                   )))
;;     ))
 
;; (defun my/use-office-style ()
;;   (interactive)
;;   (let ((dir (if (buffer-file-name)
;;                  (file-name-directory (buffer-file-name))
;;                "")))
;;     (string-match-p "CompanyProject" dir)
;;     ))
 
;; (defun my/setup-develop-environment ()
;;   (cond
;;    ((my/use-office-style)
;;     (message "Office code style!")
;;     (setq coffee-tab-width 4)
;;     (setq javascript-indent-level 4)
;;     (setq js-indent-level 4)
;;     (setq js2-basic-offset 4)
;;     (setq web-mode-indent-style 4))
;;    (t
;;     (message "My code style!")
;;     (setq coffee-tab-width 4)
;;     (setq javascript-indent-level 2)
;;     (setq js-indent-level 2)
;;     (setq js2-basic-offset 2)
;;     (setq web-mode-indent-style 2))
;;    ))
 
;; (add-hook 'js2-mode-hook 'my/setup-develop-environment)
;; (add-hook 'web-mode-hook 'my/setup-develop-environment)
 
;; (my/setup-develop-environment)
 
;; ;; {{ gnus setup
;; (require 'nnir)
 
;; ;; ask encyption password once
;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)
 
 
;; ;;@see http://www.emacswiki.org/emacs/GnusGmail#toc1
;; ;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.gmane.org"))
;; ;; (add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))
;; (if (my/at-office)
;;     (add-to-list 'gnus-secondary-select-methods '(nnml "optus"))
;;     (setq mail-sources
;;       '((pop :server "localhost"
;;          :port 1110
;;          :user "CP111111"
;;          :password "MyPassword"
;;          :stream network)))
;;     )
 
 
;; (setq gnus-select-method
;;              '(nnimap "gmail"
;;                       (nnimap-address "imap.gmail.com")
;;                       (nnimap-server-port 993)
;;                       (nnimap-stream ssl)
;;                       (nnir-search-engine imap)
;;                       (nnimap-authinfo-file "~/.authinfo.gpg")
;;                       ; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
;;                       ;; press 'E' to expire email
;;                       (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
;;                       (nnmail-expiry-wait 90)
;;                       ))
 
;; ;;@see http://gnus.org/manual/gnus_397.html
;; ;; (add-to-list 'gnus-secondary-select-methods
;; ;;              )
 
;; (setq-default
;;   gnus-summary-line-format "%U%R%z %(%&amp;user-date;  %-15,15f  %B%s%)\n"
;;   gnus-user-date-format-alist '((t . "%Y-%m-%d %H:%M"))
;;   gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
;;   gnus-sum-thread-tree-false-root ""
;;   gnus-sum-thread-tree-indent ""
;;   gnus-sum-thread-tree-leaf-with-other "-&gt; "
;;   gnus-sum-thread-tree-root ""
;;   gnus-sum-thread-tree-single-leaf "|_ "
;;   gnus-sum-thread-tree-vertical "|")
;; (setq gnus-thread-sort-functions
;;       '(
;;         (not gnus-thread-sort-by-date)
;;         (not gnus-thread-sort-by-number)
;;         ))
 
;; ;; we want to browse freely from gwene (RSS)
;; (setq gnus-safe-html-newsgroups "\\`nntp[+:]news\\.gwene\\.org[+:]")
 
;; ; NO 'passive
;; (setq gnus-use-cache t)
;; (setq gnus-use-adaptive-scoring t)
;; (setq gnus-save-score t)
;; (add-hook 'mail-citation-hook 'sc-cite-original)
;; (add-hook 'message-sent-hook 'gnus-score-followup-article)
;; (add-hook 'message-sent-hook 'gnus-score-followup-thread)
;; ; @see http://stackoverflow.com/questions/945419/how-dont-use-gnus-adaptive-scoring-in-some-newsgroups
;; (setq gnus-parameters
;;       '(("nnimap.*"
;;          (gnus-use-scoring nil)) ;scoring is annoying when I check latest email
;;         ))
 
;; (defvar gnus-default-adaptive-score-alist
;;   '((gnus-kill-file-mark (from -10))
;;     (gnus-unread-mark)
;;     (gnus-read-mark (from 10) (subject 30))
;;     (gnus-catchup-mark (subject -10))
;;     (gnus-killed-mark (from -1) (subject -30))
;;     (gnus-del-mark (from -2) (subject -15))
;;     (gnus-ticked-mark (from 10))
;;     (gnus-dormant-mark (from 5))))
 
;; ;; Fetch only part of the article if we can.  I saw this in someone
;; ;; else's .gnus
;; (setq gnus-read-active-file 'some)
 
;; ;; Tree view for groups.  I like the organisational feel this has.
;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
 
;; ;; Threads!  I hate reading un-threaded email -- especially mailing
;; ;; lists.  This helps a ton!
;; (setq gnus-summary-thread-gathering-function
;;       'gnus-gather-threads-by-subject)
 
;; ;; Also, I prefer to see only the top level message.  If a message has
;; ;; several replies or is part of a thread, only show the first
;; ;; message.  'gnus-thread-ignore-subject' will ignore the subject and
;; ;; look at 'In-Reply-To:' and 'References:' headers.
;; (setq gnus-thread-hide-subtree t)
;; (setq gnus-thread-ignore-subject t)

;; Personal Information
;; (setq user-full-name "hammer"
;;       user-mail-address "twitter9mail@gmail.com")

;; 激活分离IO模式的多窗口调试可以通过在.emacs/_emacs文件中添加：
(setq gdb-use-separate-io-buffer nil)
;;启动gdb-many-windows时加载的钩子函数，改变many-windows的默认布局，这个钩子函数不能勾在gdb-setup-windows，因为此时assamble-buffer还没完成初始化，不能set到window
(defadvice gdb-frame-handler-1 (after activate)
  (if gdb-use-separate-io-buffer
      (advice_separate_io)
    (advice_no_separate_io)))

;;生成没有单独IO窗口的gdb布局
(defun advice_no_separate_io()
;;默认的生成gdb-assembler-buffer的函数本身也会设计调用gdb-frame-handler-1，加入此条件发生避免无限递归调用
  (if (not (gdb-get-buffer 'gdb-assembler-buffer))
      (progn
    (shrink-window-horizontally ( / (window-width) 3))

    (other-window 1)
    (split-window-horizontally)

    (other-window 1)
    (gdb-set-window-buffer (gdb-stack-buffer-name))

    (other-window 1)
    (split-window-horizontally)

    (other-window 1)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-assembler-buffer))

    (split-window-horizontally  (/ ( * (window-width) 2) 3))

    (other-window 1)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-registers-buffer))

    (other-window 1)
    (toggle-current-window-dedication)
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-memory-buffer))
    (toggle-current-window-dedication)

    (other-window 2)
    )))

;;生成有单独IO窗口的gdb布局  
(defun advice_separate_io()  
;;默认的生成gdb-assembler-buffer的函数本身也会设计调用gdb-frame-handler-1，加入此条件发生避免无限递归调用  
  (if (not (gdb-get-buffer 'gdb-assembler-buffer))  
      (progn  
    (split-window-horizontally)  
    (enlarge-window-horizontally ( / (window-width) 3))  
    (other-window 1)  
  
    ;;此处不能使用(gdb-set-window-buffer (gdb-get-buffer-create 'gdb-inferior-io))代替，  
    ;;因为在打开gdb-use-separate-io-buffer的状态时，它还会额外调用一些函数将gdb的input，output定位到该buffer  
    (gdb-set-window-buffer (gdb-inferior-io-name))  
  
    (other-window 1)  
    (split-window-horizontally)  
  
    (other-window 1)  
    (gdb-set-window-buffer (gdb-stack-buffer-name))  
  
    (other-window 1)  
  
    (other-window 1)  
    (toggle-current-window-dedication)  
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-assembler-buffer))  
    (toggle-current-window-dedication)  
  
    (split-window-horizontally  (/ ( * (window-width) 2) 3))  
  
    (other-window 1)  
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-registers-buffer))  

    (other-window 1)
    (toggle-current-window-dedication)  
    (gdb-set-window-buffer (gdb-get-buffer-create 'gdb-memory-buffer))  
    (toggle-current-window-dedication)  

    (other-window 2)  
    )))  
