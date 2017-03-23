import UIKit
import MapKit

class MapViewNavigationController: UINavigationController
{
    var mapVC = MapViewController()
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setupMapVC()
        
        let image = UIImage(imageLiteralResourceName: ImageName.marker.rawValue)
        tabBarItem = UITabBarItem(title: TitleConstant.mapVC.rawValue, image:image, selectedImage: nil)
        
        navigationBar.barStyle = .blackOpaque
        navigationBar.barTintColor = #colorLiteral(red: 0.4588235294, green: 0.3960784314, blue: 0.5254901961, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMapVC()
    {
        pushViewController(mapVC, animated: false)
        
        let latDelta = 0.0045
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        let center = Coordinates.ApplePark
        
        mapVC.centerMap(at: center, withSpan: span)
    }
}
