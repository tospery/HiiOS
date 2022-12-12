//
//  Router.swift
//  HiIOS
//
//  Created by liaoya on 2022/7/19.
//

import Foundation
import URLNavigator

public protocol RouterCompatible {
    
    func isLogined() -> Bool
    
    func isLegalHost(host: Router.Host) -> Bool
    func allowedPaths(host: Router.Host) -> [Router.Path]
    
    func hasType(host: Router.Host) -> Bool
    func forDetail(host: Router.Host) -> Bool
    
    func needLogin(host: Router.Host, path: Router.Path?) -> Bool
    func customLogin(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol, _ url: URLConvertible, _ values: [String: Any], _ context: Any?) -> Bool
    
//    func shouldRefresh(host: Router.Host, path: Router.Path?) -> Bool
//    func shouldLoadMore(host: Router.Host, path: Router.Path?) -> Bool
    
    // func title(host: Router.Host, path: Router.Path?) -> String?
    func parameters(_ url: URLConvertible, _ values: [String: Any], _ context: Any?) -> [String: Any]?
    
    func webViewController(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol, _ paramters: [String: Any]) -> UIViewController?
    
    func web(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol)
    func page(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol)
    func dialog(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol)
    
}

final public class Router {

    public typealias Host = String
    public typealias Path = String
    
    public static var shared = Router()
    
    init() {
    }
    
    public func initialize(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol) {
        self.buildinMatch(provider, navigator)
        self.buildinWeb(provider, navigator)
        self.buildinLogin(provider, navigator)
        if let compatible = self as? RouterCompatible {
            compatible.web(provider, navigator)
            compatible.page(provider, navigator)
            compatible.dialog(provider, navigator)
        }
    }
    
    func buildinMatch(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol) {
        (navigator as? Navigator)?.matcher.valueConverters["type"] = { [weak self] pathComponents, index in
            guard let `self` = self else { return nil }
            if let compatible = self as? RouterCompatible {
                let host = pathComponents[0]
                if compatible.isLegalHost(host: host) {
                    let path = pathComponents[index]
                    if compatible.allowedPaths(host: host).contains(path) {
                        return path
                    }
                }
            }
            return nil
        }
    }
    
    func buildinWeb(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol) {
        let webFactory: ViewControllerFactory = { [weak self] (url, _, context) in
            guard let `self` = self else { return nil }
            guard let url = url.urlValue else { return nil }
            // (1) 原生支持
            let string = url.absoluteString
            let base = UIApplication.shared.baseWebUrl + "/"
            if string.hasPrefix(base) {
                let url = string.replacingOccurrences(of: base, with: UIApplication.shared.urlScheme + "://")
                if navigator.forward(url, context: context) {
                    return nil
                }
            }
            // (2) 网页跳转
            var paramters = context as? [String: Any] ?? [:]
            paramters[Parameter.url] = url.absoluteString
            if let title = url.queryValue(for: Parameter.title) {
                paramters[Parameter.title] = title
            }

            if let compatible = self as? RouterCompatible {
//                compatible.web(provider, navigator)
//                compatible.page(provider, navigator)
//                compatible.dialog(provider, navigator)
                return compatible.webViewController(provider, navigator, paramters)
            }
            
            return nil
        }
        navigator.register("http://<path:_>", webFactory)
        navigator.register("https://<path:_>", webFactory)
    }
    
    func buildinLogin(_ provider: HiIOS.ProviderType, _ navigator: NavigatorProtocol) {
        navigator.handle(self.urlPattern(host: .login)) { url, values, context in
            if let compatible = self as? RouterCompatible {
                return compatible.customLogin(provider, navigator, url, values, context)
            }
            
//            guard let top = UIViewController.topMost else { return false }
//            if top.className.contains("LoginViewController") ||
//                top.className.contains("TXSSOLoginViewController") {
//                return false
//            }
//
//            // 没有引入Frame，无法使用BaseViewReactor/BaseViewController
//            if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
//                let reactorName = "\(appName).LoginViewReactor"
//                let controllerName = "\(appName).LoginViewController"
//                if let reactorType = NSClassFromString(reactorName) as? BaseViewReactor.Type,
//                   let controllerType = NSClassFromString(controllerName) as? BaseViewController.Type {
//                    let vc = controllerType.init(
//                        navigator,
//                        reactorType.init(
//                            provider,
//                            self.parameters(url, values, context)
//                        )
//                    )
//                    let nav = NavigationController(rootViewController: vc)
//                    top.present(nav, animated: true)
//                }
//            }
            
            return false
        }
    }
    
