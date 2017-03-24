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
        navigationBar.barTintColor = AppStyle.MapNavColor
        navigationBar.tintColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMapVC()
    {
        mapVC.delegate = self
        pushViewController(mapVC, animated: false)
        
        let latDelta = 0.0045
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        let center = Coordinates.CurrentLocation
        
        mapVC.centerMap(at: center, withSpan: span)
    }
}

extension MapViewNavigationController: MapViewControllerDelegate
{
    func posts() -> [Post]
    {
        return DummyData.existingPosts
    }
}
