using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                TextBoxAmount.Visible = false;
                DropDownAmount.AutoPostBack = true;
                accessDropDownFill objClassAccessDrop = new accessDropDownFill();
                DropDownListCountry.DataSource = objClassAccessDrop.getCountryNames();
                DropDownListCountry.DataValueField = "countryId";
                DropDownListCountry.DataTextField = "countryName";
                DropDownListCountry.DataBind();

                subGetProvinceByCountry(Convert.ToInt32(DropDownListCountry.SelectedValue));
                subGetCityByProvince(Convert.ToInt32(DropDownListProvince.SelectedValue));

            }
            if (Convert.ToInt32(DropDownAmount.SelectedValue) == 4)
            {
                DropDownAmount.Visible = false;
                TextBoxAmount.Visible = true;
            }


            //ListItem listProvince = new ListItem();
            //listProvince.Text = "Select Province..";
            //listProvince.Value = "-1";
            //DropDownListProvince.Items.Add(listProvince);

        }
        catch (Exception ex)
        {
            Response.Redirect("~/Donation/Error.aspx?errorMessage="+ex);
        }
    }

    private void subGetProvinceByCountry(int id)
    {
        accessDropDownFill objClassAccessDrop = new accessDropDownFill();

        DropDownListProvince.DataSource = objClassAccessDrop.getProvinceByCountryId(id);
        DropDownListProvince.DataTextField = "provikceName";
        DropDownListProvince.DataValueField = "provinceId";
        DropDownListProvince.DataBind();
    }
    private void subGetCityByProvince(int id)
    {
        accessDropDownFill objClassAccessDrop = new accessDropDownFill();
        DropDownListCity.DataSource = objClassAccessDrop.getCityById(Convert.ToInt32(DropDownListProvince.SelectedValue));
        DropDownListCity.DataTextField = "cityName";
        DropDownListCity.DataValueField = "cityId";
        DropDownListCity.DataBind();
    }
    protected void subCountryIndexChange(object sender, EventArgs e)
    {
        subGetProvinceByCountry(Convert.ToInt32(DropDownListCountry.SelectedValue));
        subGetCityByProvince(Convert.ToInt32(DropDownListProvince.SelectedValue));

    }
    protected void subCityIndexChange(object sender, EventArgs e)
    {
        subGetCityByProvince(Convert.ToInt32(DropDownListProvince.SelectedValue));
    }
    protected void subSubmitForm(object sender, ImageClickEventArgs e)
    {
        accessDropDownFill objsubmit = new accessDropDownFill();
        int amt ;
        if (DropDownAmount.SelectedValue != null)
        {
            amt = Convert.ToInt32(DropDownAmount.SelectedValue);
        }
        else
        {
            amt = Convert.ToInt32(TextBoxAmount.Text);
        }
        string title=DropDownListTitle.SelectedValue;
        string fname=TextBoxFirstName.Text;
        string middle=TextBoxMiddleInitial.Text;
        string lname=TextBoxLastName.Text;
        string type = RadioButtonListDonorType.SelectedValue;
        string company=TextBoxCompany.Text;
        string zip=TextBoxStreetPostalCode.Text;
            string PoB=TextBoxPoBox.Text;
            string country=DropDownListCountry.SelectedValue;
            string provnc = DropDownListProvince.SelectedValue;
            string city = DropDownListCity.SelectedValue;
        string email=TextBoxEmail.Text;
        string hphone=TextBoxPhoneHome.Text;
        string wphone=TextBoxPhoneWork.Text;

        objsubmit.insertDonorInformation(amt, title, fname, middle, lname, type, company, zip, PoB, country, provnc, city, email, hphone, wphone, "1");
        //Response.Redirect("https://www.sandbox.paypal.com/cgi-bin/webscr");
       // imgbutton.PostBackUrl="https://www.sandbox.paypal.com/cgi-bin/webscr";
    }
}