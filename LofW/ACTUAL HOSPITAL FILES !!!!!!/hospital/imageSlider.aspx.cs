using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    HospitalDataContext objdbImages = new HospitalDataContext();
    imageSliderClass objImage = new imageSliderClass();
  
    protected void Page_Init(object sender, EventArgs e)
    {
        int i = objImage.getImagesCount();

       
        for (int t = 0; t <= i; t++)
        {
            Image imagelocal          = new Image();
            imagelocal.ID         = t.ToString();
            imagelocal.ImageUrl = objImage.getImagesByIndex(t);
            View viewLocal              = new View();
            viewLocal.Controls.Add(imagelocal);
            mlt.Views.Add(viewLocal);
        }
    }
    // User can navigate through images by clicking on Forward button
    protected void ImgForward(object sender, EventArgs e)
    {
        if (mlt.ActiveViewIndex >= (objImage.getImagesCount() - 1))
        {
            mlt.ActiveViewIndex = 0;
        }
        else
        {
            mlt.ActiveViewIndex++;
        }       
    }
    // User can navigate through images by clicking backward button
    protected void ImgBackward(object sender, EventArgs e)
    {
        if (mlt.ActiveViewIndex <= 0)
        {
            mlt.ActiveViewIndex = (objImage.getImagesCount() - 1);
        }
        else
        {
            mlt.ActiveViewIndex--;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
                      
        }
    }   

    protected void subTick(object sender, EventArgs e)
    {

        if (mlt.ActiveViewIndex < (objImage.getImagesCount()-1))
            {
                mlt.ActiveViewIndex += 1;
            }
            else
            {
                mlt.ActiveViewIndex = 0;
            }  
    }
    protected void subClick(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(5000);
    }
}