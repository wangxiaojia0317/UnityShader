Shader "Custom/offsetgreen"
{
     Properties
    {
        _MainTex ("MainTex", 2D) = "white"{}
        _Ambient("Ambient",Range(0,1))=1.2
    }
    SubShader
    {
        Pass
        {
            Offset 0, -1
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
                return float4(0,1,0,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
