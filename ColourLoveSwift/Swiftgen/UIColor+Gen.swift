// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIColor {
  convenience init(rgbaValue: UInt32) {
    let red   = CGFloat((rgbaValue >> 24) & 0xff) / 255.0
    let green = CGFloat((rgbaValue >> 16) & 0xff) / 255.0
    let blue  = CGFloat((rgbaValue >>  8) & 0xff) / 255.0
    let alpha = CGFloat((rgbaValue      ) & 0xff) / 255.0

    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

extension UIColor {
  enum Name {
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#339666"></span>
    /// Alpha: 100% <br/> (0x339666ff)
    case ArticleBody
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#33fe66"></span>
    /// Alpha: 100% <br/> (0x33fe66ff)
    case ArticleTitle
    /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ff66cc"></span>
    /// Alpha: 100% <br/> (0xff66ccff)
    case Cyan

    var rgbaValue: UInt32! {
      switch self {
      case .ArticleBody: return 0x339666ff
      case .ArticleTitle: return 0x33fe66ff
      case .Cyan: return 0xff66ccff
      }
    }
  }

  convenience init(named name: Name) {
    self.init(rgbaValue: name.rgbaValue)
  }
}
