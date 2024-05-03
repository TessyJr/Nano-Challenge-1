import SwiftUI
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    // read pic data
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    // Captured Picture
    @Published var capturedImage: UIImage? = nil
    
    // View Model
    var playViewModel: PlayViewModel?
    
    // Zoom data
    @Published var maxZoom: CGFloat = 1.0 // Set your desired max zoom level
    @Published var currentZoom: CGFloat = 1.0
    
    func checkAuthorization() {
        //check camera permission
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .authorized:
            //setup session
            setUp()
            return
            
        case .notDetermined:
            //retusting
            AVCaptureDevice.requestAccess(for: .video){(status) in
                if status {
                    self.setUp()
                }
            }
            
        case .denied:
            alert.toggle()
            return
            
        default:
            return
        }
    }
    
    func setUp(){
        //set camera
        do{
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                 for:.video, position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            //check and add session
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }catch{
            print("Error setting up camera")
            print(error.localizedDescription)
        }
        
        // Determine the maximum zoom level
        if let device = AVCaptureDevice.default(for: .video) {
            maxZoom = min(device.maxAvailableVideoZoomFactor, 5.0) // Limit to a maximum of 5.0
        } else {
            print("Failed to get AVCaptureDevice")
        }
    }
    
    func takePic() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        }
        
        DispatchQueue.main.async {
            self.isTaken = true
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation(),
              let image = UIImage(data: imageData) else {
            print("Error converting AVCapturePhoto to UIImage: \(error?.localizedDescription ?? "Unknown error")")
            return
        }
        
        // Save cropped image
        let croppedImage = cropImageToSquare(image: image)!
        self.capturedImage = croppedImage
        
        // Save image to viewModel and calcualte average color
        playViewModel!.selectedImage = croppedImage
        playViewModel!.calculateImageAverageColor()
        
        // Stop the camera
        self.isTaken = true
        self.session.stopRunning()
    }
    
    func cropImageToSquare(image: UIImage) -> UIImage? {
        guard let cgImage = image.cgImage else {
            return nil
        }
        
        let width = CGFloat(cgImage.width)
        let height = CGFloat(cgImage.height)
        
        let size = min(width, height)
        let x = (width - size) / 2.0
        let y = (height - size) / 2.0
        
        let cropRect = CGRect(x: x, y: y, width: size, height: size)
        
        if let croppedCGImage = cgImage.cropping(to: cropRect) {
            return UIImage(cgImage: croppedCGImage, scale: image.scale, orientation: image.imageOrientation)
        }
        
        return nil
    }
    
    func reTake() {
        self.capturedImage = nil
        playViewModel?.selectedImage = nil
        playViewModel?.uicAverageColor = UIColor.clear
        self.isTaken = false
        self.setUp()
    }
    
    // Function to set zoom factor
    func setZoom(factor: CGFloat) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            try device.lockForConfiguration()
            defer { device.unlockForConfiguration() }
            
            let zoomFactor = max(1.0, min(factor, maxZoom))
            device.videoZoomFactor = zoomFactor
            currentZoom = zoomFactor
        } catch {
            print("Failed to set zoom level: \(error.localizedDescription)")
        }
    }
}

// Setting preview
struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera: CameraModel
    var playViewModel: PlayViewModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300))
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        camera.session.startRunning()
        
        // Add pinch gesture recognizer
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinchGesture(_:)))
        view.addGestureRecognizer(pinchGesture)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // No updates needed for now
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Coordinator to handle gesture events
    class Coordinator: NSObject {
        var parent: CameraPreview
        
        init(_ parent: CameraPreview) {
            self.parent = parent
        }
        
        @objc func handlePinchGesture(_ gesture: UIPinchGestureRecognizer) {
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            
            if gesture.state == .changed {
                let maxZoom = parent.camera.maxZoom
                let currentZoom = parent.camera.currentZoom
                let scaleFactor: CGFloat = 0.1 // Adjust this factor to make the pinch gesture less sensitive
                var newZoom = currentZoom * (1.0 + (gesture.scale - 1.0) * scaleFactor)
                
                // Ensure new zoom stays within bounds
                newZoom = min(maxZoom, max(1.0, newZoom))
                
                do {
                    try device.lockForConfiguration()
                    defer { device.unlockForConfiguration() }
                    
                    device.videoZoomFactor = newZoom
                    parent.camera.currentZoom = newZoom
                } catch {
                    print("Failed to set zoom level: \(error.localizedDescription)")
                }
            }
        }
    }
}
