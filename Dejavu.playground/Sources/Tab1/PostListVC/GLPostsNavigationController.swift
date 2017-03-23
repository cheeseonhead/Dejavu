import UIKit

class GLPostsNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(GLPostCollectionViewController(), animated: false)
        
        let image = UIImage(imageLiteralResourceName: ImageName.savingBook.rawValue)
        self.tabBarItem = UITabBarItem(title: TitleConstant.postListVC.rawValue, image:image, selectedImage: nil)
        
        navigationBar.barStyle = .blackTranslucent
        navigationBar.barTintColor = #colorLiteral(red: 0.9098039216, green: 0.9490196078, blue: 0.9921568627, alpha: 1)
        navigationBar.tintColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
