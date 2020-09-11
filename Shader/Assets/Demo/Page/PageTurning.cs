using UnityEngine;
using System.Collections;
using DG.Tweening;

public class PageTurning : MonoBehaviour
{
    private Material m_Material;
	// Use this for initialization
	void Start ()
    {
        m_Material = GetComponent<MeshRenderer>().material;
    }
	
	// Update is called once per frame
	void Update ()
    {
	
	}
    public void Turning()
    {
        
        m_Material.SetFloat("_Angle", 0);
        m_Material.DOFloat(180, "_Angle", 2);
        m_Material = (Instantiate(Resources.Load("Plane"), Vector3.zero, Quaternion.identity) as GameObject).GetComponent<MeshRenderer>().material;
    }
}
