import UIKit

class GLPostsNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(GLPostCollectionViewController(), animated: false)
        
        let image = UIImage(imageLiteralResourceName: ImageName.savingBook.rawValue)
        self.tabBarItem = UITabBarItem(title: TitleConstant.postListVC.rawValue, image:image, selectedImage: nil)
        
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
