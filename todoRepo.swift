import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


class TodoMethod: ObservableObject {

    private let path: String = "todo"
    private let store = Firestore.firestore()
    @Published var todos: [Todo] = []

    
    
    init(){
        read()
    }

    func create(_ todo: Todo) {
        do {
            _ = try store.collection(path).addDocument(from: todo)
        } catch {
            fatalError("todo 를 추가할 수 없어요.")
        }
    }
    
    func read(){
        store.collection(path)
            .addSnapshotListener{ QuerySnapshot, error in
                
                self.todos = QuerySnapshot?.documents.compactMap{ document in
                    try? document.data(as: Todo.self)
                } ?? []
                
                
            }
    }

    
}

