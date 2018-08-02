
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

    private func setupApplication()
    {        
        self.charactersView = UIView.loadFromNib()
        let vc = UIViewControllerTemplate<CharactersView>(mainView: self.charactersView)
        let nc = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nc

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
        // Subscribe to selection reports.
        self.charactersView.selectedItemChanged = { [weak self] in
            guard let this = self else { return }
            LOG("Selected item: '\(this.charactersView.selectedItemId)'")
        }
    }

}

