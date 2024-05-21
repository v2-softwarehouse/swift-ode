//
//  ControllerFactory.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

open class ControllerFactory<V, T> {
    
    public init(){ }
    
    open func create(context: V)-> T? { return nil }
}
