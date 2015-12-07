# ColourLoveSwift
## (A Swift equivalent of [ColourLove](https://github.com/kirualex/ColourLove))

This project only purpose is to provide brief, clean and readable code in a dummy application. 
It is heavily library based and MVC oriented and shows mecanisms like downloading, storing and displaying data from a webservice.
All data is handled with the [Realm library](http://realm.io/), using the Active Record Pattern for cleaner code while still providing excellent performances.

You are of course invited to use, fork and improve this project using your own knowledge. I'll try to update the code with up to date libraries and cconventions.

## Philosophy

### Architecture

Here is the file hierarchy as is in the project. We aim to have a clear view of our MVC components.

```
.
|-- Classes
|   |-- AppDelegate.h
|   |-- AppDelegate.m
|   |-- Constants.h
|   |-- Models
|   |-- Controllers
|   |-- Helpers
|-- Supporting Files
|-- Resources
    |-- Images
|-- Frameworks
|-- Products
|-- Pods.xcconfig
```

### Conventions

In this project I rely on some naming conventions :

#### Classes

- ViewControllers are suffixed by 'VC'
- Models should be self-explanatory and match the server model (if any)
- Custom views should indicate the superclass type (like `ColorCell` which extends `UITableViewCell`)

## How to install

Dependencies are managed with CocoaPods, which I recommend you to have a look at : http://cocoapods.org/

    git clone git@github.com:kirualex/ColourLoveSwift.git
    cd ColourLoveSwift
    gem install cocoapods
    pod setup
    pod install
    open ColourLoveSwift.xcworkspace


## Screenshots

