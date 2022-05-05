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




// Now that we have our scene and camera created, we can create our render loop

async componentDidMount()
{
    this.renderer.setAnimationLoop(this.renderScene.bind(this))
}


renderScene()
{
    this.renderer.render(this.scene,this.camera)
}

//loading the model 
//use the built-in three.js GLTF loader to add the ready player me into the scene suing hte URL returened from IFRMAEM
// additional code changes the position and scale to amake the model beteter fitlt the screen
//
async loadModel ()
{
    const gltf = await this.loadGLTF(this.props.avatarURL)
    this.avatar = gltf.scene.childern[0]
    this.avatar.position.set(0,-4,0)
    this.avatar.scale.setScalar(7.5) this scene.add(this avatar)
}

// add the helper function 
loadGLTF ( url)
{
    return new Promise ( (resolve) = > 
        {
            const  loader = new.GLTFLoader()
            loader.load(url, (gltf) => resolve(gltf))
        })
}

// call the function in component did mount

async componentDidMount()
{
    this.loadModel()
}


// and overload component did update and add some logic to hid the renderer while the iframe is open 

async componentDidUpdate (oldProps)
{
    if(this.props?avatarURL && this.props?.avatarUrl ! == oldProps?avatarUrl)
    {
        this.loadModel()
    }

    this.renderer.domElement.style.cssText = `display: ${!this.props.showIFrame ? 'block': 'none'}`
}

