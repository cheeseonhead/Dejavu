import PlaygroundSupport
/*:
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 ****
 # Viewing **Déjà vus** by Map
 
 - Important: Please remember to switch to *Timeline* on the right hand side so you can see the app in action!
 
    If the simulator does not show up, you could try restarting XCode and reopening the project.
 
    The map sometimes doesn't show the location names, a recompile might fix it.
 
 Sometimes you would like to view the entries from a different point of view. And since **Déjà vu**s are location sensitive, we provide another way to view them.
 
 On the right hand side, the `Map` tab is selected for you, each annotation you see represents a **Déjà vu**, you can touch the annotation to see a preview of it, them tap the right arrow to view the entry in its full form. The map is centered at where you are currently.
 
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
 When you are ready to see how the app asks you about a **Déjà vu**, click [Next](@next)
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 */
let tabBar = GLTabBarController()
tabBar.selectedIndex = 1
PlaygroundPage.current.liveView = tabBar
