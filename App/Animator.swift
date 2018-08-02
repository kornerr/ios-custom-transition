
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning
{

    let duration = 1.0
    var presenting = true
    var originFrame = CGRect.zero

    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        // Make sure we have target view.
        guard
            let targetView = transitionContext.view(forKey: .to)
        else
        {
            return
        }

        let containerView = transitionContext.containerView
        containerView.addSubview(targetView)
        targetView.alpha = 0
        UIView.animate(
            withDuration: self.duration,
            animations: {
                targetView.alpha = 1
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

