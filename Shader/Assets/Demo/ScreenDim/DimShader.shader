Shader "Custom/DimShader"
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
                float2 tempUV=i.uv;
            
                // float4 col1=tex2D(_MainTex,tempUV-float2(_Ambient,0));
                // float4 col2=tex2D(_MainTex,tempUV+float2(_Ambient,0));
                // float4 col3=tex2D(_MainTex,tempUV-float2(0,_Ambient));
                // float4 col4=tex2D(_MainTex,tempUV+float2(0,_Ambient));

                // col=(col1+col2+col3+col4)/4;

                // return col;
                col = tex2D(_MainTex,tempUV);
                
                // pow((0.5 - x), 2) + pow((0.5 - y), 2);
                if(pow((0.5 - tempUV.x), 2) + pow((0.5 - tempUV.y), 2)<0.1)
                    return col;
                else
                    return float4(1,0,0,0.01);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
