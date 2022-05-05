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

}



