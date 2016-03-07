// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation

enum L10n {
  /// Colors
  case ColorsVCTitle
  /// Palettes
  case PalettesVCTitle
  /// Patterns
  case PatternsVCTitle
}

extension L10n: CustomStringConvertible {
  var description: String { return self.string }

  var string: String {
    switch self {
      case .ColorsVCTitle:
        return L10n.tr("ColorsVC/Title")
      case .PalettesVCTitle:
        return L10n.tr("PalettesVC/Title")
      case .PatternsVCTitle:
        return L10n.tr("PatternsVC/Title")
    }
  }

  private static func tr(key: String, _ args: CVarArgType...) -> String {
    let format = NSLocalizedString(key, comment: "")
    return String(format: format, arguments: args)
  }
}

func tr(key: L10n) -> String {
  return key.string
}
