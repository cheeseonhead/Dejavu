import UIKit
import MapKit


protocol MapViewControllerDelegate: class
{
    func posts() -> [Post]
}


class MapViewController: UIViewController, MKMapViewDelegate
{
    var initialSetup = true
    var allowsCallout = true
    weak var delegate: MapViewControllerDelegate?
    
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
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        mapView.removeAnnotations(mapView.annotations)
        addAnnotations(from: delegate?.posts() ?? [])
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
        if annotation is MKUserLocation {
            return nil
        }
        
        guard let postAnnotation = annotation as? PostAnnotation else { return nil }
        
        let identifier = "PostAnnotation"
        var postAnnotationView: PostAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? PostAnnotationView
        if postAnnotationView == nil {
            postAnnotationView = PostAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        } else {
            postAnnotationView!.annotation = annotation
        }
        
        postAnnotationView?.imageView.image = postAnnotation.thumbNail
        postAnnotationView?.delegate = self
        postAnnotationView?.canShowCallout = allowsCallout
        
        return postAnnotationView
    }
}

extension MapViewController
{
    func setupMapView()
    {   
    }
    
    func centerMap(at center:CLLocationCoordinate2D, withSpan span:MKCoordinateSpan)
    {
        let region = MKCoordinateRegionMake(center, span)
        
        mapView.region = region
    }
    
    func addAnnotations(from posts: [Post])
    {
        for post in posts {
            let annotation = PostAnnotation.init(post: post)
            
            mapView.addAnnotation(annotation)
        }
    }
}

extension MapViewController: PostAnnotationViewDelegate
{
    func detailButtonTapped(view: PostAnnotationView)
    {
        let viewPostViewController = ViewPostViewController(nibName: nil, bundle: nil)
        viewPostViewController.post = (view.annotation as! PostAnnotation).post
        viewPostViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewPostViewController, animated: true)
    }
}
