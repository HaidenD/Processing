var vertextShaderText = 
[
    'precision mediump float;',
    '',
    'attribute vec2 vertPosition;',
    'attribute vec3 vertColor;',
    'varying vec3 fragColor;',
    '',
    'void main()',
    '{',
    '   fragColor = vertColor;',
    '   gl_Position =  vec4(vertPosition, 0.0, 1.0);',
    '}'
].join('\n');

var fragmentShaderText = 
[
    'precision mediump float;',
    '',
    'varying vec3 fragColor;',
    'void main()',
    '{',
    '   gl_FragColor = vec4(fragColor, 1.0);',
    '}'
].join('\n');



var initdemo = function() {
    console.log("This is working")
    
    var canvas = document.getElementById('window-surface');

    //Step one is init webgl;
    var gl = canvas.getContext('webgl');

    if(!gl){
        console.log("WebGl not supported, using experimental-webgl");
        gl = canvas.getContext('experimental-webgl');
    }

    if(!gl){
        alert("Your browser sucks");
    }

    //canvas.width =  window.innerWidth;
    //canvas.height =  window.innerHeight;
   // gl.viewport(0,0, window.innerWidth, window.innerHeight);

    //gl.clearColor(R, G, B , A);

    gl.clearColor(.75, .85, .8, 1);

    //gl.clear(argument) 

    gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

    //vertex shader: 

    var vertexShader = gl.createShader(gl.VERTEX_SHADER);
    var fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);

    gl.shaderSource(vertexShader, vertextShaderText);
    gl.shaderSource(fragmentShader, fragmentShaderText);

    gl.compileShader(vertexShader);
    if (!gl.getShaderParameter(vertexShader, gl.COMPILE_STATUS)) {
        console.error("ERROR compiling vertex shader!", gl.getShaderInfoLog(vertexShader));
        return;
    }
    gl.compileShader(fragmentShader);
        if (!gl.getShaderParameter(fragmentShader, gl.COMPILE_STATUS)) {
        console.error("ERROR compiling fragment shader!", gl.getShaderInfoLog(fragmentShader));
        return;
    }

    var program = gl.createProgram();
    gl.attachShader(program, vertexShader);
    gl.attachShader(program, fragmentShader);

    gl.linkProgram(program);
    if(!gl.getProgramParameter(program, gl.LINK_STATUS)){
        console.error("error linking program", gl.getProgramInfoLog(program));
        return;
        }
    
    
    gl.validateProgram(program);
     if (!gl.getProgramParameter(program, gl.VALIDATE_STATUS)) {
         console.error("error validating program!", gl.getProgramInfoLog(program));
         return;
     }

     //
     //CreateBuffer
     //

     var triangleVertices = 
     [ // X , Y // counter clockwise; R , G , B
        0.0, 0.5,                     1.0, 1.0, 0.0, 
        -0.5, -0.5,                   0.7, 0.0, 1.0,
        0.5, -0.5,                    0.1, 1.0, 0.6
     ];


     var triangleVertexBufferObject = gl.createBuffer();
     gl.bindBuffer(gl.ARRAY_BUFFER, triangleVertexBufferObject);
     //gl.bufferData(gl.ARRAY_BUFFER, triangleVertices, gl.STATIC_DRAW);
     gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(triangleVertices), gl.STATIC_DRAW);

     var positionAttribLocation = gl.getAttribLocation(program, 'vertPosition');
     var colorAttribLocation = gl.getAttribLocation(program, 'vertColor');
     gl.vertexAttribPointer(
        positionAttribLocation, //attribute location in our c file
        2, // number of elements per attribute
        gl.FLOAT, // type of elements
        gl.False,
        5 * Float32Array.BYTES_PER_ELEMENT, // size of inidividual vertextShaderText
        0 // offset from the beginning of a single vertex to this attribute
     );
    gl.vertexAttribPointer(
        colorAttribLocation, //attribute location in our c file
        3, // number of elements per attribute
        gl.FLOAT, // type of elements
        gl.False,
        5 * Float32Array.BYTES_PER_ELEMENT, // size of inidividual vertextShaderText
        2 * Float32Array.BYTES_PER_ELEMENT // offset from the beginning of a single vertex to this attribute
     );

     gl.enableVertexAttribArray(positionAttribLocation);
     gl.enableVertexAttribArray(colorAttribLocation);

     //
     // Main render Loop
     //

     gl.useProgram(program);
     gl.drawArrays(gl.TRIANGLES, 0, 3 );

};
















/*function vertexShader(vertPosition, vertColor ) {
    return {
        fragColor: vertColor,
        gl_Position: [vertPosition.x, vertPosition.y,  0.0, 0.1]
    };
};*/


