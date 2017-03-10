import UIKit

class MapViewNavigationController: UINavigationController
{
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("nav controller")
        pushViewController(MapViewController.init(nibName: nil, bundle: nil), animated: false)
        
        let image = UIImage(imageLiteralResourceName: "Marker.png")
        tabBarItem = UITabBarItem(title: "Map", image:image, selectedImage: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
