;; JEDI + PYTHON SHELL
(setq jedi:complete-on-dot t) 
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

;; PYLOOK

;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "~/.emacs.d")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; set search option if you want
;; (setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

(autoload 'pylookup-update "pylookup" 
  "Run pylookup-update and create the database at `pylookup-db-file'." t)


;; FLYMAKE

(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/.emacs.d/pyflymake.py" (list local-file))))
      ;;     check path

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))

;; YASNIPPET
(add-to-list 'load-path "/home/sever/.emacs.d/elpa/yasnippet-20150212.240")
(autoload 'yas/initialize "yasnippet" "Do necessary initialization.")
(autoload 'yas/load-directory "yasnippet"
  "Load snippet definition from a directory hierarchy." t)
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "/home/sever/.emacs.d/elpa/yasnippet-20150212.240/snippets")
(yas/load-directory "~/.emacs.d/yasnippets")
(setq hippie-expand-try-functions-list
      (cons 'yas/hippie-try-expand hippie-expand-try-functions-list))
