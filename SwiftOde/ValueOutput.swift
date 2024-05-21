//
//  ValueOutput.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

open class ValueOutput<V>: Output<V> {
    override init() {
        super.init()
    }
       
    public init(value: V?) {
       super.init(value: value)
    }

    open override func isError() -> Bool {
        return false
    }
}
