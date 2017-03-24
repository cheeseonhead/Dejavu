import UIKit

public class GLTabBarController: UITabBarController
{
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundImage = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).as1ptImage()
        UITabBar.appearance().shadowImage = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1).as1ptImage()
        
        setBackColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        setTintColor(color: #colorLiteral(red: 0.2099874318, green: 0.3203630447, blue: 0.3499233723, alpha: 1))
        
        let vc1 = GLPostsNavigationController.init(nibName: nil, bundle: nil)
        let vc2 = MapViewNavigationController.init(nibName: nil, bundle: nil)
        self.viewControllers = [vc1, vc2]
        self.selectedViewController = vc1
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
