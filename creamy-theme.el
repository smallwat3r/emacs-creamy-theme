;;; creamy-theme.el --- A simple creamy theme with light and dark variants  -*- lexical-binding: t -*-

;; Copyright (C) 2022 Matthieu Petiteau <mpetiteau.pro@gmail.com>

;; Homepage: https://github.com/smallwat3r/emacs-creamy-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.1"))
;; Licence: GPL-3.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A simple creamy theme with light and dark variants.

;;; Code:

(deftheme creamy "A simple creamy theme with light and dark variants.")

(require 'creamy-theme-light)
(require 'creamy-theme-dark)

(defun creamy-theme-load ()
  "Load the creamy theme variant."
  (let ((theme (if (eq creamy-theme-variant 'dark)
                   'creamy-dark
                 'creamy-light)))
    (load-theme theme t)))

(defcustom creamy-theme-variant 'light
  "The variant of the creamy theme to use."
  :type '(choice (const :tag "Light" light)
                 (const :tag "Dark" dark))
  :group 'creamy
  :set (lambda (symbol value)
         (set-default symbol value)
         (creamy-theme-load)))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'creamy)

(provide 'creamy-theme)

;;; creamy-theme.el ends here
