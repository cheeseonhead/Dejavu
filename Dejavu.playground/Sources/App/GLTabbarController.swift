import UIKit
import MapKit

public class GLTabBarController: UITabBarController
{
    public var showPopup: Bool = false
    var postSortedByDistance: [Post]!
    
    override public func viewDidLoad() {
        postSortedByDistance = postsSortedInDistanceOrder(posts: DummyData.existingPosts)
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        UITabBar.appearance().backgroundImage = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).as1ptImage()
        UITabBar.appearance().shadowImage = #colorLiteral(red: 0.831372549, green: 0.831372549, blue: 0.831372549, alpha: 1).as1ptImage()
        
        setBackColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        setTintColor(color: AppStyle.TabBarTintColor)
        
        let vc1 = GLPostsNavigationController.init(nibName: nil, bundle: nil)
        let vc2 = MapViewNavigationController.init(nibName: nil, bundle: nil)
        self.viewControllers = [vc1, vc2]
        self.selectedViewController = vc1
    }
    
    public override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if (showPopup) {
            let alertVC = AlertViewController()
            alertVC.post = postSortedByDistance[0]
            alertVC.modalPresentationStyle = .overFullScreen
            present(alertVC, animated: true, completion: nil)
            showPopup = false
        }
    }

    func postsSortedInDistanceOrder(posts: [Post]) -> [Post]
    {
        let result = posts.sorted(by: postSortByDistance)
        
        return result
    }
    
    func postSortByDistance(_ post1: Post, _ post2: Post) -> Bool
    {
        let current = CLLocation(latitude: Coordinates.CurrentLocation.latitude, longitude: Coordinates.CurrentLocation.longitude)
        let loc1 = CLLocation(latitude: post1.location.latitude, longitude: post1.location.longitude)
        let loc2 = CLLocation(latitude: post2.location.latitude, longitude: post2.location.longitude)
        
        return loc1.distance(from: current) < loc2.distance(from: current)
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
