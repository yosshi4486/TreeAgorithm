//
//  DFS.swift
//  TreeAlgorithm
//
//  Created by yosshi4486 on 2020/12/10.
//

import Foundation

public func dfs<Data>(_ data: Data.Element, children keypath: KeyPath<Data.Element, Data?>, forEach: (Data.Element) -> Void) where Data: RandomAccessCollection {
    forEach(data)

    if let children = data[keyPath: keypath] {
        for child in children {
            dfs(child, children: keypath, forEach: forEach)
        }
    }

}

public func dfs<Data>(_ data: Data.Element, children keypath: KeyPath<Data.Element, Data>, forEach: (Data.Element) -> Void) where Data: RandomAccessCollection {
    forEach(data)

    let children = data[keyPath: keypath]
    for child in children {
        dfs(child, children: keypath, forEach: forEach)
    }
    
}

