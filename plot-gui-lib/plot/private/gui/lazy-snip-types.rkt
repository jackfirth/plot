#lang typed/racket/base

(require (only-in typed/mred/mred Snip% Frame% Bitmap%)
         plot/utils)

(provide (all-defined-out))

(define-type Plot-Snip% (Class #:implements Snip% #:implements Plot-Metrics<%>))

(define-type Make-2D-Plot-Snip
  (-> (Instance Bitmap%)
      Plot-Parameters
      (-> Boolean Rect Positive-Integer Positive-Integer
          (Values (Instance Bitmap%) (U #f (Instance 2D-Plot-Area%))))
      Rect
      (U #f (Instance 2D-Plot-Area%))
      Positive-Integer
      Positive-Integer
      (Instance Plot-Snip%)))

(define-type Make-3D-Plot-Snip
  (-> (Instance Bitmap%)
      Plot-Parameters
      (-> Boolean Real Real Positive-Integer Positive-Integer
          (Values (Instance Bitmap%) (U #f (Instance 3D-Plot-Area%))))
      Real
      Real
      (U #f (Instance 3D-Plot-Area%))
      Positive-Integer
      Positive-Integer
      (Instance Plot-Snip%)))

(define-type Make-Snip-Frame
  (-> (-> Positive-Integer Positive-Integer (Instance Snip%))
      Positive-Real
      Positive-Real
      String
      (Instance Frame%)))
