// will be what will hold our rendering logic. 
// We will need the Dom reference from the rendered div, so the Three.js
// renderer will know where to draw
//

import React from 'react'
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


