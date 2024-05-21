//
//  UseCaseUnit.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

open class UseCaseUnit {
    var processToDo : (() -> Output<Any>)?
    
    public func process<P, R>(useCase: UseCase<P, R>, param: P?) -> Output<R> {
        let callback = Callback<R>()
        let decorator = CallbackDecorator(useCase: useCase, callback: { output in
                    callback.set(value: output)
        })
               
        decorator.process(param: param)
        return callback.output
    }

    class Callback<R> {
        var output: Output<R> = ValueOutput()

        func set(value: Output<R>) {
            output = value
        }
    }
}
