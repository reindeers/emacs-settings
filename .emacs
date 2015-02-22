(load-file "/home/sever/.emacs.d/bindings.el")
(load-file "/home/sever/.emacs.d/hooks.el")

(setq unix-sbcl-bin          "/usr/bin/sbcl")
(setq unix-init-path         "~/.emacs.d")
(setq unix-init-slime-path   "/usr/share/common-lisp/source/slime/")
(add-to-list 'load-path "~/.emacs.d") 

;; Dired 
(require 'dired)
(setq dired-recursive-deletes 'top) ;; delete full dir

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Org-mode settings
(require 'org) 
(add-to-list 'auto-mode-alist '("\\.org$" . Org-mode)) ;; *.org files with org-mode

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Delete selection
(delete-selection-mode t)

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d  ") ;; задаем формат нумерации строк

;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах

;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b


;; Syntax highlighting
(require 'font-lock)
(setq font-lock-maximum-decoration t)

;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа

(setq lisp-indent-function  'common-lisp-indent-function)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы  
(setq scroll-conservatively 10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; End of file newlines
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении курсора  стрелками

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Bookmark settings
(require 'bookmark)
(setq bookmark-save-flag t) ;; автоматически сохранять закладки в файл
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")) ;; хранить закладки в файл bookmarks в .emacs.d


(add-to-list 'load-path "~/.emacs.d/")
(require 'package) 
    (add-to-list 'package-archives 
                 '("melpa" . "http://melpa.org/packages/") t) 
    (when (< emacs-major-version 24) 
          (add-to-list 'package-archives 
                       '("gnu" . "http://elpa.gnu.org/packages/"))) 
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(unless (require 'el-get nil 'noerror) 
    (with-current-buffer 
       (url-retrieve-synchronously 
        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el") 
     (goto-char (point-max)) 
     (eval-print-last-sexp))) 
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes") 
(el-get 'sync)


(load-file "/home/sever/.emacs.d/dev_python.el")

(require 'smart-operator)

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

;;(transient-mark-mode 1)
