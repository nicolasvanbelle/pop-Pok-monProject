//
//  ViewController.swift
//  PokemonProject
//
//  Created by Nicolas Van Belle on 19/05/2019.
//  Copyright © 2019 Nicolas Van Belle. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        sceneView.autoenablesDefaultLighting = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "Pokemon Cards", bundle: Bundle.main) {
            
            configuration.detectionImages = imageToTrack
            
            configuration.maximumNumberOfTrackedImages = 4
            
            print("Images Successfully Added")
        }
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    //anchor is image dat detected is method wordt gecalled
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        //Check is its an ARIMageAnchor
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.5)
            
            let planeNode = SCNNode(geometry: plane)
            
            //In radialen :(
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if imageAnchor.referenceImage.name == "eevee" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/eevee.scn") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi / 2
                        
                        planeNode.addChildNode((pokeNode))
                        
                    }
                    
                }
            }
            
            if imageAnchor.referenceImage.name == "magikarp" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/magikarp.scn") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi / 2
                        
                        planeNode.addChildNode((pokeNode))
                        
                    }
                    
                }
            }
            
            if imageAnchor.referenceImage.name == "charmander" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/charmander.scn") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi / 2
                        
                        planeNode.addChildNode((pokeNode))
                        
                    }
                    
                }
            }
            
            if imageAnchor.referenceImage.name == "pikachu" {
                
                if let pokeScene = SCNScene(named: "art.scnassets/pikachu.scn") {
                    
                    if let pokeNode = pokeScene.rootNode.childNodes.first {
                        
                        pokeNode.eulerAngles.x = .pi / 2
                        
                        planeNode.addChildNode((pokeNode))
                        
                    }
                    
                }
            }
            
            
            
        }

        return node
        
    }
    
}
