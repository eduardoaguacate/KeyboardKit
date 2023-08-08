//
//  AutocompleteToolbarSeparator.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-03-18.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view mimics the autocomplete toolbar separator that is
 used in native iOS keyboards.
 
 > v8.0: This will be wrapped in a new `AutocompleteToolbar`
 namespace and renamed to `AutocompleteToolbar.ItemSeparator`.
 */
public struct AutocompleteToolbarSeparator: View {
    
    /**
     Create an autocomplete toolbar item separator.
     
     - Parameters:
       - style: The style to apply, by default `.standard`.
     */
    public init(
        style: Style = .standard
    ) {
        self.style = style
    }
    
    public typealias Style = KeyboardStyle.AutocompleteToolbarSeparator
    
    private let style: Style
    
    public var body: some View {
        style.color
            .frame(width: style.width)
            .frame(height: style.height)
    }
}

struct AutocompleteToolbarSeparator_Previews: PreviewProvider {
    
    static var previews: some View {
        HStack {
            AutocompleteToolbarSeparator(style: .standard)
            AutocompleteToolbarSeparator(style: .preview1)
            AutocompleteToolbarSeparator(style: .preview2)
        }.frame(height: 50)
    }
}
