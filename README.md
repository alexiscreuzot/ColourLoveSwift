# ColourLoveSwift
### (A Swift equivalent of [ColourLove](https://github.com/kirualex/ColourLove))

This project only purpose is to provide brief, clean and readable code in a dummy application. 
It is heavily library based and MVC oriented and shows mecanisms like downloading, storing and displaying data from a webservice.
Local data is handled with the [Realm library](http://realm.io/).

You are of course invited to use, fork and improve this project using your own knowledge. I'll try to update the code with up to date libraries and conventions.

## Philosophy

KISS : Kepp It Simple Stupid

### Classes

- ViewControllers are suffixed by 'VC' 
- Models should be self-explanatory and match the server model (if possible)
- Custom views should indicate the superclass type (like `ColorCell` which extends `UITableViewCell`)

## How to install

Dependencies are managed via [CocoaPods](http://cocoapods.org/)

    git clone git@github.com:kirualex/ColourLoveSwift.git
    cd ColourLoveSwift
    gem install cocoapods
    pod setup
    pod install
    open ColourLoveSwift.xcworkspace


## Swiftgen

Using [Swiftgen](https://github.com/AliSoftware/SwiftGen), we automatically generate safe code for storyboards, images, localizable and colors.
Here is the script used just before the "Compile Sources" phase to achieve this.

```
if hash swiftgen 2>/dev/null; then
swiftgen strings --output "${SRCROOT}/ColourLoveSwift/Swiftgen/L10n.swift" "${SRCROOT}/ColourLoveSwift/Resources/Strings/Base.lproj/Localizable.strings"
swiftgen images --output "${SRCROOT}/ColourLoveSwift/Swiftgen/UIImage+Assets.swift" "${SRCROOT}/ColourLoveSwift/Resources/"
swiftgen storyboards --output "${SRCROOT}/ColourLoveSwift/Swiftgen/UIStoryboard+Gen.swift" "${SRCROOT}/ColourLoveSwift/Resources/Storyboards/"
swiftgen colors --output "${SRCROOT}/ColourLoveSwift/Swiftgen/UIColor+Gen.swift" "${SRCROOT}/ColourLoveSwift/Resources/colors.txt"
else
echo "Swiftgen does not exist, download from https://github.com/AliSoftware/SwiftGen"
fi
```

## Swiftlint

[Swiftlint](https://github.com/realm/SwiftLint) is a great way to ensure the codebase stay clean and hopefully readable. You can tweak the rules in the `.swiftlint.yml` file 

## Screenshots

![screenshots](http://i.imgur.com/hsT2Fs4.png)
