import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate
{
    var initialSetup = true
    
    var mapView: MKMapView = {
        let mapV = MKMapView()
        return mapV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        self.navigationItem.title = TitleConstant.mapVC.rawValue
        
        mapView.delegate = self
        view.addSubview(mapView)
        addAnnotations(from: DummyData.existingPosts)
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        
        mapView.frame = view.bounds
        
        if(initialSetup) {
            setupMapView()
            initialSetup = false
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        let postAnnotationView = PostAnnotationView(annotation: annotation, reuseIdentifier: "Post")
        postAnnotationView.canShowCallout = true
        return postAnnotationView
    }
}

fileprivate extension MapViewController
{
    func setupMapView()
    {
        let latDelta = 0.0117
        let span = MKCoordinateSpanMake(fabs(latDelta), 0.0)
        let center = Coordinates.ApplePark
        
        centerMap(at: center, withSpan: span)
    }
    
    func centerMap(at center:CLLocationCoordinate2D, withSpan span:MKCoordinateSpan)
    {
        let region = MKCoordinateRegionMake(center, span)
        
        mapView.region = region
    }
    
    func addAnnotations(from posts: [Post])
    {
        for post in posts {
            let annotation = PostAnnotation.init(coordinate: post.location, title: post.title, subtitle: post.description)
            
            mapView.addAnnotation(annotation)
        }
    }
}
