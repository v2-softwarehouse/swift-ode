//
//  CallbackDecorator.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Foundation

class CallbackDecorator<P, R>: UseCaseDecorator<P, R> {
    private let callback: (Output<R>) -> Void

    init(useCase: UseCase<P, R>, callback: @escaping (Output<R>) -> Void) {
        self.callback = callback
        super.init(useCase: useCase)
    }

    override func onResult(output: Output<R>) {
        super.onResult(output: output)
        callback(output)
    }

    override func onError(error: Error) {
        super.onError(error: error)
        callback(ErrorOutput(value: nil, error: error))
    }
}
