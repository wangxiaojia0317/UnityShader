Shader "Custom/Outline"
{
    Properties
    {
         _MainTex ("MainTex", 2D) = "white"{}
         _OutlineWidth("OutlineWidth",Range(1,2))=1.2
    }
    SubShader
    {
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
            float _OutlineWidth;
            v2f vert (appdata v)
            {
                v2f o;
                v.vertex.xy*=_OutlineWidth;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv=v.uv;
                return o;
            }
            
            float4 frag (v2f i) : SV_Target
            {
               
                return fixed4(1,0,0,0);
            }
            ENDCG
        }


        Pass
        {
            ZTest Always
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
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv=v.uv;
                return o;
            }
            
            float4 frag (v2f i) : SV_Target
            {
                float4 col = tex2D(_MainTex,i.uv);
                return col;
            }
            ENDCG
        }


    }
    FallBack "Diffuse"
}
