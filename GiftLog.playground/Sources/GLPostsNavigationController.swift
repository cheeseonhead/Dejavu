import UIKit

class GLPostsNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let image = UIImage(imageLiteralResourceName: "SavingBook.png")
        self.tabBarItem = UITabBarItem(title: "Dejavus", image:image, selectedImage: nil)
        
        self.navigationBar.barStyle = .blackOpaque
        self.navigationBar.barTintColor = #colorLiteral(red: 0.4588235294, green: 0.3960784314, blue: 0.5254901961, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
