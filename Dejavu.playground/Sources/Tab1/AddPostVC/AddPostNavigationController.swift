import UIKit

class AddPostNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(AddPostViewController(), animated: false)
        
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = AppStyle.PostListNavColor
        navigationBar.tintColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
