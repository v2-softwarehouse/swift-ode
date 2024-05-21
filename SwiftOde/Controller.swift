//
//  Controller.swift
//  ios-pokedex-clean
//
//  Created by caio sanchez christino on 03/12/21.
//

import Combine

public protocol Controller {
    func observe(channelName: String, listener: @escaping (Any) -> Void) -> AnyCancellable?
}
