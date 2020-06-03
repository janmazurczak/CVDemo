//
//  Configuration.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

import Foundation

protocol ConfigurationScheme {
    var communicator: BackendCommunicator { get }
    var style: Style { get }
    var explorationFlow: ExplorationFlow { get }
    func makePresenter() -> Presenter
}

struct Configuration {
    private init() {}
    // Replacing current configuration we can test different environments.
    // Consider ConfigurationScheme instance the dependency injection manager.
    static var current: ConfigurationScheme { return Configuration.default }
    static let `default` = DefaultConfiguration()
}

struct DefaultConfiguration: ConfigurationScheme {
    let communicator: BackendCommunicator = StandardBackendCommunicator(at: .prodEndpoint)
    let style = Style.default
    let explorationFlow: ExplorationFlow = DefaultExplorationFlow()
    func makePresenter() -> Presenter { return BlockUI() }
}

extension URL {
    static let testEndpoint = URL(string: "https://jansgames.com/api/test")!
    static let prodEndpoint = URL(string: "https://jansgames.com/api/v1")!
}

// Test data available at https://jansgames.com/api/test/getCV
// Production data available at https://jansgames.com/api/v1/getCV
