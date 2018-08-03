
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning
{

    let duration = 0.3
    var presenting = true
    var originFrame = CGRect.zero

    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        // Make sure we have target and source views.
        guard
            let targetView = transitionContext.view(forKey: .to),
            let sourceView = transitionContext.view(forKey: .from)
        else
        {
            return
        }

        let detailsView =
            self.presenting ? 
            targetView :
            sourceView

        let sourceFrame =
            self.presenting ?
            self.originFrame :
            detailsView.frame
        let targetFrame =
            self.presenting ?
            detailsView.frame :
            self.originFrame

        let xScaleFactor =
            self.presenting ?
            sourceFrame.width / targetFrame.width :
            targetFrame.width / sourceFrame.width
        let yScaleFactor =
            self.presenting ?
            sourceFrame.height / targetFrame.height :
            targetFrame.height / sourceFrame.height
            

        let scaleTransform =
            CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

        if self.presenting
        {
            detailsView.transform = scaleTransform
            detailsView.center =
                CGPoint(x: sourceFrame.midX, y: sourceFrame.midY)
            detailsView.clipsToBounds = true
        }

        let containerView = transitionContext.containerView
        containerView.addSubview(targetView)
        containerView.bringSubview(toFront: detailsView)


        // Reset visibility.
        detailsView.alpha =
            self.presenting ?
            0 :
            1

        UIView.animate(
            withDuration: self.duration,
            animations: {
                // Scale.
                detailsView.transform =
                    self.presenting ?
                    CGAffineTransform.identity :
                    scaleTransform
                detailsView.center =
                    CGPoint(x: targetFrame.midX, y: targetFrame.midY)

                // Make (in)visible.
                detailsView.alpha =
                    self.presenting ?
                    1 :
                    0
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
    }

    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return self.duration
    }

}

