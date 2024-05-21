//
//  ViewModelProviderExtension.swift
//  BabelFish
//
//  Created by caio sanchez christino on 08/01/23.
//
import Foundation

extension ViewModelProvider {
    private static let provider = ViewModelProvider()
    
    static func doOf(model: BaseViewModel.Type) -> BaseViewModel? {
        let viewModelFactory = model.init()
        return provider.createViewModelFromFactory(factory: viewModelFactory, model: model)
    }
    
    fileprivate func createViewModelFromFactory(factory: ViewModel, model: BaseViewModel.Type) -> BaseViewModel? {
       let hash = "viewmodelhash_\(model.self)"
        if let cachedV = map[hash]  {
            print("called from cache")
            return cachedV
        }
        
        let viewModel = factory.createViewModel(V: model)
        map[hash] = viewModel
        return viewModel
    }
}
