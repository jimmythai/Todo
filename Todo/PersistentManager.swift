//
//  PersistentManager.swift
//  Todo
//
//  Created by Atsushi Yamamoto on 2022/10/01.
//

import CoreData

//struct PersistenceManager {
//    static let shared = PersistenceManager()
//
//    let persistentContainer = NSPersistentContainer(name: "Todo")
//
//    init(inMemory: Bool = false) {
//        if inMemory {
//            persistentContainer.persistentStoreDescriptions.first?.url = .init(fileURLWithPath: "/dev/null")
//        }
//        
//        persistentContainer.loadPersistentStores { _, error in
//            guard let error = error as? NSError else { return }
//            
//            fatalError("Unable to configure Core Data Store: \(error), \(error.userInfo)")
//        }
//    }
//    
//    static var preview: PersistenceManager = {
//        let result = PersistenceManager(inMemory: true)
//        let viewContext = result.persistentContainer.viewContext
//        for friendNumber in 0..<10 {
//            let newFriend = Friend(context: viewContext)
//            newFriend.name = "Friend \(friendNumber)"
//            newFriend.avatarName = "person.circle.fill"
//            newFriend.meetingDate = Date()
//            newFriend.meetingPlace = "Place \(friendNumber)"
//        }
//        do {
//            try viewContext.save()
//        } catch {
//            let nsError = error as NSError
//            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//        }
//        return result
//    }()
//}
//
//
//protocol CoreDataHelperProtocol {
//    func create<T>(type: T.Type, managedObjectContext: NSManagedObjectContext, completion: @escaping ((T) -> Void))
//    func fetch<T>(type: T.Type, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, relationshipKeysToFetch: [String]?, managedObjectContext: NSManagedObjectContext, completion: @escaping (([T]?) -> Void))
//    func fetch<T>(type: T.Type, predicate: NSPredicate?, managedObjectContext: NSManagedObjectContext, completion: @escaping (([T]?) -> Void))
//    func fetch<T>(type: T.Type, predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?, managedObjectContext: NSManagedObjectContext, completion: @escaping (([T]?) -> Void))
//    func fetchCount<T>(type: T.Type, predicate: NSPredicate, managedObjectContext: NSManagedObjectContext, completion: @escaping ((Int) -> Void))
//}
