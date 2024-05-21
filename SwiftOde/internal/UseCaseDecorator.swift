//
//  UseCaseDecorator.swift
//  babelfish
//
//  Created by caio sanchez christino on 30/11/23.
//

import Foundation

class UseCaseDecorator<P, R>: UseCase<P, R> {
    let useCase: UseCase<P, R>

    init(useCase: UseCase<P, R>) {
        self.useCase = useCase
        super.init()
    }

    override func onError(error: Error) {
        useCase.onError(error: error)
    }

    override func execute(param: P?) -> Output<R> {
        return useCase.execute(param: param)
    }

    override func onResult(output: Output<R>) {
        useCase.onResult(output: output)
    }

    override func onGuard(param: P?) -> Bool {
        return try! useCase.onGuard(param: param)
    }
}
