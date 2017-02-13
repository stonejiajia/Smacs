;;; feature/version-control/+git.el

(@def-package gitconfig-mode
  :mode "/\\.?git/?config$"
  :mode "/\\.gitmodules$"
  :init (add-hook 'gitconfig-mode-hook 'flyspell-mode))

(@def-package gitignore-mode
  :mode "/\\.?git/?config$"
  :mode "/\\.gitmodules$")


(@def-package git-gutter-fringe
  :commands git-gutter-mode
  :init (@add-hook (text-mode prog-mode conf-mode) 'git-gutter-mode)
  :config
  (@set :popup "^\\*git-gutter.+\\*$" :regexp t :size 15 :noselect t)

  ;; Update git-gutter on focus (in case I was using git externally)
  (add-hook 'focus-in-hook 'git-gutter:update-all-windows)

  (@after evil
    ;; Refreshing git-gutter on ESC
    (advice-add 'evil-force-normal-state :after 'git-gutter)))


(@def-package browse-at-remote
  :commands (browse-at-remote/browse browse-at-remote/get-url))


(@def-package magit
  :commands magit-status
  :config
  (@set :popup "^\\*magit.+" :regexp t)

  (@after evil
    (require 'evil-magit)
    ;; evil-snipe conflicts with magit
    (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)))
