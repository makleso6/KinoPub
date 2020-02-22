//
//  ContentView.swift
//  KinoPub
//
//  Created by Maksim Kolesnik on 13/02/2020.
//  Copyright © 2020 Maksim Kolesnik. All rights reserved.
//

//import SwiftUI
//import Combine
//import AVKit
//
//struct ContentView: View {
//    @ObservedObject var viewModel: RepositoryDetailViewModel
//    @State var show = false
//    var body: some View {
//        VStack {
//            TextField("mirror", text: viewModel.bind)
//            
//            Text("Hello World")
//            Button("Present") {
//                self.show = true
//            }
////            PresentationButton()
////            Button("Present") { self.presentingModal = true }
////            .sheet(isPresented: $presentingModal) { ModalView(presentedAsModal: self.$presentingModal) }
////            Link
////            NavigationLink(destination: TestView(), label: {
////                Text("test")
////            })
////            Push
////            PresentationButton(Text("test"), destination: TestView())
////            Button(action: {
////
////                // your action here
////            }) {
////                Text("Button title")
////            }
//        }
//        .sheet(isPresented: $show, content: { TestView() })
//    }
//}
//
//struct TestView: View {
//    var body: some View {
//        TestImagePickerController()
//    }
//}
//
//struct TestImagePickerController: UIViewControllerRepresentable {
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let av = AVPlayerViewController()
//        if let url = URL.init(string: "https://cdn.streambox.in/pd/kinopub/aWQ9NTQxNTE2OzE0NDY5MzUyNzY7NTQ0ODQ5NjsxNTgxNTgzODUwJmg9R1M2QTQtNzJkNE5TUlkxM3lMam5oZyZlPTE1ODE2NzAyNTA/b/8a/8VQVvIlASWyJ6rq4o.mp4?loc=de") {
//            let player = AVPlayer(url: url)
//            av.player = player
//
//        }
//        return av
//    }
//    
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//        
//    }
//    
//    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//        var parent: TestImagePickerController
//        
//        init(_ imagePickerController: TestImagePickerController) {
//            self.parent = imagePickerController
//        }
//        
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            picker.dismiss(animated: true, completion: nil)
//            let session = URLSession(configuration: .default)
//        }
//    }
//}
//
//
//
//
//
//
//final class RepositoryDetailViewModel: ObservableObject {
////    let objectWillChange: AnyPublisher<RepositoryListViewModel, Never>
////    let objectWillChangeSubject = PassthroughSubject<RepositoryListViewModel, Never>()
//    
//    let networkService: NetworkService
//    
//    init(networkService: NetworkService) {
//        self.networkService = networkService
//    }
//    
//    lazy var bind: Binding<String> = {
//        .init(get: { () -> String in
//            return ""
//        }, set: { [weak self] (newValue) in
//           
//        })
//    }()
//    
//    func call() {
//    }
//}












