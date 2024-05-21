//
//  BaseViewModel.swift
//  ios-babel-fish
//
//  Created by caio sanchez christino on 03/12/21.
//
import Combine

open class BaseViewModel: ViewModel, Controller {
    private var channels: [String: PassthroughSubject<Any, Never>] = [:]
    private var cancellables = Set<AnyCancellable>()

    public func observe(channelName: String, listener: @escaping (Any) -> Void) -> AnyCancellable? {
        if channels[channelName] == nil {
            channels[channelName] = PassthroughSubject<Any, Never>()
        }
        
        guard let subject = channels[channelName] else { return nil }
        let cancellable = subject.sink(receiveValue: listener)
        cancellables.insert(cancellable)
        return cancellable
    }

    func getChannels() -> [String] {
        return Array(channels.keys)
    }

    func disposeAll() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }

    public func postValue(channelName: String, value: Any) {
        channels[channelName]?.send(value)
    }

    public func dispatchUseCase<P, R>(
        param: P?,
        useCase: UseCase<P, R>,
        listener: @escaping (Output<R>) -> Void
    ) -> AnyCancellable? {
        let dispatcher = UseCaseDispatcher(useCase: useCase)
        let cancellable = dispatcher.dispatch(param: param, listener: listener)
        if let cancellable = cancellable {
            cancellables.insert(cancellable)
        }
        
        return cancellable
    }
}
