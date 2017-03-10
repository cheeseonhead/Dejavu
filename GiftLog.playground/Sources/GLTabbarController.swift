import UIKit

public class GLTabBarController: UITabBarController
{
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false
        
        setBackColor(color: #colorLiteral(red: 0.862745098, green: 0.8431372549, blue: 0.7215686275, alpha: 1))
        setTintColor(color: #colorLiteral(red: 0.2099874318, green: 0.3203630447, blue: 0.3499233723, alpha: 1))
        
        let vc1 = GLPostsNavigationController.init(nibName: nil, bundle: nil)
        self.viewControllers = [vc1]
    }
    
    public func setBackColor(color: UIColor)
    {
        self.tabBar.barTintColor = color
    }
    
    public func setTintColor(color: UIColor)
    {
        self.tabBar.tintColor = color
    }
}
