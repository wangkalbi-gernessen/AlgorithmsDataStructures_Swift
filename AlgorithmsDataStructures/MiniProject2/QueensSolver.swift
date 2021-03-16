//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0

func solveQueens(_ n: Int) -> [[String]] {
    var solutions =  [[String]]()
    var board = Board(size: 8)
    solveQueenHelper(&board, 0)
    return solutions
}

func solveQueenHelper(_ board: inout Board, _ col: Int) {
    for i in 0..<board.size {
        if board.isSafe(row: i, col: col) {
            board.place(row: i, col: col)
            solveQueenHelper(&board, col + 1)
            board.remove(row: i, col: col)
        }
    }
}
