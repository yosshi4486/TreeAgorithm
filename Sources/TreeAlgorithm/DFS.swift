//
//  DFS.swift
//  TreeAlgorithm
//
//  Created by yosshi4486 on 2020/12/10.
//

import Foundation

/// Traverses a given tree structured data by Depth First Search.
///
/// - Parameters:
///   - data: The root node of tree structure.
///   - keypath: The keypath for data's children where the type of Element is equal to the type of Data. The property must be Oprional<Data>.
///   - forEach: The closure is executed in each node traversal.
///
/// - Complexity:
/// O(n) where n is number of node in the given tree strucure data.
public func dfs<Data>(_ data: Data.Element, children keypath: KeyPath<Data.Element, Data?>, forEach: (Data.Element) -> Void) where Data: RandomAccessCollection {
    forEach(data)

    if let children = data[keyPath: keypath] {
        for child in children {
            dfs(child, children: keypath, forEach: forEach)
        }
    }

}

/// Traverses a given tree structured data by Depth First Search.
///
/// - Parameters:
///   - data: The root node of tree structure.
///   - keypath: The keypath for data's children where the type of Element is equal to the type of Data.
///   - forEach: The closure is executed in each node traversal.
///
/// - Complexity:
/// O(n) where n is number of node in the given tree strucure data.
public func dfs<Data>(_ data: Data.Element, children keypath: KeyPath<Data.Element, Data>, forEach: (Data.Element) -> Void) where Data: RandomAccessCollection {
    forEach(data)

    let children = data[keyPath: keypath]
    for child in children {
        dfs(child, children: keypath, forEach: forEach)
    }
    
}

