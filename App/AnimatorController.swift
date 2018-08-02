
import UIKit

class AnimatorController: NSObject, UINavigationControllerDelegate
{

    let transition = Animator()

    func navigationController(
        _ navigationController: UINavigationController,
        animationControllerFor operation: UINavigationControllerOperation,
        from fromVC: UIViewController,
        to toVC: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {

        if operation == .push
        {
            return transition
        }
        // TODO Support .pop

        return nil
    }

}