    public func parameters(_ url: URLConvertible, _ values: [String: Any], _ context: Any?) -> [String: Any]? {
        // 1. 基础参数
        var parameters: [String: Any] = url.queryParameters
        for (key, value) in values {
            parameters[key] = value
        }
        if let context = context {
            if let ctx = context as? [String: Any] {
                for (key, value) in ctx {
                    parameters[key] = value
                }
            } else {
                parameters[Parameter.context] = context
            }
        }
        // 2. Host
        guard let host = url.urlValue?.host else { return nil }
        parameters[Parameter.host] = host
        // 3. Path
        let path = url.urlValue?.path.removingPrefix("/").removingSuffix("/")
        parameters[Parameter.path] = path?.isEmpty ?? true ? nil : path
        // 4. 标题
        parameters[Parameter.title] = parameters.string(for: Parameter.title)
//        var title: String? = nil
//        if let compatible = self as? RouterCompatible {
//            title = compatible.title(host: host, path: path)
//        }
//        parameters[Parameter.title] = parameters.string(for: Parameter.title) ?? title
        // 5. 刷新/加载
//        var shouldRefresh = false
//        var shouldLoadMore = false
//        if let compatible = self as? RouterCompatible {
//            shouldRefresh = compatible.shouldRefresh(host: host, path: path)
//            shouldLoadMore = compatible.shouldLoadMore(host: host, path: path)
//        }
//        parameters[Parameter.shouldRefresh] = parameters.bool(for: Parameter.shouldRefresh) ?? shouldRefresh
//        parameters[Parameter.shouldLoadMore] = parameters.bool(for: Parameter.shouldLoadMore) ?? shouldLoadMore
        return parameters
    }
    
    /// 注册的pattern
    /// 对于详情页，如app://user/detail采用<id>匹配模式
    /// 此时，需要注册两个patter，分别为app://user/42980和app://user
    /// 前者用于跳转到指定用户的详情页，后者用户跳转到当前登录用户的详情页
    public func urlPattern(host: Router.Host, path: Path? = nil) -> String {
        if let path = path {
            return "\(UIApplication.shared.urlScheme)://\(host)/\(path)"
        }
        if let compatible = self as? RouterCompatible {
            if compatible.forDetail(host: host) {
                return "\(UIApplication.shared.urlScheme)://\(host)/<id>"
            }
        } else {
            if host == .user {
                return "\(UIApplication.shared.urlScheme)://\(host)/<id>"
            }
        }
        if let compatible = self as? RouterCompatible {
            if compatible.hasType(host: host) {
                return "\(UIApplication.shared.urlScheme)://\(host)/<type:_>"
            }
        } else {
            if host == Router.Host.popup {
                return "\(UIApplication.shared.urlScheme)://\(host)/<type:_>"
            }
        }
        return "\(UIApplication.shared.urlScheme)://\(host)"
    }
    
    public func urlString(host: Router.Host, path: Path? = nil, parameters: [String: String]? = nil) -> String {
        let string = self.urlPattern(host: host)
            .replacingOccurrences(of: "/<id>", with: "")
            .replacingOccurrences(of: "/<type:_>", with: "")
        var url = string.url!
        if let path = path {
            url.appendPathComponent(path)
        }
        if let parameters = parameters {
            url.appendQueryParameters(parameters)
        }
//        if host.needLogin || path?.needLogin ?? false {
//            url.appendQueryParameters([
//                Parameter.needLogin: true.string
//            ])
//            if let user = User.current, user.isValid, let string = user.toJSONString()?.base64Encoded {
//                url.appendQueryParameters([
//                    Parameter.currentUser: string
//                ])
//            }
//        }
        return url.absoluteString
    }

}

extension Router.Host {
    public static var toast: Router.Host { "toast" }
    public static var alert: Router.Host { "alert" }
    public static var sheet: Router.Host { "sheet" }
    public static var popup: Router.Host { "popup" }
    
    public static var dashboard: Router.Host { "dashboard" }
    public static var personal: Router.Host { "personal" }
    
    public static var user: Router.Host { "user" }
    public static var profile: Router.Host { "profile" }
    public static var login: Router.Host { "login" }
    public static var about: Router.Host { "about" }
    public static var search: Router.Host { "search" }
    public static var history: Router.Path { "history" }
}

extension Router.Path {
    public static var list: Router.Path { "list" }
    public static var detail: Router.Path { "detail" }
}

