import PlaygroundSupport
/*:
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 ****
 # Adding **Déjà vu**s
 
 - Important: Please remember to switch to *Timeline* on the right hand side so you can see the app in action!
 
    If the simulator does not show up, you could try restarting XCode and reopening the project.
 
 When you don't see an entry that resembles your situation (which is a good thing), you can tap the plus sign on the top right of the screen, it will take you to the add entry screen.
 
 You can input the *title*, *description*, and change the *thumbnail* of your entry. The *date* and *location* are automatically determined for you.
 
 - Note: The thumbnail feature is not practical to implement in playground, so it was omitted in the demonstration
 
 You can try changing the current location to any of the preset ones, or you can change it to a custom `CLLocationCoordinate2D` coordinate.
 */
Coordinates.CurrentLocation = Coordinates.WesleyGHS
/*:
 Available Locations:
 - `InfiniteLoop1`: The Apple Infinite Loop
 - `InfiniteLoop2`: Infinite Loop 2
 - `InfiniteLoop3`: Infinite Loop 3
 - `InfiniteLoop5`: Infinite Loop 5
 - `ApplePark`: Apple Inc.
 - `WesleyGHS`: An all girl high school in Taiwan
 
 ****
 - callout(Finished): You have just learned how to use the **Déjà vu** app! You will feel better in the future next time.
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 */
let tabBar = GLTabBarController()
PlaygroundPage.current.liveView = tabBar
