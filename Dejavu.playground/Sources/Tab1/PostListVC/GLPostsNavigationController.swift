import UIKit

class GLPostsNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(GLPostCollectionViewController(), animated: false)
        
        let image = UIImage(imageLiteralResourceName: ImageName.savingBook.rawValue)
        self.tabBarItem = UITabBarItem(title: TitleConstant.postListVC.rawValue, image:image, selectedImage: nil)
        
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
//        navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationBar.setBackgroundImage(AppStyle.PostListNavColor.as1ptImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
