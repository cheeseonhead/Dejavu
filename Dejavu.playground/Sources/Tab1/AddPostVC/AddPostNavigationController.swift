import UIKit

class AddPostNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.pushViewController(AddPostViewController(), animated: false)
        
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = #colorLiteral(red: 0.4588235294, green: 0.3960784314, blue: 0.5254901961, alpha: 1)
        navigationBar.tintColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
