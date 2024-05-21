//
//  BaseViewModelTest.swift
//  babelfish
//
//  Created by caio sanchez christino on 30/11/23.
//

import XCTest
import Combine
@testable import SwiftOde

class BaseViewModelTest<T: BaseViewModel>: XCTestCase {
    var viewModel: T?
    var cancellables: Set<AnyCancellable> = []
    var observer: TestObserver?

    override func setUp() {
        super.setUp()
        setupViewModel()
        observeViewModel()
    }

    override func tearDown() {
        super.tearDown()
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }

    func setupViewModel() {
        // Implementado pelas subclasses para configurar o viewModel específico.
    }

    func assertViewStateError(_ error: Error) {
        guard let viewState = observer?.viewState else {
            XCTFail("viewState should not be nil")
            return
        }
        XCTAssertTrue(viewState.isError())
    }

    func assertViewStateSuccess(_ value: Any) {
        guard let viewState = observer?.viewState else {
            XCTFail("viewState should not be nil")
            return
        }
        XCTAssertTrue(viewState.isSuccess())
    }

    private func observeViewModel() {
        observer = TestObserver()
        viewModel?.getChannels().forEach { channel in
            let cancellable = viewModel?.observe(channelName: channel, listener: { value in
                self.observer?.onChanged(value)
            })
            if let cancellable = cancellable {
                cancellables.insert(cancellable)
            }
        }
    }

    class TestObserver {
        var viewState: ValueOutput<Any>? = nil

        func onChanged(_ value: Any) {
            viewState = value as? ValueOutput<Any>
        }
    }
}
