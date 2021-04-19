//
//  createTwoTiles.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-19.
//

import Foundation

//func createTwoTiles() {
//    if let num = readLine() {
//        if let int = Int(num) {
//            var width: [Int] = [Int](repeating: 0, count: int + 1)
////            width[0] = 0
//            width[1] = 1
//            width[2] = 2
//            
//            for i in 3...int {
//                width[i] = width[i - 1] + width[i - 2]
//            }
//            
//            
//            print(width[int])
//            
//        } else {
//            fatalError("Please enter number")
//        }
//    }
// }

func createTwoTilesSecond() {
    if let num = readLine() {
        if let int = Int(num) {
            var width: [Int] = [Int](repeating: 0, count: int + 1)
            width[1] = 1
            width[2] = 3
            
            for i in 3...int {
                width[i] = width[i - 1] + width[i - 2] * 2
            }
            
            
            print(width[int])
            
        } else {
            fatalError("Please enter number")
        }
    }
 }
