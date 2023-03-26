import Foundation
import CoreData

class LoginDataController {
    static let shared = LoginDataController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "LoginModel")
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
