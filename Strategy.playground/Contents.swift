import UIKit

protocol PostProcessing {
    
    func process(image: UIImage) -> UIImage
}

final class Instagram {
    
    var postProcessing: PostProcessing?
    
    func applyFilter(to image: UIImage) {
        postProcessing?.process(image: image)
    }
}

final class SepiaEffect: PostProcessing {
    func process(image: UIImage) -> UIImage {
        print("Added SEPIA effect")
        return image
    }
}

final class BWEffect: PostProcessing {
    func process(image: UIImage) -> UIImage {
        print("Added B&W effect")
        return image
    }
}

let imageFromGallery = UIImage()
let insta = Instagram()

insta.postProcessing = SepiaEffect()
insta.applyFilter(to: imageFromGallery)

insta.postProcessing = BWEffect()
insta.applyFilter(to: imageFromGallery)
