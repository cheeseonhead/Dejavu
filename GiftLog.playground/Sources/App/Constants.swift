import Foundation
import MapKit

enum Padding: CGFloat
{
    typealias RawValue = CGFloat

    case edgePadding = 8
}

enum TitleConstant: String
{
    case mapVC = "Map"
    case postListVC = "Déjà vu"
}

enum ImageName: String
{
    case marker = "Marker.png"
    case savingBook = "SavingBook.png"
    case winter = "winter-solstice.jpg"
    case dog = "dog.jpg"
    case camera = "camera.png"
    case placeHolder = "placeholder.png"
    case moonWindow = "moon-window.jpg"
}

public struct Coordinates
{
    public static let ApplePark = CLLocationCoordinate2D(latitude: 37.331863, longitude: -122.029524)
    public static let InfiniteLoop1 = CLLocationCoordinate2D(latitude: 37.331413, longitude: -122.030484)
    public static let InfiniteLoop2 = CLLocationCoordinate2D(latitude: 37.33270825, longitude: -122.03030010)
    public static let InfiniteLoop3 = CLLocationCoordinate2D(latitude: 37.33311010, longitude: -122.02941910)
    public static let InfiniteLoop5 = CLLocationCoordinate2D(latitude: 37.331660, longitude: -122.028961)
    public static let WesleyGHS = CLLocationCoordinate2D(latitude: 25.10166290, longitude: 121.55225400)
    public static let Studio65 = CLLocationCoordinate2D(latitude: 43.649094, longitude: -79.388503)
    public static var CurrentLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 37.331863, longitude: -122.029524)
}

struct DummyData
{
    static var existingPosts = [
        Post(title: "White Hallway", description: "I looked around me, there were pale white walls on both sides of the hallway. I raised my head, and saw a little window. The moon was shining brightly, and windowsills casted a cross shadow on the floor. I swear I've dreamt this before.",date: Post.dateFormatter.date(from: "2014-09-08 22:56")!, image: UIImage(named: ImageName.moonWindow.rawValue), location: Coordinates.WesleyGHS),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.dog.rawValue), location: Coordinates.InfiniteLoop2),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop3),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop1),
        Post(title: "Tim Cook", description: "I was walking around and saw Tim getting water, then he raised his head and smiled at me. We were 100 meters apart.",date: Post.dateFormatter.date(from: "2017-03-25 18:56")!, image: UIImage(named: ImageName.winter.rawValue), location: Coordinates.InfiniteLoop1)
    ]
}
