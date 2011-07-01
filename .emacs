(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-ignores (quote ("//")))
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/auto-save/" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backup"))))
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((substatement-open . 0))))
 '(column-number-mode t)
 '(cscope-do-not-update-database t)
 '(ecb-options-version "2.40")
 '(ecb-tip-of-the-day nil)
 '(egg-log-HEAD-max-len 100)
 '(follow-auto t)
 '(fringe-mode (quote (4 . 0)) nil (fringe))
 '(gdb-many-windows t)
 '(global-hl-line-mode t)
 '(ido-completion-buffer-all-completions t)
 '(ido-enable-tramp-completion nil)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(java-mode-hook (quote (cscope:hook)) t)
 '(mouse-avoidance-mode (quote animate) nil (avoid))
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("ELPA" . "http://tromey.com/elpa/") ("Marmalade" . "http://marmalade-repo.org/"))))
 '(recentf-max-saved-items 50)
 '(recentf-mode t)
 '(ropemacs-codeassist-maxfixes 10)
 '(ropemacs-guess-project t)
 '(ropemacs-max-doc-buffer-height 60)
 '(server-mode t)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tmm-mid-prompt "=>")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(visible-bell t)
 '(w3m-default-display-inline-images t)
 '(windmove-wrap-around t)
 '(x-select-enable-clipboard t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-selection-face ((t (:background "darkblue" :foreground "white"))))
 '(completions-first-difference ((t (:inherit bold :foreground "green"))))
 '(custom-button ((((type x w32 ns) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(custom-button-mouse ((((type x w32 ns) (class color)) (:background "grey90" :foreground "black" :box (:line-width 1 :style released-button)))))
 '(custom-button-pressed ((((type x w32 ns) (class color)) (:background "lightgrey" :foreground "black" :box (:line-width 1 :style pressed-button)))))
 '(egg-branch ((t (:inherit egg-header :foreground "Yellow" :height 150))))
 '(egg-header ((t (:weight bold :height 130))))
 '(egg-help-header-2 ((t (:inherit egg-text-1 :foreground "LightSteelBlue"))))
 '(egg-log-HEAD ((t (:background "grey20"))))
 '(egg-text-2 ((t (:inherit egg-text-base))))
 '(egg-text-base ((t (:inherit variable-pitch :foreground "dark cyan"))))
 '(egg-text-help ((t (:inherit egg-text-base))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "LightSkyBlue" :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "Cyan1" :weight bold))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :weight bold))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen" :weight bold))))
 '(fringe ((t (:background "grey35" :foreground "cyan"))))
 '(hl-line ((t (:inherit highlight :background "gray10"))))
 '(ido-first-match ((t (:foreground "green" :weight bold))))
 '(magit-diff-add ((t (:foreground "forest green"))))
 '(magit-item-highlight ((t (:background "gray15"))))
 '(mode-line ((t (:background "dark red" :foreground "white" :box (:line-width -1 :style released-button)))))
 '(mode-line-highlight ((t (:inverse-video t))))
 '(mode-line-inactive ((t (:inherit mode-line :background "darkblue"))))
 '(trailing-whitespace ((t (:background "gray50")))))

(push "~/.emacs.d" load-path)

(require 'xcscope)
(require 'egg)


;; (add-to-list 'load-path "~/.emacs.d/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;; (ac-config-default)


(load-file "~/.emacs.d/nxhtml/autostart.el")
(add-hook 'nxhtml-mode-hook
          '(lambda ()
             (make-variable-buffer-local 'yas/trigger-key)
             (setq yas/trigger-key [tab])))

(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory "/usr/share/emacs/etc/yasnippet/snippets")
(yas/define-snippets 'django-html-mumamo-mode nil 'html-mode)
(add-hook 'change-major-mode-hook 'yas/exit-all-snippets)



(defadvice tmm-add-one-shortcut (after color-tmm ())
  "Make tmm prompt with colors"
  (put-text-property 0 1 'face 'completions-first-difference
		     (car ad-return-value))
  (put-text-property 1 (1+ (length tmm-mid-prompt)) 'face 'shadow
		     (car ad-return-value)))
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'auto-mode-alist '("\\.bream\\'" . java-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(require 'pymacs)

(pymacs-load "ropemacs" "rope-")

(add-hook 'comint-output-filter-functions
	  'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt nil t)

(add-hook 'java-mode-hook (function cscope:hook))
(add-hook 'pike-mode-hook (function cscope:hook))

;(require 'w3m-load)
;(require 'mime-w3m)
;(require 'mew)


(require 'pike)
(setq auto-mode-alist
      (append '(("\\.pike$" . pike-mode)) auto-mode-alist))

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
(ac-config-default)

(require 'auto-complete-clang)
(setq clang-completion-suppress-error 't)
(defun clang-c-mode-common-hook()
  (make-variable-buffer-local 'ac-auto-start)
  (make-variable-buffer-local 'ac-expand-on-auto-complete)
  (make-variable-buffer-local 'ac-quick-help-delay)
  (setq ac-auto-start nil)
  (setq ac-expand-on-auto-complete nil)
  (setq ac-quick-help-delay 0.3)
  (define-key c-mode-base-map (kbd "s-/") 'ac-complete-clang))
(add-hook 'c-mode-common-hook 'clang-c-mode-common-hook)


(setq sdcv-dictionary-complete-list     ;星际译王的词典, 完全, 详细
      '("牛津英汉双解美化版"
        "英汉汉英专业词典"))


(require 'sdcv)

(global-set-key (kbd "<f12>") 'recentf-open-files)
;;(global-set-key (kbd "<f11>") (lambda () (interactive)(w32-send-sys-command 61488)))
(global-set-key (kbd "<f7>") 'compile)
(global-set-key [C-tab] 'other-window)
(global-set-key [C-S-tab] (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "s-c d") 'sdcv-search-pointer)
(define-key ropemacs-local-keymap (kbd "M-/") nil)
(define-key ropemacs-local-keymap (kbd "s-/") 'rope-code-assist)
;(global-set-key (kbd "s-/") 'rope-code-assist)
(global-set-key (kbd "s-b") 'windmove-left)
(global-set-key (kbd "s-f") 'windmove-right)
(global-set-key (kbd "s-n") 'windmove-down)
(global-set-key (kbd "s-p") 'windmove-up)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-O") (lambda () (interactive)(other-window -1)))

