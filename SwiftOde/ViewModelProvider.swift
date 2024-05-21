//
//  ViewModelProvider.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 14/01/22.
import Foundation

protocol ViewModelProviderProtocol {
    var map: [String : BaseViewModel] { get set }
}

open class ViewModelProvider : ViewModelProviderProtocol {
    var map = [String: BaseViewModel]()

    static public func of(model: BaseViewModel.Type) -> BaseViewModel? {
        doOf(model: model)
    }
}

