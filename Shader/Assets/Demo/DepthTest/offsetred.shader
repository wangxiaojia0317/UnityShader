Shader "Custom/offsetred"
{
     Properties
    {
        _MainTex ("MainTex", 2D) = "white"{}
        _Ambient("Ambient",Range(0,1))=1.2
    }
    SubShader
    {
        //第一个参数（-1）Z(深度)缩放的最大斜率的值，值越小，越靠前（-1~1）
        //第二个参数表示可分辨的最小深度缓冲区的值，微调buffer，越小越靠近相机
         Offset 0 ,0
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
                return float4(1,0,0,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
