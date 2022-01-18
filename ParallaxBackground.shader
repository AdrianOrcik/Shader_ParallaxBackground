Shader "Custom/ParallaxBackground"
{
    Properties
    {
        _VerticalPivot("VerticalPivot", Range(0,0.2)) = 0.0
        _LayerSpeed("LayerSpeed", float) = 0.5
        
        [MaterialToggle] _Layer1Blend("Layer1Blend", Float) = 0
        _LayerTex1 ("Layer1", 2D) = "white" {}
        
        [MaterialToggle] _Layer2Blend("Layer2Blend", Float) = 0
        _LayerTex2 ("Layer2", 2D) = "white" {}
        
        [MaterialToggle] _Layer3Blend("Layer3Blend", Float) = 0
        _LayerTex3 ("Layer3", 2D) = "white" {}
        
        [MaterialToggle] _Layer4Blend("Layer4Blend", Float) = 0
        _LayerTex4 ("Layer4", 2D) = "white" {}
        
        [MaterialToggle] _Layer5Blend("Layer5Blend", Float) = 0
        _LayerTex5 ("Layer5", 2D) = "white" {}
        
        [MaterialToggle] _Layer6Blend("Layer6Blend", Float) = 0
        _LayerTex6 ("Layer6", 2D) = "white" {}
        
        [MaterialToggle] _Layer7Blend("Layer7Blend", Float) = 0
        _LayerTex7 ("Layer7", 2D) = "white" {}
        
        [MaterialToggle] _Layer8Blend("Layer8Blend", Float) = 0
        _LayerTex8 ("Layer8", 2D) = "white" {}
        
        [MaterialToggle] _Layer9Blend("Layer9Blend", Float) = 0
        _LayerTex9 ("Layer9", 2D) = "white" {}
        
        [MaterialToggle] _Layer10Blend("Layer10Blend", Float) = 0
        _LayerTex10 ("Layer10", 2D) = "white" {}
        
        _LayerTex11 ("Layer11", 2D) = "white" {}
        
    }
    SubShader
    {
        Tags { "PreviewType"="Plane" }

        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 quadUV : TEXCOORD0;
            };

            struct v2f
            {
                float2 uvL1 : TEXCOORD0;
                float2 uvL2 : TEXCOORD1;
                float2 uvL3 : TEXCOORD2;
                float2 uvL4 : TEXCOORD3;
                float2 uvL5 : TEXCOORD4;
                float2 uvL6 : TEXCOORD5;
                float2 uvL7 : TEXCOORD6;
                float2 uvL8 : TEXCOORD7;
                float2 uvL9 : TEXCOORD8;
                float2 uvL10 : TEXCOORD9;
                float2 uvL11 : TEXCOORD10;
                float4 vertex : SV_POSITION;
            };

            float _LayerSpeed;
            float _VerticalPivot;

            float _Layer1Blend;
            sampler2D _LayerTex1;
            float4 _LayerTex1_ST;

            float _Layer2Blend;
            sampler2D _LayerTex2;
            float4 _LayerTex2_ST;

            float _Layer3Blend;
            sampler2D _LayerTex3;
            float4 _LayerTex3_ST;

            float _Layer4Blend;
            sampler2D _LayerTex4;
            float4 _LayerTex4_ST;

            float _Layer5Blend;
            sampler2D _LayerTex5;
            float4 _LayerTex5_ST;

            float _Layer6Blend;
            sampler2D _LayerTex6;
            float4 _LayerTex6_ST;

            float _Layer7Blend;
            sampler2D _LayerTex7;
            float4 _LayerTex7_ST;

            float _Layer8Blend;
            sampler2D _LayerTex8;
            float4 _LayerTex8_ST;

            float _Layer9Blend;
            sampler2D _LayerTex9;
            float4 _LayerTex9_ST;

            float _Layer10Blend;
            sampler2D _LayerTex10;
            float4 _LayerTex10_ST;

            sampler2D _LayerTex11;
            float4 _LayerTex11_ST;

            void blendFragmentByAlphaMask(fixed4 alphaMask, fixed4 tex, inout fixed4 fragCol)
            {
                if(alphaMask.r >= 1 && alphaMask.g >= 1 && alphaMask.b >= 1){
                    fragCol = lerp(fragCol, tex, tex.a);
                }
            }

            fixed4 getTextureAlphaFragment(fixed4 tex)
            {
                fixed4 color = fixed4(tex.a, tex.a, tex.a, 1);
                if(color.r > 0)
                    color.r = 1;
                if(color.g > 0)
                    color.g = 1;
                if(color.b > 0)
                    color.b = 1;
                return color;
            }
            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);

                float tmpLayerSpeed = _LayerSpeed;
                float tmpVerticalPivot = _VerticalPivot;
                o.uvL1 = TRANSFORM_TEX(v.quadUV, _LayerTex1);
                o.uvL1 = o.uvL1 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);
                
                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL2 = TRANSFORM_TEX(v.quadUV, _LayerTex2);
                o.uvL2 = o.uvL2 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);
                
                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL3 = TRANSFORM_TEX(v.quadUV, _LayerTex3);
                o.uvL3 = o.uvL3 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL4 = TRANSFORM_TEX(v.quadUV, _LayerTex4);
                o.uvL4 = o.uvL4 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL5 = TRANSFORM_TEX(v.quadUV, _LayerTex5);
                o.uvL5 = o.uvL5 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL6 = TRANSFORM_TEX(v.quadUV, _LayerTex6);
                o.uvL6 = o.uvL6 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL7 = TRANSFORM_TEX(v.quadUV, _LayerTex7);
                o.uvL7 = o.uvL7 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL8 = TRANSFORM_TEX(v.quadUV, _LayerTex8);
                o.uvL8 = o.uvL8 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL9 = TRANSFORM_TEX(v.quadUV, _LayerTex9);
                o.uvL9 = o.uvL9 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                tmpLayerSpeed *= 0.5;
                tmpVerticalPivot *= 0.5;
                o.uvL10 = TRANSFORM_TEX(v.quadUV, _LayerTex10);
                o.uvL10 = o.uvL10 + float2(_Time.y * tmpLayerSpeed, tmpVerticalPivot);

                o.uvL11 = TRANSFORM_TEX(v.quadUV, _LayerTex11);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 pixelCol = 1;
                fixed4 pixelAlpha = 1;
                fixed layersMask = 1;

                fixed4 l1Tex = tex2D(_LayerTex1, i.uvL1);
                fixed4 l1Alpha = getTextureAlphaFragment(l1Tex);

                fixed4 l2Tex = tex2D(_LayerTex2, i.uvL2);
                fixed4 l2Alpha = getTextureAlphaFragment(l2Tex);

                fixed4 l3Tex = tex2D(_LayerTex3, i.uvL3);
                fixed4 l3Alpha = getTextureAlphaFragment(l3Tex);

                fixed4 l4Tex = tex2D(_LayerTex4, i.uvL4);
                fixed4 l4Alpha = getTextureAlphaFragment(l4Tex);

                fixed4 l5Tex = tex2D(_LayerTex5, i.uvL5);
                fixed4 l5Alpha = getTextureAlphaFragment(l5Tex);

                fixed4 l6Tex = tex2D(_LayerTex6, i.uvL6);
                fixed4 l6Alpha = getTextureAlphaFragment(l6Tex);

                fixed4 l7Tex = tex2D(_LayerTex7, i.uvL7);
                fixed4 l7Alpha = getTextureAlphaFragment(l7Tex);

                fixed4 l8Tex = tex2D(_LayerTex8, i.uvL8);
                fixed4 l8Alpha = getTextureAlphaFragment(l8Tex);

                fixed4 l9Tex = tex2D(_LayerTex9, i.uvL9);
                fixed4 l9Alpha = getTextureAlphaFragment(l9Tex);

                fixed4 l10Tex = tex2D(_LayerTex10, i.uvL10);
                fixed4 l10Alpha = getTextureAlphaFragment(l10Tex);
                
                fixed4 l11Tex = tex2D(_LayerTex11, i.uvL11);
                fixed4 l11Alpha = getTextureAlphaFragment(l11Tex);
                
                pixelCol = l11Tex;
                layersMask = l11Alpha * l10Alpha;
                blendFragmentByAlphaMask(layersMask, l10Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l9Alpha;
                blendFragmentByAlphaMask(layersMask, l9Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l8Alpha;
                blendFragmentByAlphaMask(layersMask, l8Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l7Alpha;
                blendFragmentByAlphaMask(layersMask, l7Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l6Alpha;
                blendFragmentByAlphaMask(layersMask, l6Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l5Alpha;
                blendFragmentByAlphaMask(layersMask, l5Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l4Alpha;
                blendFragmentByAlphaMask(layersMask, l4Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l3Alpha;
                blendFragmentByAlphaMask(layersMask, l3Tex,pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l2Alpha;
                blendFragmentByAlphaMask(layersMask, l2Tex, pixelCol);

                pixelAlpha = getTextureAlphaFragment(pixelCol);
                layersMask = pixelAlpha * l1Alpha;
                blendFragmentByAlphaMask(layersMask, l1Tex, pixelCol);
                
                return pixelCol;
            }
            
            ENDCG
        }
    }
}
