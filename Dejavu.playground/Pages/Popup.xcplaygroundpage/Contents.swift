import PlaygroundSupport
/*:
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 ****
 # Popup
 
 - Important: Please remember to switch to *Timeline* on the right hand side so you can see the app in action!
 
    If the simulator does not show up, you could try restarting XCode and reopening the project.
 
 On rare occasions, you would be very close to a location where a previous **Déjà vu** happened. So on app start, it will show you a popup that asks you if this entry just happened to you. Hopefully it didn't. But if it did, don't be scared, just add another post with a different description and you still broke the **Déjà vu**.
 
 Changing the location below will show different posts (the one closest to you right now)
 
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
 When you are ready to add an entry, click [Next](@next)
 ****
 [Table of Contents](TableOfContents) | [Previous](@previous) | [Next](@next)
 */
let tabBar = GLTabBarController()
tabBar.showPopup = true
PlaygroundPage.current.liveView = tabBar