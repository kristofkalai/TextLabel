//
//  TextLayerWithAnimatableForegroundColor.swift
//  Example
//
//  Created by Kristóf Kálai on 01/01/2024.
//

import Foundation

import UIKit

final class TextLayerWithAnimatableForegroundColor: CATextLayer {
    override func action(forKey event: String) -> CAAction? {
        switch event {
        case #keyPath(foregroundColor):
            let context = action(forKey: #keyPath(backgroundColor)) as? CABasicAnimation
            guard let animation = context?.copy() as? CABasicAnimation else { return nil }
            animation.keyPath = event
            animation.fromValue = presentation()?.value(forKeyPath: event)
            animation.toValue = nil
            return animation
        default:
            return super.action(forKey: event)
        }
    }
}
