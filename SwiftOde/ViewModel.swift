//
//  ViewModel.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 14/01/22.
//
import Foundation

open class ViewModel : ObservableObject {
    func viewModelDidRemoved() { }
    
    deinit { viewModelDidRemoved() }
    
    required public init() { }
    
    func createViewModel<V: BaseViewModel>(V: V.Type) -> V? {
        return self as? V
    }
}
