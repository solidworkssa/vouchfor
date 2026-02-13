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

