(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t)) ;; попытаться найти и открыть файл с закладками
(global-set-key (kbd "<f3>") 'bookmark-set) ;; создать закладку по F3
(global-set-key (kbd "<f4>") 'bookmark-jump) ;; прыгнуть на закладку по F4
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list) ;; открыть список закладок
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ

(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)

;; PYTHON DEV

(global-set-key [(\t)] 'indent-for-tab-command) ;;yasnippet
(setq yas/trigger-key (kbd "M-n"))

;; Перемещение по python-коду
(defun py-to-start-of-class()
  (interactive)
  (py-beginning-of-def-or-class 'class)
)
 
(defun py-to-end-of-class()
  (interactive)
  (py-end-of-def-or-class 'class)
)

(add-hook 'python-mode-hook
               '(lambda ()
  (local-set-key [(s menu)] 'rope-code-assist)
  (local-set-key [(s up)] 'python-move-to-start-of-class)
  (local-set-key [(s down)] 'python-move-to-end-of-class)
  (local-set-key [(meta down)] 'py-end-of-def-or-class)
  (local-set-key [(meta up)] 'py-beginning-of-def-or-class)
  (local-set-key (kbd "C-c C-a") 'py-to-start-of-class)
  (local-set-key (kbd "C-c C-e") 'py-to-end-of-class)
  (local-set-key (kbd "s-q") 'py-shift-region-left)
  (local-set-key (kbd "s-w") 'py-shift-region-right)
  )
)
