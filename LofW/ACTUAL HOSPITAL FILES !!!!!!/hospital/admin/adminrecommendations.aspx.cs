using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminrecommendations : System.Web.UI.Page
{
    recomendClass objRec = new recomendClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            rpt_rec.DataSource = objRec.getRecommendations();
            rpt_rec.DataBind();
        }
    }


    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "Recommendation has been " + str + "ed!"; //if insert is successful subroutie )strMessage will say "(product you inserted) was successful"
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + "Submit";//if insert fails then this message is produced.
        }
    }
    protected void Del(object sender, RepeaterCommandEventArgs e) //specify it is a datalist Command event args.
    {
        
                int _Id = int.Parse(((HiddenField)e.Item.FindControl("hdf_Id")).Value);//use Id numbers to delete rows.
                _strMessage(objRec.commitDelete(_Id), "delete");
                //_subRebind();
           
            
        }
    }
