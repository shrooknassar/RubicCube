//! [0]
uniform mat4 mvpMatrix;
uniform mat4 mvMatrix;
uniform mat3 normalMatrix;
uniform vec3 lightPosition;
uniform vec3 leftlightPosition;

attribute vec4 vertex;
attribute vec3 normal;
attribute vec2 textureCoordinate;

varying vec3 varyingNormal;
varying vec3 varyingLightDirection;
varying vec3 varyingViewerDirection;
varying vec2 varyingTextureCoordinate;

void main(void)
{
    vec4 eyeVertex = mvMatrix * vertex;
    eyeVertex /= eyeVertex.w;
    varyingNormal = normalMatrix * normal;
    varyingLightDirection = lightPosition - eyeVertex.xyz;
    //varyingLightDirection += leftlightPosition - eyeVertex.xyz;
    varyingViewerDirection = -eyeVertex.xyz;
    varyingTextureCoordinate = textureCoordinate;
    gl_Position = mvpMatrix * vertex;
}
//! [0]
