//
//  DFSTests.swift
//  TreeAlgorithmTests
//
//  Created by yosshi4486 on 2020/12/10.
//

import XCTest
@testable import TreeAlgorithm

class DFSTests: XCTestCase {

    final class TestStub {
        var title: String
        var children: [TestStub]

        init(_ title: String, children: [TestStub]) {
            self.title = title
            self.children = children
        }
    }

    final class TestStubOptional {
        var title: String
        var children: [TestStubOptional]?

        init(_ title: String, children: [TestStubOptional]) {
            self.title = title
            self.children = children
        }
    }

    func testDFS() {
        let testData = TestStub("Root", children: [
            TestStub("Parent1", children: [
                TestStub("Child1", children: []),
                TestStub("Child2", children: [
                    TestStub("Grandchild", children: [])
                ])
            ]),
            TestStub("Parent2", children: [])
        ])

        var sequence: [String] = []

        dfs(testData, children: \TestStub.children) { node in
            sequence.append(node.title)
        }

        XCTAssertEqual(sequence, ["Root", "Parent1", "Child1", "Child2", "Grandchild", "Parent2"])
    }

    func testDFSWhenOptionalChildren() {
        let testData = TestStubOptional("Root", children: [
            TestStubOptional("Parent1", children: [
                TestStubOptional("Child1", children: []),
                TestStubOptional("Child2", children: [
                    TestStubOptional("Grandchild", children: [])
                ])
            ]),
            TestStubOptional("Parent2", children: [])
        ])

        var sequence: [String] = []

        dfs(testData, children: \TestStubOptional.children) { node in
            sequence.append(node.title)
        }

        XCTAssertEqual(sequence, ["Root", "Parent1", "Child1", "Child2", "Grandchild", "Parent2"])
    }

}
