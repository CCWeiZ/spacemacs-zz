;;; packages.el --- zz layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: zz <zz@zz-VirtualBox>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zz-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zz/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zz/pre-init-PACKAGE' and/or
;;   `zz/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zz-packages
  '(
    cc-mode
    rtags
    cmake-ide
    )
  "The list of Lisp packages required by the zz layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun zz/post-init-cc-mode()
  (progn
    (setq company-backends-c-mode-common '((company-dabbrev-code :with company-keywords company-gtags company-etags) company-files company-dabbrev))
    (spacemacs/set-leader-keys-for-major-mode 'c++-mode "gd" 'etags-select-find-tag-at-point)
    ;;(add-hook 'c++-mode-hook 'my-setup-develop-environment)
    ;;(add-hook 'c-mode-hook 'my-setup-develop-environment)
    (setq c-default-style "linux")
    (setq c-basic-offset 4)
    ))
;;; packages.el ends here
