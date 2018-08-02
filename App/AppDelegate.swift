
import UIKit

private func LOG(_ message: String)
{
    NSLog("AppDelegate \(message)")
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    // MARK: - SETUP

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        // Create window.
        self.window = UIWindow(frame: UIScreen.main.bounds)

        self.setupApplication()

        // Display window.
        self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        return true
    }

    // MARK: - APPLICATION

    private var charactersView: CharactersView!
    private var charactersVC: UIViewController!
    private var animatorController: AnimatorController!
    
    private func setupApplication()
    {        
        self.charactersView = UIView.loadFromNib()
        self.charactersVC = UIViewControllerTemplate<CharactersView>(mainView: self.charactersView)
        let nc = UINavigationController(rootViewController: self.charactersVC)
        self.window!.rootViewController = nc

        self.animatorController = AnimatorController()
        nc.delegate = self.animatorController

        self.setupItems()
        self.setupDetailsDisplay()
    }

    private func setupItems()
    {
        // NOTE Images represent MassEffect races: http://masseffect.wikia.com/wiki/Races
        let races = [
            "asari",
            "drell",
            "elcor",
            "hanar",
            "humans",
            "keepers",
            "salarians",
            "turians",
            "volus"
        ]
        self.charactersView.items =
            races.map {
                let imageName = "race.\($0).png"
                let image = UIImage(named: imageName)!
                return CharactersItem(image)
            }
    }

    private func setupDetailsDisplay()
    {
        // Display details upon item selection.
        self.charactersView.selectedItemChanged = { [weak self] in
            self?.displayDetails()
        }
    }

    private func displayDetails()
    {
        // Construct details.
        let characterView: CharacterView! = UIView.loadFromNib()
        let itemId = self.charactersView.selectedItemId
        let item = self.charactersView.items[itemId]
        characterView.image = item.image
        
        // Wrap them in VC.
        let vc = UIViewControllerTemplate<CharacterView>(mainView: characterView)
        vc.view.backgroundColor = .white

        // Display them.
        self.charactersVC.show(vc, sender: nil)
    }

}

