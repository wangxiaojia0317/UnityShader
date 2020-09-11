using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScreenDim : MonoBehaviour
{




    
    public Shader myShader;

    public Material mat;
    // Start is called before the first frame update
    void Start()
    {
       
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    ///拿到相机渲染的图片做二次渲染
    void OnRenderImage(RenderTexture sourceTexture,RenderTexture desTexture)
    {
        //拦截相机渲染出来的图像
        //更改后的图像，然后交给引擎
        Graphics.Blit(sourceTexture,desTexture,mat);
    }

}
