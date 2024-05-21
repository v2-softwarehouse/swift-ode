//
//  ErrorOutput.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

open class ErrorOutput<V>: Output<V> {
    override init() { super.init() }

    public override init(value: V? = nil, error: Error?) {
        super.init(value: value, error: error)
    }
    
    open override func isError() -> Bool {
        return true
    }
}
