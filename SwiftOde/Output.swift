//
//  Output.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

public protocol ProtocolOutput  {
    associatedtype V
    
    var value: V? { get set }
    
    var error: Error? { get set }
    
    func isError() -> Bool
    
    func isSuccess() -> Bool
    
    func isEmpty() -> Bool

}

open class Output<V> : ProtocolOutput {
    public  var value: V?
    public var error: Error?
    public typealias V  = V
    
    public init() { }
    
    public init(value: V?,  error: Error? = nil) {
        self.value = value
        self.error = error
    }
    
    public func isEmpty() -> Bool {
        return value != nil
    }
    
    public func isError() -> Bool {
        return error != nil
    }
    
    public func isSuccess() -> Bool {
        return !isEmpty()
    }
}
