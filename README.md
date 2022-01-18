How to make a parallax background in just one draw call?
---------

Issue
---------
- Traditional way of parallax background is to put each layer of the background into separate game object
- If the background has for example 11 layers and we will use sprite renderer per game object, unity will do 11 draw calls

Solution
---------
- Create a shader that will be projecting all 11 layers into quad and trigger just one draw call per frame

How does it work?
---------
- Alpha masks are multiplied layer by layer
- After each multiplication is pixel colored by current layer texture
- Black / White alpha masks just defined area which pixel is colored by new appended layer

Alpha masks of the layers 

![ParallaxBackgroundAlphaMask](https://user-images.githubusercontent.com/14979589/150011647-8682e184-7719-4a46-ba29-cbadc99b1a2d.gif)

Building process of the parallax

![ParallaxBackground](https://user-images.githubusercontent.com/14979589/150011655-1c623acb-d954-4d21-994f-f33cf73e26d8.gif)
---------



