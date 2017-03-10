import UIKit
import MapKit


class MapViewController: UIViewController
{
    var mapView: MKMapView = {
        return MKMapView()
    }()
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        print("view controller")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        
        view.addSubview(mapView)
        mapView.frame = view.bounds
        
        let topLeft = CLLocationCoordinate2D(latitude: 34.4311, longitude: -118.6012)
        let topRight = CLLocationCoordinate2D(latitude: 34.4311, longitude: -118.5912)
        let bottomLeft = CLLocationCoordinate2D(latitude: 34.4194, longitude: -118.6012)
        let bottomRight = CLLocationCoordinate2D(latitude: 34.4194, longitude: -118.5912)
        
        let latDelta = topLeft.latitude - bottomRight.latitude
        
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        
        let toronto = CLLocationCoordinate2D(latitude: 43.6532, longitude: -79.3832)
        
        let region = MKCoordinateRegionMake(toronto, span)
        
        mapView.region = region
    }
}
