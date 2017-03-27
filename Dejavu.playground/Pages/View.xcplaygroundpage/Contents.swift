import PlaygroundSupport
/*:
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 ****
 # Viewing **Déjà vus** by List
 
 - Important: Please remember to switch to *Timeline* on the right hand side so you can see the app in action!
 
    If the simulator does not show up, you could try restarting XCode and reopening the project.
 
 The app is centered around your **Déjà vu**s, so the most important function is to allow the user to view them, otherwise how are you going to see if it already happened before?
 
 On the right hand side you can see a list of your **Déjà vu**s, including their *Title*, *Date*, *Description*, and *ThumbNail*. They are sorted by the distance to your current location from the closest to furthest.
 
 Viewing an entry is as easy as tapping on one. It will take you to a scene with beautiful card design, and all the information about the **Déjà vu** is there ready for you, including the previously omitted: *location*.
 
 You can try changing the current location to any of the preset ones, or you can change it to a custom `CLLocationCoordinate2D` coordinate.
 */
Coordinates.CurrentLocation = Coordinates.ApplePark
/*:
 Available Locations:
 - `InfiniteLoop1`: The Apple Infinite Loop
 - `InfiniteLoop2`: Infinite Loop 2
 - `InfiniteLoop3`: Infinite Loop 3
 - `InfiniteLoop5`: Infinite Loop 5
 - `ApplePark`: Apple Inc.
 - `WesleyGHS`: An all girl high school in Taiwan
 
 ****
 When it's not enough to just view them in a list, click [Next](@next)
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 */
PlaygroundPage.current.liveView = GLTabBarController()
