import UIKit

class MapViewNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("nav controller")
        pushViewController(MapViewController.init(nibName: nil, bundle: nil), animated: false)
        
        let image = UIImage(imageLiteralResourceName: ImageName.marker.rawValue)
        tabBarItem = UITabBarItem(title: TitleConstant.mapVC.rawValue, image:image, selectedImage: nil)
        
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = #colorLiteral(red: 0.4588235294, green: 0.3960784314, blue: 0.5254901961, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
