using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    AdminContactClass objContact = new AdminContactClass(); //new instance of class

    protected void Page_Load(object sender, EventArgs e)
    {
        Master.pp_masterTitle = "Admin - Contact Us";
        if (!Page.IsPostBack)
        {
            _subRebind();
            //ltv_main.DataSource = objContact.getMessages();
            //ltv_main.DataBind();
        }
    }
    //Message will be displayed on successful or unsucessful completion of operation
    private void _strMessageView(List<contactus> flag, string str)
    {
        if (flag != null)
        {
            lbl_msg.Text = "Message " + str + " was successful";
        }
        else
        {
            lbl_msg.Text = "Unable to" + str + " Message";
        }
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_msg.Text = "Message " + str + "was successful";
        }
        else
        {
            lbl_msg.Text = "Unable to" + str + " Message";
        }
    }
    protected void _subRebind()
    {
        ltv_main.DataSource = objContact.getMessages();
        ltv_main.DataBind();
    }

    protected void subedit(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "xUpdate":
                TextBox txtUpSubject = (TextBox)e.Item.FindControl("txt_subject");
                HiddenField hdfMsgID = (HiddenField)e.Item.FindControl("hdf_id");
                int proID = int.Parse(hdfMsgID.Value.ToString());
                _strMessage(objContact.updateMessage(proID,txtUpSubject.Text.ToString()), "update ");
                _subRebind();
                break;
            case "xDelete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objContact.commitDelete(_id), "delete ");
                _subRebind();
                break;
            //case "xCancel":
            //    _subRebind();
            //    break;
            case "xSelect":
                {

                    int rowIndex = Convert.ToInt32(e.CommandArgument);
                    grd_main.DataSource = objContact.getMessagesByID(rowIndex);
                    grd_main.DataBind();
                    _subRebind();
                    break;
                }
        }
  }
}
