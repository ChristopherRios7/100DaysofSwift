    //
    //  ContentView.swift
    //  Drawing
    //
    //  Created by Christopher Rios on 9/27/23.
    //

import SwiftUI

////struct Spirograph: Shape {
////    let innerRadius: Int
////    let outerRadius: Int
////    let distance: Int
////    let amount: Double
////    
////    
////    func gcd(_ a: Int, _ b: Int) -> Int {
////        var a = a
////        var b = b
////        
////        while b != 0 {
////            let temp = b
////            b = a % b
////            a = temp
////        }
////        
////        return a
////    }
////    
////    func path(in rect: CGRect) -> Path {
////        let divisor = gcd(innerRadius, outerRadius)
////        let outerRadius = Double(self.outerRadius)
////        let innerRadius = Double(self.innerRadius)
////        let distance = Double(self.distance)
////        let difference = innerRadius - outerRadius
////        let endPoint = ceil(2 * Double.pi * outerRadius / Double(divisor)) * amount
////        var path = Path()
////        
////        for theta in stride(from: 0, through: endPoint, by: 0.01) {
////            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
////            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
////            
////            x += rect.width / 2
////            y += rect.height / 2
////            
////            if theta == 0 {
////                path.move(to: CGPoint(x: x, y: y))
////            } else {
////                path.addLine(to: CGPoint(x: x, y: y))
////            }
////        }
////        
////        return path
////    }
////}
//
//
//struct Arrow: Shape {
//    var headHeight = 0.5
//    var shaftWidth = 0.5
//    
//    var animatableData: AnimatablePair<Double,Double> {
//        get { AnimatablePair(headHeight, shaftWidth) }
//        set {
//            headHeight = newValue.first
//            shaftWidth = newValue.second
//        }
//    }
//    
//    func path(in rect: CGRect) -> Path {
//        let height = rect.height * headHeight
//        let thickness = rect.width * shaftWidth / 2
//        return Path { path in
//            path.move(to: CGPoint(x: rect.midX, y: 0))
//            path.addLine(to: CGPoint(x: rect.maxX, y: height))
//            path.addLine(to: CGPoint(x: rect.midX + thickness, y: height))
//            path.addLine(to: CGPoint(x: rect.midX + thickness, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.midX - thickness, y: rect.maxY))
//            path.addLine(to: CGPoint(x: rect.midX - thickness, y: height))
//            path.addLine(to: CGPoint(x: 0, y: height))
//            
//            path.closeSubpath()
//        }
//    }
//}
//
//struct ContentView: View {
////    @State private var innerRadius = 125.0
////    @State private var outerRadius = 75.0
////    @State private var distance = 25.0
////    @State private var amount = 1.0
////    @State private var hue = 0.6
//    @State private var headHeight = 0.5
//    @State private var shaftWidth = 0.25
//    var body: some View {
//        Arrow(headHeight: headHeight, shaftWidth: shaftWidth)
//            .fill(.blue)
//            .onTapGesture {
//                withAnimation{
//                    headHeight = Double.random(in: 0.2...0.8)
//                    shaftWidth = Double.random(in: 0.2...0.8)
//                }
//            }
//    }
//}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var gradientStartX = 0.5
    var gradientStartY = 0.0
    
    var gradientEndX = 0.5
    var gradientEndY = 1.0
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: gradientStartX, y: gradientStartY),
                            endPoint: UnitPoint(x: gradientEndX, y: gradientEndY)
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var colorCycle = 0.0
    
    @State private var gradientStartX = 0.5
    @State private var gradientStartY = 0.0
    @State private var gradientEndX = 0.5
    @State private var gradientEndY = 1.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle, gradientStartX: gradientStartX, gradientStartY: gradientStartY, gradientEndX: gradientEndX, gradientEndY: gradientEndY)
                .frame(width: 300, height: 300)
            
            HStack {
                Text("Color")
                Slider(value: $colorCycle)
            }
            
            HStack {
                Text("Start X")
                Slider(value: $gradientStartX)
            }
            
            HStack {
                Text("Start Y")
                Slider(value: $gradientStartY)
            }
            
            HStack {
                Text("End X")
                Slider(value: $gradientEndX)
            }
            
            HStack {
                Text("End Y")
                Slider(value: $gradientEndY)
            }
        }
    }
}

#Preview {
    ContentView()
}
