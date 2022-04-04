//
//  ResultState.swift
//  DesignPlus#2
//
//  Created by Hubert Le on 3/10/22.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
