import SwiftUI

// View representing the camera access
struct AccessCameraView: UIViewControllerRepresentable {
    // Environment object to for view model
    @EnvironmentObject var playViewModel: PlayViewModel
    
    @Environment(\.presentationMode) var isPresented
    
    // Function to create the UIImagePickerController
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        //        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Not needed for this implementation
    }
    
    // Coordinator to handle image picking
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator to handle image picking
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: AccessCameraView
    
    init(picker: AccessCameraView) {
        self.picker = picker
    }
    
    // Function called when image is picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.playViewModel.selectedImage = selectedImage
        self.picker.playViewModel.calculateImageAverageColor()
        
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

