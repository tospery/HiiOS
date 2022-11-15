//
//  NavigatorProtocol+Router.swift
//  HiIOS
//
//  Created by liaoya on 2022/7/19.
//

import Foundation
import RxSwift
import RxCocoa
import URLNavigator
import SwifterSwift_Hi

var navigateBag = DisposeBag()

public enum ForwardType: Int {
    case push
    case present
    case open
}

public extension NavigatorProtocol {

    // MARK: - Forward（支持自动跳转登录页功能）
    @discardableResult
    func forward(
        _ url: URLConvertible,
        context: Any? = nil,
        wrap: UINavigationController.Type? = nil,
        fromNav: UINavigationControllerType? = nil,
        fromVC: UIViewControllerType? = nil,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) -> Bool {
        guard let url = url.urlValue else { return false }
        guard let host = url.host else { return false }
        // 检测登录要求
        var needLogin = false
        var isLogined = true
        let router = Router.shared
        if let compatible = router as? RouterCompatible {
            isLogined = compatible.isLogined()
            if compatible.needLogin(host: host, path: url.path) {
                needLogin = true
            }
        } else {
            if host == .user {
                needLogin = true
            }
        }
        if needLogin && !isLogined {
            (self as! Navigator).rx.open(
                router.urlString(host: .login)
            ).subscribe(onNext: { result in
                logger.print("自动跳转登录页(数据): \(result)")
            }, onError: { error in
                logger.print("自动跳转登录页(错误): \(error)")
            }, onCompleted: {
                logger.print("自动跳转登录页(完成)")
                var hasLogined = false
                if let compatible = router as? RouterCompatible {
                    hasLogined = compatible.isLogined()
                }
                if hasLogined {
                    self.forward(url, context: context, wrap: wrap, fromNav: fromNav, fromVC: fromVC, animated: animated, completion: completion)
                }
            }).disposed(by: navigateBag)
            return true
        }
        
        // context中的参数的优先级高于查询参数
        var parameters: [String: Any] = url.queryParameters ?? [:]
        parameters += context as? [String: Any] ?? [:]
        let forwardType = ForwardType.init(
            rawValue: parameters.int(for: Parameter.forwardType) ?? 0
        )
        
        switch forwardType {
        case .push:
            if self.push(url, context: context, from: fromNav, animated: animated) != nil {
                return true
            }
        case .present:
            if self.present(url, context: context, wrap: wrap ?? NavigationController.self, from: fromVC, animated: animated, completion: completion) != nil {
                return true
            }
        default:
            break
        }
        return self.open(url, context: context)
    }
    
    func back(animated: Bool = true, _ completion: (() -> Void)? = nil) {
        guard let top = UIViewController.topMost else { return }
        if top.navigationController?.viewControllers.count ?? 0 > 1 {
            top.navigationController?.popViewController(animated: animated, completion)
        } else {
            top.dismiss(animated: animated, completion: completion)
        }
    }
    
    @discardableResult
    func rxForward(
        _ url: URLConvertible,
        context: Any? = nil,
        wrap: UINavigationController.Type? = nil,
        fromNav: UINavigationControllerType? = nil,
        fromVC: UIViewControllerType? = nil,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) -> Observable<Any> {
        (self as! Navigator).rx.forward(url, context: context, wrap: wrap, fromNav: fromNav, fromVC: fromVC, animated: animated, completion: completion)
    }

    // MARK: - Toast
    func toastMessage(_ message: String) {
        guard !message.isEmpty else { return }
        self.open(Router.shared.urlString(host: .toast, parameters: [
            Parameter.message: message
        ]))
    }
    
    func showToastActivity() {
        self.open(Router.shared.urlString(host: .toast, parameters: [
            Parameter.active: true.string
        ]))
    }
    
    func hideToastActivity() {
        self.open(Router.shared.urlString(host: .toast, parameters: [
            Parameter.active: false.string
        ]))
    }
    
    // MARK: - Alert
    func alert(_ title: String, _ message: String, _ actions: [AlertActionType]) {
        self.open(
            Router.shared.urlString(
                host: .alert,
                parameters: [
                    Parameter.title: title,
                    Parameter.message: message
                ]),
            context: [
                Parameter.actions: actions
            ]
        )
    }

    func rxAlert(_ title: String, _ message: String, _ actions: [AlertActionType]) -> Observable<Any> {
        (self as! Navigator).rx.open(
            Router.shared.urlString(
                host: .alert,
                parameters: [
                    Parameter.title: title,
                    Parameter.message: message
                ]),
            context: [
                Parameter.actions: actions
            ]
        )
    }
    
    // MARK: - Sheet
    func sheet(_ title: String?, _ message: String?, _ actions: [AlertActionType]) {
        var parameters = [String: String].init()
        parameters[Parameter.title] = title
        parameters[Parameter.message] = message
        self.open(
            Router.shared.urlString(
                host: .sheet,
                parameters: parameters
            ),
            context: [
                Parameter.actions: actions
            ]
        )
    }

    func rxSheet(_ title: String?, _ message: String?, _ actions: [AlertActionType]) -> Observable<Any> {
        var parameters = [String: String].init()
        parameters[Parameter.title] = title
        parameters[Parameter.message] = message
        return (self as! Navigator).rx.open(
            Router.shared.urlString(
                host: .sheet,
                parameters: parameters
            ),
            context: [
                Parameter.actions: actions
            ]
        )
    }
    
    // MARK: - Popup
    func popup(_ path: Router.Path, context: Any? = nil) {
        self.open(
            Router.shared.urlString(host: .popup, path: path),
            context: context
        )
    }
    
    func rxPopup(_ path: Router.Path, context: Any? = nil) -> Observable<Any> {
        (self as! Navigator).rx.open(
            Router.shared.urlString(host: .popup, path: path),
            context: context
        )
    }
    
    // MARK: - Login
    func login() {
        self.open(Router.shared.urlString(host: .login))
    }
    
    func rxLogin() -> Observable<Any> {
        (self as! Navigator).rx.open(Router.shared.urlString(host: .login))
    }
    
    
//
//    func sheet(_ path: Router.Path, context: Any? = nil) {
//        self.navigator.open(Router.urlString(host: .sheet, path: path), context: context)
//    }
//
//    func rxSheet(_ path: Router.Path, context: Any? = nil) -> Observable<Any> {
//        (self.navigator as! Navigator).rx.open(Router.urlString(host: .sheet, path: path), context: context)
//    }
    
}