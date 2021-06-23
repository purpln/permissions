import Foundation

extension Array where Element: Equatable {
    
    var duplicates: [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == true {
                result.append(value)
            }
        }
        return result
    }
    
    func removedDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
