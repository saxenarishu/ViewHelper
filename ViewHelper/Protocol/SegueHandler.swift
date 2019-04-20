//
//  SegueHandler.swift
//  ACEApp
//
// Shamelessly copied from - https://www.bignerdranch.com/blog/using-swift-enumerations-makes-segues-safer/

import UIKit
import ModelHelper

public protocol SegueHandler {
    associatedtype ViewControllerSegue: RawRepresentable
    func segueIdentifierCase(for segue: UIStoryboardSegue) -> ViewControllerSegue
    func route(for segue: UIStoryboardSegue)
}

public extension SegueHandler where ViewControllerSegue.RawValue == String {
    public func segueIdentifierCase(for segue: UIStoryboardSegue) -> ViewControllerSegue {
        guard let identifier = segue.identifier?.lowercasedFirst,
            let identifierCase = ViewControllerSegue(rawValue: identifier) else {
                fatalError("Could not map segue identifier -- \(String(describing: segue.identifier)) -- to segue case")
        }
        return identifierCase
    }
    
    public func route(for segue: UIStoryboardSegue) { }
}
