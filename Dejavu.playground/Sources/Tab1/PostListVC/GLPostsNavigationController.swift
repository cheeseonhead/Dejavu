import UIKit

class GLPostsNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(GLPostCollectionViewController(), animated: false)
        
        let image = UIImage(imageLiteralResourceName: ImageName.savingBook.rawValue)
        self.tabBarItem = UITabBarItem(title: TitleConstant.postListVC.rawValue, image:image, selectedImage: nil)
        
        navigationBar.barStyle = .default
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.tintColor = #colorLiteral(red: 0.5333333333, green: 0.5333333333, blue: 0.5333333333, alpha: 1)
        navigationBar.setBackgroundImage(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).as1ptImage(), for: .default)
        navigationBar.shadowImage = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1).as1ptImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
