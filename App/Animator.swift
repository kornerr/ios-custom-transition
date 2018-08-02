
import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning
{

    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {

    }

    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return 0
    }

}

