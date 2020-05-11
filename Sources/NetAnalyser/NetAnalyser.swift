
import Foundation


public class NetworkAnalyser {

    public static let instance = NetworkAnalyser()
    fileprivate init() { }
    
    public var storageBackend: NetworkStorage = SQLiteStorage.instance
    
}
