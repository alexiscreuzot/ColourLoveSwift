// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    return storyboard().instantiateInitialViewController()!
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewControllerWithIdentifier(self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func performSegue<S: StoryboardSegueType where S.RawValue == String>(segue: S, sender: AnyObject? = nil) {
    performSegueWithIdentifier(segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum Colors: String, StoryboardSceneType {
    static let storyboardName = "Colors"

    case ColorDetailVCScene = "ColorDetailVC"
    static func instantiateColorDetailVC() -> ColorDetailVC {
      return StoryboardScene.Colors.ColorDetailVCScene.viewController() as! ColorDetailVC
    }

    case ColorsVCScene = "ColorsVC"
    static func instantiateColorsVC() -> ColorsVC {
      return StoryboardScene.Colors.ColorsVCScene.viewController() as! ColorsVC
    }
  }
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: StoryboardSceneType {
    static let storyboardName = "Main"
  }
  enum Palettes: String, StoryboardSceneType {
    static let storyboardName = "Palettes"

    case ColorsVCScene = "ColorsVC"
    static func instantiateColorsVC() -> PalettesVC {
      return StoryboardScene.Palettes.ColorsVCScene.viewController() as! PalettesVC
    }
  }
  enum Patterns: String, StoryboardSceneType {
    static let storyboardName = "Patterns"

    case PatternsVCScene = "PatternsVC"
    static func instantiatePatternsVC() -> PatternsVC {
      return StoryboardScene.Patterns.PatternsVCScene.viewController() as! PatternsVC
    }
  }
}

struct StoryboardSegue {
}
