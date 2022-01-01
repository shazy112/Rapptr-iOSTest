//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: BaseViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    @IBOutlet weak private var logoImageView: UIImageView!
    @IBOutlet weak private var fadeInButton: PrimaryButton!
    private var isFadeIn: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        setupImageView()
    }
    
    // MARK: - Supporting Methods
    private func dragLogoImageView(gesture: UIPanGestureRecognizer) {
        //the translation method returns the amount of user's finger moved.
        let translation = gesture.translation(in: logoImageView)
        guard let gestureView = gesture.view else { return }
        
        //Assigning the received translations to frame the gesture View
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        
        //It’s important to set the translation back to zero once you finish. Otherwise, the translation will keep compounding
        gesture.setTranslation(.zero, in: logoImageView)
    }
    
    private func setupImageView() {
        //Setting up logo ImageView recognizer so that it can be moved through fingers
        let tapGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(imageTapped))
        logoImageView.addGestureRecognizer(tapGestureRecognizer)
        
        //setting up logoImageView Frame
        logoImageView.frame = CGRect(x: self.view.frame.size.width/2 - logoImageView.frame.size.width/2,
                                     y: 140, width: logoImageView.frame.width,
                                     height: logoImageView.frame.height)
    }
    
    private func setupFadeAnimation() {
        if !isFadeIn {
            logoImageView.fadeOut()
            fadeInButton.setTitle(Constants.fadeOut, for: .normal)
            
        } else {
            logoImageView.fadeIn()
            fadeInButton.setTitle(Constants.fadeIn, for: .normal)
        }
        isFadeIn.toggle()
    }
    
    // MARK: - ACTIONS
    @objc func imageTapped(_ gesture: UIPanGestureRecognizer) {
        dragLogoImageView(gesture: gesture)
    }
    
    @IBAction func didPressFade(_ sender: Any) {
        setupFadeAnimation()
    }
}
