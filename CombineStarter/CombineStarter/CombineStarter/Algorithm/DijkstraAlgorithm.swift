//
//  DijkstraAlgorithm.swift
//  CombineStarter
//
//  Created by Aung Ko Ko on 27/09/2023.
//

import Foundation

class DijkstraAlgorithmGraph {
    var adjacencyList: [String: [String: Double]] = [:]
    
    // Add an edge to the graph
    func addEdge(from source: String, to destination: String, weight: Double) {
        if adjacencyList[source] == nil {
            adjacencyList[source] = [:]
        }
        adjacencyList[source]?[destination] = weight
    }
}

class DijkstraAlgorithmUseCase {
    
    func dijkstra(graph: DijkstraAlgorithmGraph, startNode: String) -> [String: (Double, [String])] {
        var distances: [String: Double] = [:]
        var predecessors: [String: String] = [:]
        var visited: Set<String> = []
        
        for node in graph.adjacencyList.keys {
            distances[node] = Double.infinity
            predecessors[node] = ""
        }
        distances[startNode] = 0
        
        while !visited.isSuperset(of: graph.adjacencyList.keys) {
            guard let current = minDistanceNode(distances: distances, visited: visited) else {
                break
            }
            visited.insert(current)
            
            if let neighbors = graph.adjacencyList[current] {
                for (neighbor, weight) in neighbors {
                    if let currentDistance = distances[current], let neighborDistance = distances[neighbor] {
                        let tentativeDistance = currentDistance + weight
                        if tentativeDistance < neighborDistance {
                            distances[neighbor] = tentativeDistance
                            predecessors[neighbor] = current
                        }
                    }
                }
            }
        }
        
        var shortestPaths: [String: (Double, [String])] = [:]
        for node in graph.adjacencyList.keys {
            var path: [String] = []
            var currentNode = node
            while currentNode != startNode {
                if let predecessor = predecessors[currentNode] {
                    path.insert(currentNode, at: 0)
                    currentNode = predecessor
                } else {
                    break
                }
            }
            if currentNode == startNode {
                path.insert(startNode, at: 0)
                shortestPaths[node] = (distances[node]!, path)
            } else {
                // Handle unreachable nodes
                shortestPaths[node] = (Double.infinity, [])
            }
        }
        
        return shortestPaths
    }
    
    func minDistanceNode(distances: [String: Double], visited: Set<String>) -> String? {
        var minDistance = Double.infinity
        var minNode: String?
        
        for (node, distance) in distances {
            if !visited.contains(node) && distance < minDistance {
                minDistance = distance
                minNode = node
            }
        }
        
        return minNode
    }
}
