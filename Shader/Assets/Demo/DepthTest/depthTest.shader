﻿Shader "Custom/depthTest"
{
     Properties
    {
        _MainTex ("MainTex", 2D) = "white"{}
        _Ambient("Ambient",Range(0,1))=1.2
    }
    SubShader
    {
        ZWrite Off   //是否想深度缓冲区写入数据
        ZTest always  //是否像颜色缓冲区写入数据
         Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float _Ambient;
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv=v.uv;
                return o;
            }
            
            float4 frag (v2f i) : SV_Target
            {
                float4 col;
                col = tex2D(_MainTex,i.uv);
                return col;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
