//
//  Autocomplete+Suggestion.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-09-12.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Autocomplete {
 
    /**
     This struct represents a suggestion that is returned by
     an ``AutocompleteProvider``.
     
     The ``isAutocorrect`` property indicates whether or not
     the suggestion will automatically be applied with space.
     Autocorrect suggestions usually have a white background.
     
     The ``isUnknown`` property indicates whether or not the
     suggestion is unknown. Unknown suggestions usually have
     the text wrapped in locale-specific quotation marks.
     */
    struct Suggestion : Identifiable, Equatable {
        public static func == (lhs: Autocomplete.Suggestion, rhs: Autocomplete.Suggestion) -> Bool {
            return lhs.text == rhs.text && lhs.subtitle == rhs.subtitle && lhs.title == rhs.title
        }
        
        public var id: String { text }
        
        
        /**
         Create an autocomplete suggestion.

         - Parameters:
           - text: The text that should be sent to the proxy.
           - title: The text that should be displayed, by default `text`.
           - isAutocorrect: Whether or not this is an autocorrect suggestion, by default `false`.
           - isUnknown: Whether or not this is an unknown suggestion, by default `false`.
           - subtitle: An optional subtitle that can complete the title, by default `nil`.
           - additionalInfo: An optional dictionary that can contain additional info, by default `empty`.
         */
        public init(
            text: String,
            title: String? = nil,
            isAutocorrect: Bool = false,
            isUnknown: Bool = false,
            subtitle: String? = nil,
            isSentence: Bool = false,
            additionalInfo: [String: Any] = [:]
        ) {
            self.text = text
            self.title = title ?? text
            self.isAutocorrect = isAutocorrect
            self.isUnknown = isUnknown
            self.subtitle = subtitle
            self.isSentence = isSentence
            self.additionalInfo = additionalInfo
        }
        
        /// The text that should be sent to the proxy.
        public var text: String
        
        /// The text that should be presented.
        public var title: String
        
        /// Whether or not this is an autocorrect suggestion.
        public var isAutocorrect: Bool
        
        /// Whether or not this is an unknown suggestion.
        public var isUnknown: Bool
        
        /// An optional subtitle that can complete the title.
        public var subtitle: String?
        
        /// Whether or not this is an autocorrect sentence suggestion
        public var isSentence: Bool
        
        /// An optional dictionary with additional info.
        public var additionalInfo: [String: Any]
    }
}
