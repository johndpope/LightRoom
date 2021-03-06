import UIKit
import LightRoom

let image1 = CIImage(image: #imageLiteral(resourceName: "sample.jpg"))!
let image2 = CIImage(image: #imageLiteral(resourceName: "sample2.jpg"))!

let color = CIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
let blendImage = LightRoom.Generator.ConstantColorGenerator(cropRect: image1.extent, color: color)
let addition = LightRoom.CompositeOperation.AdditionCompositing()
let overlay = LightRoom.CompositeOperation.OverlayBlendMode()
let crystal = LightRoom.Stylize.Crystallize(radius: 10, center: nil)
let colorControl = LightRoom.ColorAdjustment.ColorControls(saturation: 0.5, brightness: 0, contrast: 1)
let colorControl2 = LightRoom.ColorAdjustment.ColorControls(saturation: 0, brightness: 0, contrast: 1)

image1 >>> colorControl --* addition
             blendImage >>> addition --* overlay
            image2 >>> colorControl2 >>> overlay

(overlay >>> crystal).outputImage



