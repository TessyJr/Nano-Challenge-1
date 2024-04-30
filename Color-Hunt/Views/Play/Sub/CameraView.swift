import SwiftUI
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    
    // read pic data
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    // pic data\
    @Published var capturedImage: UIImage? = nil
    
    var playViewModel: PlayViewModel? // Add this property
    
    func Check() {
        //check camera permission
        switch AVCaptureDevice.authorizationStatus(for: .video){
            
        case .authorized:
            setUp()
            return
            
            //setup session
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
            print("error disini2")
            print(error.localizedDescription)
        }
    }
    
    func startCamera() {
        self.isTaken = false
        self.session.startRunning()
    }
    
    func stopCamera() {
        self.isTaken = true
        self.session.stopRunning()
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
        self.stopCamera()
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
}

// Setting preview
struct CameraPreview: UIViewRepresentable {
    @ObservedObject var camera : CameraModel
    var playViewModel: PlayViewModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .init(x: 90, y: -150, width: 311, height: 321))
        let customSize = CGSize(width: 311, height: 311) // Change these values to your desired size
        
        let viewController = UIViewController()
        
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = CGRect(origin: .init(x: 0, y: 0), size: customSize)
        camera.preview.position = CGPoint(x: 155.5, y: 155.5)
        //own properti
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        
        //starting
        camera.session.startRunning()
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
