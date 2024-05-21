//
//  ViewModelFactory.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 14/01/22.
//

import Foundation

public class ViewModelFactory {
    required public init() { }
    
    func createViewModel<V: BaseViewModel>(V: V.Type) -> V? { return nil }
}
