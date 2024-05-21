//
//  CompositeJobDisposable.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//

import Combine

class CompositeJobDisposable {
    private var cancellables = Set<AnyCancellable>()

    func add(_ cancellable: AnyCancellable) {
        cancellables.insert(cancellable)
    }

    func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}
