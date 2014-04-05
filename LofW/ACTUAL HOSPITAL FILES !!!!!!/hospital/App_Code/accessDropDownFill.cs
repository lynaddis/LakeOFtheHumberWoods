using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;
/// <summary>
/// Summary description for accessDropDownFill
/// </summary>
public class accessDropDownFill
{
	
   
    public IQueryable<tblCountry> getCountryNames()
    {
        dropDownFillDataContext objCountry = new dropDownFillDataContext();
        var allcountry = from x in objCountry.tblCountries select x;
        return allcountry;
    }
    public IQueryable<tblProvince> getProvinceByCountryId(int id)
    {
        dropDownFillDataContext objProvince = new dropDownFillDataContext();
        var provinceById = from x in objProvince.tblProvinces where x.provinceCountryId == id select x;
        return provinceById;
    }
    public IQueryable<tblCity> getCityById(int id)
    {
        dropDownFillDataContext objCity = new dropDownFillDataContext();
        var cityById = from x in objCity.tblCities where x.cityProvinceId == id select x;
        return cityById;
    }
    public ISingleResult<donorInformation> getDonorInformation()
    {
        dropDownFillDataContext objDonor = new dropDownFillDataContext();
        var donorInfo = objDonor.spGetDonorInformation();
        return donorInfo;
    }
    public ISingleResult<donorInformation> getDonorInformationById(int id)
    {
        dropDownFillDataContext objDonor = new dropDownFillDataContext();
        var donorById = objDonor.spGetDonorInformationById(id);
        return donorById;
    }
    public int updateDonorInformation(int id,int amount,string title,string fname,string middle,string lname,string type,
        string company,string zip,string pobox,string country,string province,string city,
            string email,string Hphone,string Wphone,string emailSend)
    {
        dropDownFillDataContext objupd = new dropDownFillDataContext();
        int donorById = objupd.spUpdateDonorInformation(id,amount,title,fname,middle,lname,type,
        company,zip,pobox,country,province,city,
            email,Hphone,Wphone,emailSend);
        return donorById;
    }
    public int insertDonorInformation(int amount, string title, string fname, string middle, string lname, string type,
       string company, string zip, string pobox, string country, string province, string city,
           string email, string Hphone, string Wphone, string emailSend)
    {
        dropDownFillDataContext objins = new dropDownFillDataContext();
        int donorById = objins.spInsertDonorInformation(amount, title, fname, middle, lname, type,
        company, zip, pobox, country, province, city,
            email, Hphone, Wphone, emailSend);
        return donorById;
    }
    //  second feature search 

    public int updateBedRooms(int count,int bedid)
    {
        dropDownFillDataContext objbed = new dropDownFillDataContext();
      int bedupd=  objbed.spUpdateBedRooms(count, bedid);
      return bedupd;
    }
    public ISingleResult<tblBedRoom> getBedRoomsData()
    {
        dropDownFillDataContext objgetBed = new dropDownFillDataContext();
        //var query=from x in objgetBed.tblBedRooms select(objgetBed.tblRoomTypes);
        var opp= objgetBed.spGetBedRoomAndRoomType();
        return opp;
    }
    public bool updateBedRoomsAvalability(int id,int num)
    { 
    dropDownFillDataContext objfill=new dropDownFillDataContext();
    var update = objfill.tblBedRooms.Single(x => x.bedId == id);
    update.bedAvailable = num;
    objfill.SubmitChanges();
    return true;
    }
    // end of search feature
    // parking feature

    public bool insertTicket(string tNo)
    {
        dropDownFillDataContext objticket = new dropDownFillDataContext();
        using (objticket)
        {
            tblTicket objnewTicket = new tblTicket();
            objnewTicket.ticketNo = tNo;
            objticket.tblTickets.InsertOnSubmit(objnewTicket);
            objticket.SubmitChanges();
            return true;
        }
    }

    public IQueryable<tblTicket> GetParkingTicket(string ticket)
    {
        dropDownFillDataContext objget = new dropDownFillDataContext();
        var result = from x in objget.tblTickets where x.ticketNo == ticket select x;
        
            return result;
        
       
    }
    public bool deleteParkingTicket(int id)
    {
        dropDownFillDataContext objdel = new dropDownFillDataContext();
        var delTicket = objdel.tblTickets.Single(x => x.ticketId == id);
        objdel.tblTickets.DeleteOnSubmit(delTicket);
        objdel.SubmitChanges();
        
       
            return true;
       
    }
    //end of parking feature
}