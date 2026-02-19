;; ────────────────────────────────────────
;; VouchFor v1.0.0
;; Author: solidworkssa
;; License: MIT
;; ────────────────────────────────────────

(define-constant VERSION "1.0.0")

;; Error codes
(define-constant ERR-NOT-AUTHORIZED (err u401))
(define-constant ERR-NOT-FOUND (err u404))
(define-constant ERR-ALREADY-EXISTS (err u409))
(define-constant ERR-INVALID-INPUT (err u422))

;; VouchFor Clarity Contract
;; Social vouching and trust network graph.


(define-map vouches {voucher: principal, vouched: principal} bool)
(define-map vouch-count principal uint)

(define-public (vouch (for principal))
    (let ((count (default-to u0 (map-get? vouch-count for))))
        (map-set vouches {voucher: tx-sender, vouched: for} true)
        (map-set vouch-count for (+ count u1))
        (ok true)
    )
)

