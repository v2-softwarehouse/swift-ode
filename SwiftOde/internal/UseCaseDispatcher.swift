//
//  UseCaseDispatcher.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Combine
import Foundation

class UseCaseDispatcher<P, R> {
    private let useCase: UseCase<P, R>
    
    init(useCase: UseCase<P, R>) {
        self.useCase = useCase
    }

    func dispatch(param: P?, listener: @escaping (Output<R>) -> Void) -> AnyCancellable? {
        return Just(param)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .flatMap { param -> Future<Output<R>, Never> in
                let result = self.useCase.execute(param: param)
                return Future { promise in
                    promise(.success(result))
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: listener)
    }
}

