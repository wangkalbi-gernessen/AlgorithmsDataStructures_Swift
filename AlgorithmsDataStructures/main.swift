//
//  main.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-03-09.
//

import Foundation

////print(power(base: 2, exponent: 4))
//
////print(palindrome("amoma"))
//
////reverseLine(1)
//
////let r1 = Solution()
////print(r1.tribonacci(5
////))
//
////let answer = evaluate("1+5")
////print(answer)
//
////let r1 = Solution()
////let answer = r1.canReach([4,4,1,3,0,3], 2)
////print(answer)
//
////printBinaryExhaustive(2)
//
////rollDiceSum(n: 2, desiredSum: 7)
////permutation("park")
////print(sortQuick([5,2,1,3,9,6]))
//
//
//
//struct Symbol {
//  static let mainDirectory = "├─"
//  static let line = "│"
//  static let angle = "└─"
//}
//
//let fileManager = FileManager.default
//var totalFiles = 0
//var totalDirectories = 0
//
//func crawl() {
////  let filePath = "/Users/Angriff/iOS_development/AlgorithmsDataStructures/AlgorithmsDataStructures"
//    let filePath = fileManager.currentDirectoryPath
//    crawlHelper(filePath, "", "", "")
//  print("Directories: \(totalDirectories), Files: \(totalFiles)")
//}
//
//func crawlHelper(_ filePath: String, _ fileName: String = "", _ soFar: String, _ indent: String = "") {
//  guard let files = try? fileManager.contentsOfDirectory(atPath: filePath) else {
//    let prevFilePath = String(filePath[...filePath.index(before: filePath.lastIndex(of: "/")!)])
//    let files = try! fileManager.contentsOfDirectory(atPath: prevFilePath)
//    var symbol = ""
//    symbol = files.last == fileName ? Symbol.angle : Symbol.mainDirectory
//    totalFiles += 1
//    print(soFar + indent + symbol + " " + fileName)
//    return
//  }
//
//  for i in 0..<files.count {
//    var symbol = ""
//    if i == 0 {
//      let fileName = String(filePath[filePath.index(after: filePath.lastIndex(of: "/")!)...])
//      symbol = files.last == files[0] ? Symbol.angle : Symbol.mainDirectory
//      totalDirectories += 1
//      print(soFar + indent + symbol + " " + fileName)
//    }
//    symbol = Symbol.line
//    let file = files[i]
//    crawlHelper(filePath + "/" + file, file, soFar + indent + symbol, indent + " ")
//  }
//}
//
//crawl()
//
//
//print(solveQueens(0))

//let stack = Stack<Int>()
//stack.push(5)
//stack.push(10)
//stack.push(8)
//stack.push(3)
//print(stack.count)
//print(stack.peek())
//stack.pop()
//print(stack.description)

//let queue = Queue<Int>()
//queue.push(5)
//queue.push(10)
//queue.push(8)
//queue.push(3)
//print(queue.count)
//print(queue.peek())
//queue.pop()
//print(queue.description)


//let bag = Bag<Int>()
//bag.add(item: 5)
//bag.add(item: 10)
//bag.add(item: 3)
//bag.add(item: 8)
//print(bag.description)

//print(createGraph())
//repeatSequence()
//tomatoFarm()
//topologicalSort()

let solution = Solution()
//print(solution.canFinish(2, [[0,1]]))
print(solution.findOrder(2, [[1,0]]))
