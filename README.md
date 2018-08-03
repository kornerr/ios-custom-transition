
# Overview

This is a sample iOS application to research custom ViewController transition.

# Preview

This is what the app looks like:

![Preview][preview]

# Structure

* `Animator` and `AnimatorController`
    * implement animation during push/pop
    * scale `CharacterView` from the size of an item in the collection to full screen and changes `CharacterView` alpha
* `AppDelegate`
    * creates `CharactersView` to display collection of races
    * creates `CharacterView` to display concrete race
    * uses `AnimatorController` to present `CharacterView` upon `CharactersView` item selection
* `CharactersView`
    * uses `UICollectionView` to present races
    * reports item selection with the help of `SimpleCallback`
* `CharactersItem`
    * holds `UIImage` representation of a race
* `CharactersItemView`
    * is a collection item
    * displays `UIImage` of a race
* `CharacterView`
    * display `UIImage` of a race
    * display race details

# References

* Images represent [Mass Effect races][me-races]
* Transition animation is based on this [great article from Ray Wenderlich][rayw].
* Xcode project generation is done with [XcodeGen][xcodegen]

[me-races]: http://masseffect.wikia.com/wiki/Races
[rayw-transition]: https://www.raywenderlich.com/173576/ios-animation-tutorial-custom-view-controller-presentation-transitions-3
[xcodegen]: https://github.com/yonaskolb/XcodeGen

