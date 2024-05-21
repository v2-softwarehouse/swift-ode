//
//  BaseViewController.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation
import UIKit

protocol BaseUIViewController {
    associatedtype C
    func setupViews(view: UIView?)

    func channelName() -> String

    func setupController() -> C

    func getLayout() -> Int
}

open class BaseViewController<C>: UIViewController, BaseUIViewController {
    typealias C = C
    var hideToolbar = false
    
    public lazy var controller = { setupController() }()

    open override func viewDidLoad() {
        super.viewDidLoad()
        if hideToolbar {
            navigationController?.isNavigationBarHidden = true
        }
        registerObserveChannel()
        setupViews(view: self.view)
    }

    open func setupViews(view: UIView?) { }
    
    open func handleSuccess(value: Any?) { }
    
    open func handleAuthError() { }

    open func handleHttpError(error: HttpException) { }

    open func handleConnectionError() { }

    open func handleError(error: Error?) { }

    open func channelName() -> String {
        return ""
    }

    open func setupController() -> C {
          return C.self as! C
    }

    open func getLayout() -> Int {
        return 0
    }

    private func handleResult(value: Any) {
        let state = ValueOutput(value: value)
        if state.isError() {
            self.handleThrowable(error: state.error)
        } else {
            handleSuccess(value: state.value)
        }
    }
    
    open func handleThrowable(error: Error?) {
        switch (error) {
             case is AuthenticationException : handleAuthError()
             case is HttpException : handleHttpError(error: (error as! HttpException))
             case is InternetConnectionException : handleConnectionError()
             default : handleError(error: error)
        }
    }

    private func registerObserveChannel() {
        if let ctn = controller as? Controller {
            _ = ctn.observe(channelName: channelName(), listener: handleResult)
        }
    }
}
