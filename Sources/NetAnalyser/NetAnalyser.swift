
import Foundation


public class NetworkAnalyser {

    public static let instance = NetworkAnalyser()
    fileprivate init() { }
    
    var storageBackend: NetworkStorage = SQLiteStorage.instance
    
}
