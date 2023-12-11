//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle

  let entitlements = entitlements()

  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var file: file { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func file(bundle: Foundation.Bundle) -> file {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 37 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// Value: 关于
      ///
      /// Key: About
      var about: RswiftResources.StringResource { .init(key: "About", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 取消
      ///
      /// Key: Cancel
      var cancel: RswiftResources.StringResource { .init(key: "Cancel", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 中文
      ///
      /// Key: Chinese
      var chinese: RswiftResources.StringResource { .init(key: "Chinese", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: English
      ///
      /// Key: English
      var english: RswiftResources.StringResource { .init(key: "English", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 非法操作
      ///
      /// Key: Error.App.Message
      var errorAppMessage: RswiftResources.StringResource { .init(key: "Error.App.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 非法操作
      ///
      /// Key: Error.App.Title
      var errorAppTitle: RswiftResources.StringResource { .init(key: "Error.App.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 登录失败，请稍后重试
      ///
      /// Key: Error.Login
      var errorLogin: RswiftResources.StringResource { .init(key: "Error.Login", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 网络错误
      ///
      /// Key: Error.Network.Message
      var errorNetworkMessage: RswiftResources.StringResource { .init(key: "Error.Network.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 网络错误
      ///
      /// Key: Error.Network.Title
      var errorNetworkTitle: RswiftResources.StringResource { .init(key: "Error.Network.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 重试
      ///
      /// Key: Error.Retry
      var errorRetry: RswiftResources.StringResource { .init(key: "Error.Retry", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 服务异常
      ///
      /// Key: Error.Server.Message
      var errorServerMessage: RswiftResources.StringResource { .init(key: "Error.Server.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 服务异常
      ///
      /// Key: Error.Server.Title
      var errorServerTitle: RswiftResources.StringResource { .init(key: "Error.Server.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 数据解析异常
      ///
      /// Key: Error.System.DataFormat.Message
      var errorSystemDataFormatMessage: RswiftResources.StringResource { .init(key: "Error.System.DataFormat.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 数据解析异常
      ///
      /// Key: Error.System.DataFormat.Title
      var errorSystemDataFormatTitle: RswiftResources.StringResource { .init(key: "Error.System.DataFormat.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 列表为空
      ///
      /// Key: Error.System.ListIsEmpty.Message
      var errorSystemListIsEmptyMessage: RswiftResources.StringResource { .init(key: "Error.System.ListIsEmpty.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 列表为空
      ///
      /// Key: Error.System.ListIsEmpty.Title
      var errorSystemListIsEmptyTitle: RswiftResources.StringResource { .init(key: "Error.System.ListIsEmpty.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 导航错误
      ///
      /// Key: Error.System.Navigation.Message
      var errorSystemNavigationMessage: RswiftResources.StringResource { .init(key: "Error.System.Navigation.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 导航错误
      ///
      /// Key: Error.System.Navigation.Title
      var errorSystemNavigationTitle: RswiftResources.StringResource { .init(key: "Error.System.Navigation.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 未知错误
      ///
      /// Key: Error.System.Unknown.Message
      var errorSystemUnknownMessage: RswiftResources.StringResource { .init(key: "Error.System.Unknown.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 未知错误
      ///
      /// Key: Error.System.Unknown.Title
      var errorSystemUnknownTitle: RswiftResources.StringResource { .init(key: "Error.System.Unknown.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 用户登录过期
      ///
      /// Key: Error.User.LoginExpired.Message
      var errorUserLoginExpiredMessage: RswiftResources.StringResource { .init(key: "Error.User.LoginExpired.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 用户登录过期
      ///
      /// Key: Error.User.LoginExpired.Title
      var errorUserLoginExpiredTitle: RswiftResources.StringResource { .init(key: "Error.User.LoginExpired.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 用户未登录
      ///
      /// Key: Error.User.NotLoggedIn.Message
      var errorUserNotLoggedInMessage: RswiftResources.StringResource { .init(key: "Error.User.NotLoggedIn.Message", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 用户未登录
      ///
      /// Key: Error.User.NotLoggedIn.Title
      var errorUserNotLoggedInTitle: RswiftResources.StringResource { .init(key: "Error.User.NotLoggedIn.Title", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 事件
      ///
      /// Key: Event
      var event: RswiftResources.StringResource { .init(key: "Event", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 退出
      ///
      /// Key: Exit
      var exit: RswiftResources.StringResource { .init(key: "Exit", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 收藏
      ///
      /// Key: Favorite
      var favorite: RswiftResources.StringResource { .init(key: "Favorite", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: Follow system
      ///
      /// Key: Follow System
      var followSystem: RswiftResources.StringResource { .init(key: "Follow System", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 登录
      ///
      /// Key: Login
      var login: RswiftResources.StringResource { .init(key: "Login", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 个人私钥
      ///
      /// Key: Login.Placeholder.Token
      var loginPlaceholderToken: RswiftResources.StringResource { .init(key: "Login.Placeholder.Token", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 否
      ///
      /// Key: No
      var no: RswiftResources.StringResource { .init(key: "No", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 确定
      ///
      /// Key: OK
      var oK: RswiftResources.StringResource { .init(key: "OK", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 我的
      ///
      /// Key: Personal
      var personal: RswiftResources.StringResource { .init(key: "Personal", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 手机登录
      ///
      /// Key: Phone Login
      var phoneLogin: RswiftResources.StringResource { .init(key: "Phone Login", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 确定
      ///
      /// Key: Sure
      var sure: RswiftResources.StringResource { .init(key: "Sure", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 未知
      ///
      /// Key: Unknown
      var unknown: RswiftResources.StringResource { .init(key: "Unknown", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }

      /// Value: 是
      ///
      /// Key: Yes
      var yes: RswiftResources.StringResource { .init(key: "Yes", tableName: "Localizable", source: source, developmentValue: nil, comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 10 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `AppLogo`.
    var appLogo: RswiftResources.ImageResource { .init(name: "AppLogo", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic_user_default`.
    var ic_user_default: RswiftResources.ImageResource { .init(name: "ic_user_default", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic_user_placeholder`.
    var ic_user_placeholder: RswiftResources.ImageResource { .init(name: "ic_user_placeholder", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `personal_parallax_bg`.
    var personal_parallax_bg: RswiftResources.ImageResource { .init(name: "personal_parallax_bg", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_event_normal`.
    var tabbar_event_normal: RswiftResources.ImageResource { .init(name: "tabbar_event_normal", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_event_selected`.
    var tabbar_event_selected: RswiftResources.ImageResource { .init(name: "tabbar_event_selected", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_favorite_normal`.
    var tabbar_favorite_normal: RswiftResources.ImageResource { .init(name: "tabbar_favorite_normal", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_favorite_selected`.
    var tabbar_favorite_selected: RswiftResources.ImageResource { .init(name: "tabbar_favorite_selected", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_personal_normal`.
    var tabbar_personal_normal: RswiftResources.ImageResource { .init(name: "tabbar_personal_normal", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `tabbar_personal_selected`.
    var tabbar_personal_selected: RswiftResources.ImageResource { .init(name: "tabbar_personal_selected", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.entitlements` struct is generated, and contains static references to 3 properties.
  struct entitlements {
    let comAppleDeveloperAssociatedDomains = comAppleDeveloperAssociatedDomains()
    let comAppleSecurityApplicationGroups = comAppleSecurityApplicationGroups()
    let keychainAccessGroups = keychainAccessGroups()
    struct comAppleDeveloperAssociatedDomains {
      let applinksTosperyCom: String = "applinks:tospery.com"
    }
    struct comAppleSecurityApplicationGroups {
      let groupComTosperyShared: String = "group.com.tospery.shared"
    }
    struct keychainAccessGroups {
      let appIdentifierPrefixComTosperyHiiostmpl: String = "$(AppIdentifierPrefix)com.tospery.hiiostmpl"
      let appIdentifierPrefixShared: String = "$(AppIdentifierPrefix)shared"
    }
  }

  /// This `_R.file` struct is generated, and contains static references to 2 resource files.
  struct file {
    let bundle: Foundation.Bundle

    /// Resource file `Configuration.json`.
    var configurationJson: RswiftResources.FileResource { .init(name: "Configuration", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }

    /// Resource file `EventList#1.json`.
    var eventList1Json: RswiftResources.FileResource { .init(name: "EventList#1", pathExtension: "json", bundle: bundle, locale: LocaleReference.none) }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {
        if UIKit.UIImage(named: "AppLogo", in: bundle, compatibleWith: nil) == nil { throw RswiftResources.ValidationError("[R.swift] Image named 'AppLogo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
    }
  }
}