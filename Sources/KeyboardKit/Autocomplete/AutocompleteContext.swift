//
//  ObservableAutocompleteContext.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-09-12.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Combine

public enum RemoteSuggestionQuery {
    case incorrect
    case correct
    case none
}

/**
 This observable class can be used to handle an autocomplete
 specific state, including configurations and suggestions.
 
 The ``isAutocompleteEnabled`` property can be set to `false`
 to completely disable autocomplete. The property is used by
 both the ``KeyboardInputViewController`` as well as service
 implementations, to not perform autocomplete.
 
 The ``isAutocorrectEnabled`` property can be set to `false`,
 to disable autocorrection. This property can be used by any
 autocomplete service implementation, to remove autocorrects
 from the result.

 KeyboardKit automatically creates an instance of this class
 and binds it to ``KeyboardInputViewController/state``.
 */
public class AutocompleteContext: ObservableObject {
    
    public init() {}
    
    /// Whether or not autocorrect is enabled.
    @Published
    public var isAutocorrectEnabled = true
    
    /// Whether or not autocomplete is enabled.
    @Published
    public var isAutocompleteEnabled = true

    /// Whether or not suggestions are being fetched.
    @Published
    public var isLoading = false

    /// The last received autocomplete error.
    @Published
    public var lastError: Error?
    
    /// The last received autocomplete suggestions.
    @Published
    public var suggestions: [Autocomplete.Suggestion] = []

    /// The possible states for a given autocomplete remote query
    @Published
    public var remoteQueryState: RemoteSuggestionQuery = .none
    
    /// Reset the autocomplete contexts.
    public func reset() {
        isLoading = false
        lastError = nil
        suggestions = []
        remoteQueryState = .none
    }
}
