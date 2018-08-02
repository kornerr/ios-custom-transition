
// Topic: Navigation controller custom transition animation
// Source: https://stackoverflow.com/a/26569703/3404710

import UIKit

class AnimatorController: NSObject, UINavigationControllerDelegate
{

    private let transition = Animator()

    var originFrame = CGRect.zero
    {
        didSet
        {
            self.transition.originFrame = self.originFrame
        }
    }

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationControllerOperation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        self.transition.presenting = (operation == .push)
        return self.transition
    }

}

