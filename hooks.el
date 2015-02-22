(add-hook 'python-mode-hook 'auto-complete-mode) 
(add-hook 'python-mode-hook 'jedi:setup) ;; Fully setup jedi.el for current buffer. It setups ac-sources (calls jedi:ac-setup) and turns jedi-mode o

(add-hook 'find-file-hook 'flymake-find-file-hook)
