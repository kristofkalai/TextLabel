//
//  TextLabel.swift
//
//
//  Created by Kristóf Kálai on 30/09/2023.
//

import UIKit

open class TextLabel<Layer: CATextLayer>: UIView {
    public enum Text {
        case string(String)
        case attributedString(NSAttributedString)
        case none
    }

    open var text: Text {
        get {
            if let attributedString = layer.string as? NSAttributedString {
                .attributedString(attributedString)
            } else if let string = layer.string as? String {
                .string(string)
            } else {
                .none
            }
        }
        set {
            layer.string = {
                switch newValue {
                case let .string(string): string
                case let .attributedString(attributedString): attributedString
                case .none: nil
                }
            }()
        }
    }

    open var font: UIFont? {
        get {
            func cast(_ cfString: CFString?) -> String? {
                if let cfString {
                    cfString as NSString as String
                } else {
                    nil
                }
            }

            let name: String? = {
                switch layer.font {
                case let ctFont as CTFont: cast(CTFontCopyName(ctFont, kCTFontPostScriptNameKey))
                case let cgFont as CGFont: cast(cgFont.postScriptName)
                case let string as NSString: string as String
                case let string as String: string
                default: nil
                }
            }()

            return name.flatMap { UIFont(name: $0, size: layer.fontSize) }
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
        Layer.self
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
