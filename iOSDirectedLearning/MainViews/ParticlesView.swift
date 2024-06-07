import UIKit
import SwiftUI

struct ParticlesViewRepresentable: UIViewRepresentable {
    var bgColor: UIColor = .black
    var strokeColor: UIColor = .white
    var maxDistance: CGFloat = 300
    var numberOfParticles: Int = 30

    func makeUIView(context: Context) -> ParticlesView {
        return ParticlesView(
            frame: .zero,
            bgColor: bgColor,
            strokeColor: strokeColor,
            numberOfParticles: numberOfParticles,
            maxDistance: maxDistance
            )
    }

    func updateUIView(_ uiView: ParticlesView, context: Context) {}
}

#Preview {
    ParticlesViewRepresentable()
}

fileprivate protocol Particle {
    var position: CGPoint { get set }
    var speed: CGPoint { get set }
    func updatePosition(bounds: CGRect)
}

fileprivate final class BasicParticle: NSObject, Particle {
    var position: CGPoint
    var speed: CGPoint

    init(position: CGPoint, speed: CGPoint) {
        self.position = position
        self.speed = speed
    }

    func updatePosition(bounds: CGRect) {
        if position.x > bounds.width || position.x < 0 {
            speed.x = -speed.x
        }
        if position.y > bounds.height || position.y < 0 {
            speed.y = -speed.y
        }
        position.x += speed.x
        position.y += speed.y
    }
}

fileprivate final class ParticleSystem {
    private(set) var particles: [Particle] = []
    let numberOfParticles: Int
    private var bounds: CGRect

    init(numberOfParticles: Int, initialBounds: CGRect) {
        self.numberOfParticles = numberOfParticles
        self.bounds = initialBounds
        initializeParticles()
    }

    func updateBounds(_ newBounds: CGRect) {
        bounds = newBounds
        initializeParticles()
    }

    private func initializeParticles() {
        particles = (0..<numberOfParticles).map { _ in
            BasicParticle(
                position: RandomGenerator.randomPosition(in: bounds),
                speed: RandomGenerator.randomSpeed(speedMultiplier: 0.5)
            )
        }
    }

    func updateParticles() {
        for particle in particles {
            particle.updatePosition(bounds: bounds)
        }
    }
}

fileprivate final class ParticleRenderer {
    private let maxDistance: CGFloat

    private let bgColor: UIColor
    private let strokeColor: CGColor

    init(maxDistance: CGFloat, bgColor: UIColor, strokeColor: UIColor = UIColor.white) {
        self.maxDistance = maxDistance
        self.bgColor = bgColor
        self.strokeColor = strokeColor.cgColor
    }

    func drawParticles(particles: [Particle], in context: CGContext, bounds: CGRect) {
        for i in 0..<particles.count {
            for j in i+1..<particles.count {
                let particle1 = particles[i]
                let particle2 = particles[j]

                let distance = distanceSquared(
                    position1: particle1.position,
                    point2: particle2.position
                )

                if distance < maxDistance {
                    let factor = getFactor(for: distance)
                    context.beginPath()
                    context.setStrokeColor(strokeColor)
                    context.setAlpha(factor)
                    context.setLineWidth(factor)
                    context.move(to: CGPoint(
                        x: 0.5 + particle1.position.x,
                        y: 0.5 + particle1.position.y)
                    )
                    context.addLine(to: CGPoint(
                        x: 0.5 + particle2.position.x,
                        y: 0.5 + particle2.position.y)
                    )
                    context.strokePath()
                }
            }
        }

    }

    func drawBackground(in context: CGContext, bounds: CGRect) {
        let background = bgColor
        background.setFill()
        context.fill(bounds)
    }

    private func distanceSquared(position1: CGPoint, point2: CGPoint) -> CGFloat {
        let dx = position1.x - point2.x
        let dy = position1.y - point2.y

        let absDx = abs(dx)
        let absDy = abs(dy)

        let distance = absDx + absDy

        return distance
    }

    private func getFactor(for distance: CGFloat) -> CGFloat {
        let distanceDifference = maxDistance - distance
        let normalizedDistanceDifference = distanceDifference / maxDistance
        let factor = normalizedDistanceDifference * normalizedDistanceDifference
        return factor
    }
}

fileprivate final class ParticleAnimator {
    private var displayLink: CADisplayLink?
    private weak var view: UIView?

    init(view: UIView) {
        self.view = view
    }

    func startAnimating() {
        displayLink = CADisplayLink(target: self, selector: #selector(update(_:)))
        displayLink?.add(to: .main, forMode: .common)
    }

    func stopAnimating() {
        displayLink?.invalidate()
        displayLink = nil
    }

    @objc func update(_ sender: CADisplayLink) {
        view?.setNeedsDisplay()
    }
}

fileprivate struct RandomGenerator {

    // Function to generate a random CGFloat between 0 and 1
    private static func randomValue() -> CGFloat {
        return CGFloat.random(in: 0...1)
    }

    // Function to generate a random speed vector within specified ranges and a speed multiplier
    static func randomSpeed(
        xRange: ClosedRange<CGFloat> = -1...1,
        yRange: ClosedRange<CGFloat> = -1...1,
        speedMultiplier: CGFloat = 1.0
    ) -> CGPoint {
        let speedVector = CGPoint(
            x: CGFloat.random(in: xRange) * speedMultiplier,
            y: CGFloat.random(in: yRange) * speedMultiplier
        )
        return speedVector
    }

    // Function to generate a random position within given bounds
    static func randomPosition(in bounds: CGRect) -> CGPoint {
        let position = CGPoint(
            x: bounds.width * randomValue(),
            y: bounds.height * randomValue()
        )
        return position
    }
}

class ParticlesView: UIView {
    private var particleSystem: ParticleSystem?
    private var renderer: ParticleRenderer!
    private var animator: ParticleAnimator!

    init(frame: CGRect, bgColor: UIColor, strokeColor: UIColor, numberOfParticles: Int, maxDistance: CGFloat) {
        super.init(frame: frame)
        initializeComponents(
            frame: frame,
            bgColor: bgColor,
            strokeColor: strokeColor,
            numberOfParticles: numberOfParticles,
            maxDistance: maxDistance
        )
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initializeComponents(
        frame: CGRect,
        bgColor: UIColor,
        strokeColor: UIColor,
        numberOfParticles: Int,
        maxDistance: CGFloat
    ) {
        particleSystem = ParticleSystem(
            numberOfParticles: numberOfParticles,
            initialBounds: frame
        )
        renderer = ParticleRenderer(
            maxDistance: maxDistance,
            bgColor: bgColor,
            strokeColor: strokeColor)
        animator = ParticleAnimator(view: self)
    }

    private func commonInit() {
        clearsContextBeforeDrawing = true
        contentMode = .redraw
        clipsToBounds = false
        animator.startAnimating()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if particleSystem == nil {
            particleSystem = ParticleSystem(
                numberOfParticles: 50,
                initialBounds: bounds
            )
        } else {
            particleSystem?.updateBounds(bounds)
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        guard let particleSystem = particleSystem else { return }

        particleSystem.updateParticles()
        renderer.drawBackground(in: context, bounds: rect)
        renderer.drawParticles(
            particles: particleSystem.particles,
            in: context,
            bounds: rect
        )
    }

    deinit {
        animator.stopAnimating()
    }
}
