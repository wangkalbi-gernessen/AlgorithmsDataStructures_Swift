//
//  CourseSchedule_II.swift
//  AlgorithmsDataStructures
//
//  Created by Kazunobu Someya on 2021-04-07.
//

import Foundation

class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // create adjacentList
        var adjacentList = [[Int]](repeating: [Int](), count: numCourses + 1)
        // create indegrees array
        var indegrees: [Int] = [Int](repeating: 0, count: numCourses + 1)
        //
        let edges = prerequisites.count
        
        for edge in 0..<edges {
            let from = prerequisites[edge][1]
            let to = prerequisites[edge][0]
            adjacentList[from].append(to)
            indegrees[to] += 1
        }

        // insert indegree-zero's vertices into queue
        var queue: [Int] = []
        for i in 0..<numCourses {
            if indegrees[i] == 0 {
                queue.append(i)
            }
        }
        
        var answer: [Int] = []
        var count = 0
        
        while !queue.isEmpty {
            let dequeueValue = queue.removeFirst()
            answer.append(dequeueValue)
            count += 1
            
            for i in adjacentList[dequeueValue] {
                indegrees[i] -= 1
                if indegrees[i] == 0 {
                    queue.append(i)
                }
            }
        }
        
        if count != numCourses {
            return []
        }

        return answer
    }
}
