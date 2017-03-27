import Foundation
import MapKit

struct AppStyle
{
    static let PostListNavColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.5333333333, alpha: 1)
    static let MapNavColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.5333333333, alpha: 1)
    static let ScrollBackgroundColor = #colorLiteral(red: 0, green: 0.4117647059, blue: 0.3607843137, alpha: 1)
    static let TabBarTintColor = #colorLiteral(red: 0, green: 0.5882352941, blue: 0.5333333333, alpha: 1)
    static let PostListBackgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9667458522, blue: 0.9514267534, alpha: 1)
}

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
    case rightInCircle = "rightInCircle.png"
    case applePark = "appleParkInside.jpg"
    case cafetaria = "cafe.jpg"
    case bus = "bus.jpg"
    case dinner = "dinner.jpg"
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

func offSetLittle(orig: CLLocationCoordinate2D) -> CLLocationCoordinate2D
{
    return CLLocationCoordinate2D(latitude: orig.latitude + 0.0001, longitude: orig.longitude + 0.0001)
}

struct DummyData
{
    static var existingPosts = [
        Post(title: "White Hallway", description: "I looked around me, there were pale white walls on both sides of the hallway. I raised my head, and saw a little window. The moon was shining brightly, and windowsills casted a cross shadow on the floor. I swear I've dreamt this before.",date: Post.dateFormatter.date(from: "2014-09-08 22:56")!, image: UIImage(named: ImageName.moonWindow.rawValue), location: offSetLittle(orig: Coordinates.WesleyGHS)),
        
        Post(title: "Yelling Man", description: "Walking from one session to another. There was this man wearing glasses, and a notebook in his left hand walking down in my direction. He seems to be in a hurry. He wanted to check time, so he took out his phone. I sense I've seen this before.",date: Post.dateFormatter.date(from: "2016-06-09 12:29")!, image: UIImage(named: ImageName.applePark.rawValue), location: offSetLittle(orig: Coordinates.ApplePark)),
        
        Post(title: "Mutual Deja Vu", description: "I was a waiter at the cafetaria. When I was serving a customer, I asked what he wanted. Then a sudden feeling of Deja vu happened. The customer and I looked at eachother and both said, \"Deja vu!\" It was an interesting experience.",date: Post.dateFormatter.date(from: "2015-03-25 18:56")!, image: UIImage(named: ImageName.cafetaria.rawValue), location: offSetLittle(orig: Coordinates.InfiniteLoop3)),
        
        Post(title: "Bus", description: "I sat on the first row of the bus, so I see and hear everything the driver has to say to each of the passengers getting on. Then one passenger beeped his card, it didn't go through. I looked at the passenger's face, he was frowning, then I heard the driver saying, \"It's ok\". He let the passenger on. I suddenly felt like I've seen this before. I moved to the back, because it was creeping me out.",date: Post.dateFormatter.date(from: "2016-12-25 13:21")!, image: UIImage(named: ImageName.bus.rawValue), location: offSetLittle(orig: Coordinates.InfiniteLoop1)),
        
        Post(title: "Lunch", description: "I was at lunch with two of my friends, they were chatting. And suddenly I felt like I've experienced this before. The sign of the restaurant was in the same place, and what they said was exactly the same!",date: Post.dateFormatter.date(from: "2010-12-25 16:21")!, image: UIImage(named: ImageName.dinner.rawValue), location: offSetLittle(orig: Coordinates.InfiniteLoop5))
    ]
}
