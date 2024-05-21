//
//  ChainedUseCase.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation


open class ChainedUseCase<P,R,T> : UseCase<P,T> {
    var first: UseCase<P, R>
    var second: UseCase<R, T>
    
    public init(first: UseCase<P, R>, second: UseCase<R, T>) {
        self.first = first
        self.second = second
    }
    
    open override func execute(param: P?) -> Output<T> {
        doExecute(param: param)
    }
    
    func doExecute(param: P?) -> Output<T> {
        let intermediate = first.execute(param: param)
        if (intermediate.isSuccess()) {
           return second.execute(param: intermediate.value)
        }

        return ErrorOutput(value: nil, error: intermediate.error)
    }
}
