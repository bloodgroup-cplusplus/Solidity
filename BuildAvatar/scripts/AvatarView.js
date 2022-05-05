// will be what will hold our rendering logic. 
// We will need the Dom reference from the rendered div, so the Three.js
// renderer will know where to draw
//

import React from 'react'
import * as THREE from "three" const navigationBarHeight = 100
export class AvatarView extends ReactComponent
{
    mainViewRef = React createRef()
    render = () => {
        <div 
        ref = {this mainViewRef}
        className = "avatarView"
        style = {{
            display:${this pros showIFram? block:'none'}
        }}


        />

    }}

// Import Three.js (second line ) and override DidMount in AvatarView .
// Then we can create a new WebGLRenderer, Configure it to fit our window and 
// some other lighting settings
// After that, append it onto our main view 



async componentDidMount()
{
    const mainView = this mainViewRef.current 
    this renderer = new THREE WebGLRenderer({antialias:true})
    this renderer.setSize(window.innerWidth, window.innerHeight - navigationBarHeight)
    this.renderer.outputEncoding = THREE.SRGBEncoding
    this.renderer.toneMapping = THREE.ACESFilmicToneMapping
    main View.appendChild (this.renderer.domElement)

// adding the camera and scene will allow us to view our model 
    // we will be loading a 3d file to supply both the scenes background
    // texture and the lighting 
    // we will also add the orbit controls from the three.js exmaple to 
    // better inspect our ready player me.

  const mainView = this.mainViewRef.current  this.renderer = new THREE.WebGLRenderer({ antialias: true })
  this.renderer.setSize(window.innerWidth, window.innerHeight - navigationBarHeight)
  this.renderer.outputEncoding = THREE.sRGBEncoding
  this.renderer.toneMapping = THREE.ACESFilmicToneMapping  mainView.appendChild(this.renderer.domElement)  this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / (window.innerHeight - navigationBarHeight), 0.1, 1000)

  this.camera.position.set(0, 0, 3)
  this.controls = new OrbitControls(this.camera, this.renderer.domElement)// We will use the lighting from the background instead of creating our own
  const background = await this.loadBackground(backgroundUrl, this.renderer)
  this.scene = new THREE.Scene()
  this.scene.environment = background
  this.scene.background = background
    
}
// add a loader function to help us get the file added to our environemt 

loadBackground (url.renderer)
{
    return new Promise((resolve)) =>{
        const loader = new RGBELoader()
        const generator = new THREE.PMREMGenerator(renderer)
        loader load(url, texture) =>{
            const envMap = generator.fromEquirectangular(texture) texture
            generator.dispose()
            texture.dispose()
            resolve(envMap)
        })
    })
}




