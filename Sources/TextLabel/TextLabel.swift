//
//  TextLabel.swift
//
//
//  Created by Kristóf Kálai on 30/09/2023.
//

import UIKit

open class TextLabel: UIView {
    public enum Text {
        case string(String)
        case attributedString(NSAttributedString)
        case none
    }

    open var text: Text {
        get {
            if let attributedString = layer.string as? NSAttributedString {
                return .attributedString(attributedString)
            } else if let string = layer.string as? String {
                return .string(string)
            }
            return .none
        }
        set {
            switch newValue {
            case let .string(string): layer.string = string
            case let .attributedString(attributedString): layer.string = attributedString
            case .none: layer.string = nil
            }
        }
    }

    open var font: UIFont? {
        get {
            let name: String
            switch layer.font {
            case let ctFont as CTFont:
                guard let _name = CTFontCopyName(ctFont, kCTFontPostScriptNameKey) else {
                    return nil
                }
                name = _name as NSString as String
            case let cgFont as CGFont:
                guard let _name = cgFont.postScriptName else {
                    return nil
                }
                name = _name as NSString as String
            case let string as NSString:
                name = string as String
            case let string as String:
                name = string
            default:
                return nil
            }
            return UIFont(name: name, size: layer.fontSize)
        }
        set {
            layer.font = newValue
        }
    }

    open var fontSize: CGFloat {
        get {
            layer.fontSize
        }
        set {
            layer.fontSize = newValue
        }
    }

    open var foregroundColor: UIColor? {
        get {
            layer.foregroundColor.map { .init(cgColor: $0) }
        }
        set {
            layer.foregroundColor = newValue?.cgColor
        }
    }

    open var isWrapped: Bool {
        get {
            layer.isWrapped
        }
        set {
            layer.isWrapped = newValue
        }
    }

    open var truncationMode: CATextLayerTruncationMode {
        get {
            layer.truncationMode
        }
        set {
            layer.truncationMode = newValue
        }
    }

    open var alignmentMode: CATextLayerAlignmentMode {
        get {
            layer.alignmentMode
        }
        set {
            layer.alignmentMode = newValue
        }
    }

    open var allowsFontSubpixelQuantization: Bool {
        get {
            layer.allowsFontSubpixelQuantization
        }
        set {
            layer.allowsFontSubpixelQuantization = newValue
        }
    }

    public override class var layerClass: AnyClass {
        CATextLayer.self
    }

    override public var layer: CATextLayer {
        super.layer as! CATextLayer
    }

    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}

extension TextLabel {
    private func commonInit() {
        layer.contentsScale = UIScreen.main.scale
    }
}
