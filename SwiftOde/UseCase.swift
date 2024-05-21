//
//  UseCase.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation


protocol UseCaseProtocol {
    associatedtype P
    associatedtype R
    
    func process(param: P?)
    
    func onError(error: Error)
    
    func onResult(output: Output<R>)
    
    func onGuard(param: P?) throws -> Bool
    
    func onGuardError()
}

open class UseCase<P, R> : UseCaseProtocol {
    typealias P = P
    typealias R = R
    
    public init() { }

    open func execute(param: P?) -> Output<R> {
        fatalError("Subclasses must implement execute.")
    }

    public func onError(error: Error) {
        onResult(output: ErrorOutput(value: nil, error: error))
    }
    
    public func process(param: P?) {
        do {
            if try onGuard(param: param) {
                let output = execute(param: param)
                onResult(output: output)
            } else {
                onGuardError()
            }
        } catch {
            onError(error: error)
        }
    }

    public func onResult(output: Output<R>) { }

    public func onGuard(param: P?) throws -> Bool { return true }

    public func onGuardError() { }
}
