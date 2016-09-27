; This Emacs mode is largely derived from Journal mode created by
; Ken Fisler. The original is available on this website:
;
; https://www.emacswiki.org/emacs/Journal
;
; However, this mode has been modified and very much simplified
; from what there is in Journal mode. It matches quite peculiar
; niche and I'm not certain if there are many people who actually
; want to make their notes like this. There are additional
; difficulties, for example, one would probably need to be in
; another room while making notes since typing is loud and
; disturbing in the end. However, maybe there are nowadays some
; keyboards which are so quiet
;
; (load "langdoc")
; (if (file-directory-p "~/whereever/you/store/notes")
;                          (setq-default langdoc-dir "~/wherever/you/store/notes"))
;
; Put this entire file into ".emacs.d/langdoc.el/langdoc.el" or somewhere in emacs' path.

(defun langdoc (filename)
  "Open a text file named after language iso-code and today's date, format finYYYY-MM-DD-1,
in subdirectory named in variable langdoc-dir, set in ~/.emacs, else in $HOME."
  (interactive
   (progn
     (setq default-directory langdoc-dir)
     (setq filename (concat "kpv_izva" (format-time-string "%Y-%m-%d-%a") ".csv"))
     (list (read-file-name
        "Create language documentation note file: " langdoc-dir filename nil filename))
     ))
  (find-file filename)
  (insert "---
session_number: 
session_location: 
tags: []
participants: []
ids: []
roles: []
comment: 
---")
  (insert (newline))
)



(defun now ()
  "Insert string for the current time formatted like '2:34 PM'."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%T.%4N"))
)

(defun langdoc-bio-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "BIOGRAPHY")
  )

(defun langdoc-topo-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "TOPONYMY")
  )

(defun langdoc-palsib-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "PHON: PALATALIZED SIBILANT")
  )

(defun langdoc-ethn-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "ETHNOGRAPHY")
  )

(defun langdoc-story-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "STORY")
  )

(defun langdoc-languace-contact-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "LANGUAGE CONTACT")
  )

(defun langdoc-saami-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "CONTACT WITH SAAMI")
  )

(defun langdoc-song-start-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "SONG START")
  )

(defun langdoc-song-end-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "SONG END")
  )

(defun langdoc-part-shift-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "MAJOR THEMATIC SHIFT")
  )

(defun langdoc-sensorized-tag ()
  (interactive)
  (timestamp-ld-notes)
  (insert "EVALUATED WHETHER SHOULD BE SENSORIZED")
  )

(defun timestamp-ld-notes ()
  "Insert newline and timestamp in sequence."
  (interactive)
  (end-of-buffer)
  (newline)
  (now)
  (tab-to-tab-stop))

(defvar ld-notes-mode-map (make-sparse-keymap)
  "Keymap while temp-mode is active.")

;;;###autoload
(define-minor-mode ld-notes-mode
  "A temporary minor mode to be activated only specific to a buffer."
  nil
  :lighter " Temp"
    ld-notes-mode-map)

(define-key ld-notes-mode-map (kbd "RET") 'timestamp-ld-notes)
(define-key ld-notes-mode-map (kbd "<kp-1>") 'langdoc-bio-tag)
(define-key ld-notes-mode-map (kbd "<kp-2>") 'langdoc-topo-tag)
(define-key ld-notes-mode-map (kbd "<kp-3>") 'langdoc-ethn-tag)
(define-key ld-notes-mode-map (kbd "<kp-4>") 'langdoc-story-tag)
(define-key ld-notes-mode-map (kbd "<kp-5>") 'langdoc-language-contact-tag)
(define-key ld-notes-mode-map (kbd "<kp-6>") 'langdoc-saami-tag)
(define-key ld-notes-mode-map (kbd "<kp-7>") 'langdoc-song-start-tag)
(define-key ld-notes-mode-map (kbd "<kp-8>") 'langdoc-song-end-tag)
(define-key ld-notes-mode-map (kbd "<kp-9>") 'langdoc-part-shift-tag)
(define-key ld-notes-mode-map (kbd "<kp-0>") 'langdoc-sensorized-tag)
;;(define-key ld-notes-mode-map (kbd "<kp-8>") 'langdoc-topo-tag)
;;(define-key ld-notes-mode-map (kbd "<kp-8>") 'langdoc-topo-tag)

(provide 'ld-notes-mode)

;; (global-set-key (kbd "RET") 'langdoc-timestamp)

