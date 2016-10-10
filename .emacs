;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ~/_emacs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/elisp/")

;; (setq load-path
;;       (append (list
;; 	       (expand-file-name "~/elisp")
;; 	       (expand-file-name "~/elisp/vm")
;; 	       (expand-file-name (concat (getenv "DEVELOP") "/devtools/elisp"))
;; 	       (expand-file-name (concat (getenv "DEVTOOLS") "/elisp"))
;; 	       ) load-path))

;; (setenv "INFOPATH" 
;;         (concat (getenv "INFOPATH")
;; 		path-separator
;; 		(expand-file-name (concat (getenv "HOME") "/info"))
;; 		path-separator
;; 		(expand-file-name (concat (getenv "DEVELOP") "/devtools/info"))
;; 		path-separator
;; 		(expand-file-name (concat (getenv "DEVTOOLS") "/emacs/info"))
;; 		))


(setq completion-ignored-extensions (list ".obj" ".bak" ".bmp" "~" ".class"))

(setq inhibit-startup-message t)		; seen it...
(setq require-final-newline t)          ; nil for no; non-nil, non-t to ask
(setq truncate-lines nil)               ; don't truncate long lines
;(setq completion-auto-help nil)        ; don't get niggly on a typo
(setq make-backup-files nil)            ; don't leave turds
(setq next-line-add-newlines nil)       ; don't add lines when I cursor down
;(setq win32-downcase-file-names 1)		; downcase all file names
(setq case-fold-search nil)             ; make searches case-insensitive
(setq line-number-mode t)               ; put line numbers in mode-line
(display-time)                          ; put time in mode-line
;(setq display-time-24hr-format t)		; make it military time

; The following options only applicable to faces
;(scroll-bar-mode -1)               ; disable X-mode scrollbars
(menu-bar-mode -1)                 ; disable X-mode menus

;; formatting fascism ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(setq default-tab-width 8)		    ; eight space tabs (local religion)
(setq default-tab-width 4)		    ; four space tabs (local religion)
(setq-default indent-tabs-mode nil)        ; no tabs, just spaces
(defun tab-four  () (interactive) (set-variable 'tab-width 4)) ; infidel!
(defun tab-eight () (interactive) (set-variable 'tab-width 8)) ; infidel!
(global-set-key "\M-4" 'tab-four)
(global-set-key "\M-8" 'tab-eight)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'cloudformation-mode "cloudformation-mode"
   "Major mode for editing Cloud Formation templates" t)
(add-to-list 'auto-mode-alist '("\\.template\\'" . cloudformation-mode))

;;;
;;; Milkypostman’s Emacs Lisp Package Archive
;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
;(package-initialize)
;(unless (package-installed-p 'scala-mode2)
;  (package-refresh-contents) (package-install 'scala-mode2))
;(unless (package-installed-p 'sbt-mode)
;  (package-refresh-contents) (package-install 'sbt-mode))
;(unless (package-installed-p 'haml-mode)
;  (package-refresh-contents) (package-install 'haml-mode))
;(unless (package-installed-p 'sass-mode)
;  (package-refresh-contents) (package-install 'sass-mode))
(unless (package-installed-p 'terraform-mode)
  (package-refresh-contents) (package-install 'terraform-mode))
(unless (package-installed-p 'go-mode)
  (package-refresh-contents) (package-install 'go-mode))

;;;

(autoload 'taskpaper-mode "taskpaper"
   "Major mode for editing Taskpaper notes" t)
(add-to-list 'auto-mode-alist '("\\.taskpaper\\'" . taskpaper-mode))
(add-to-list 'auto-mode-alist '("\\.todopaper\\'" . taskpaper-mode))

(autoload 'powershell-mode "powershell-mode"
   "Major mode for editing PowerShell scripts" t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))

; cmake
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . makefile-mode))

; puppet
(add-to-list 'auto-mode-alist '("\\.pp\\'" . ruby-mode))

; sass
;(add-to-list 'load-path "~/.emacs.d/modes/sass-mode.el")
;(autoload 'sass-mode "sass-mode"
;   "Major mode for editing Sass files" t)
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))


;(add-to-list 'load-path "~/.emacs.d/modes/mustache-mode.el")
;(require 'mustache-mode)

;(add-to-list 'load-path "~/.emacs.d/modes/groovy-mode")
;(require 'groovy-mode)
;(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
;(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
;(add-to-list 'auto-mode-alist '("\\.grails\\'" . groovy-mode))

(require 'yaml-mode)
;(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yml-mode))
;(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; end

; where did this come from?
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-hober)

(put 'upcase-region 'disabled nil)


(defun unix-file ()
  "Change the current buffer to Latin 1 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-unix t))
(defun dos-file ()
  "Change the current buffer to Latin 1 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-dos t))
(defun mac-file ()
  "Change the current buffer to Latin 1 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'iso-latin-1-mac t))
