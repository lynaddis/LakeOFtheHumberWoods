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
        hospitalDataContext objCountry = new hospitalDataContext();
        var allcountry = from x in objCountry.tblCountries select x;
        return allcountry;
    }
    public IQueryable<tblProvince> getProvinceByCountryId(int id)
    {
        hospitalDataContext objProvince = new hospitalDataContext();
        var provinceById = from x in objProvince.tblProvinces where x.provinceCountryId == id select x;
        return provinceById;
    }
    public IQueryable<tblCity> getCityById(int id)
    {
        hospitalDataContext objCity = new hospitalDataContext();
        var cityById = from x in objCity.tblCities where x.cityProvinceId == id select x;
        return cityById;
    }
    public ISingleResult<donorInformation> getDonorInformation()
    {
        hospitalDataContext objDonor = new hospitalDataContext();
        var donorInfo = objDonor.spGetDonorInformation();
        return donorInfo;
    }
    public ISingleResult<donorInformation> getDonorInformationById(int id)
    {
        hospitalDataContext objDonor = new hospitalDataContext();
        var donorById = objDonor.spGetDonorInformationById(id);
        return donorById;
    }
    public int updateDonorInformation(int id,int amount,string title,string fname,string middle,string lname,string type,
        string company,string zip,string pobox,string country,string province,string city,
            string email,string Hphone,string Wphone,string emailSend)
    {
        hospitalDataContext objupd = new hospitalDataContext();
        int donorById = objupd.spUpdateDonorInformation(id,amount,title,fname,middle,lname,type,
        company,zip,pobox,country,province,city,
            email,Hphone,Wphone,emailSend);
        return donorById;
    }
    public int insertDonorInformation(int amount, string title, string fname, string middle, string lname, string type,
       string company, string zip, string pobox, string country, string province, string city,
           string email, string Hphone, string Wphone, string emailSend)
    {
        hospitalDataContext objins = new hospitalDataContext();
        int donorById = objins.spInsertDonorInformation(amount, title, fname, middle, lname, type,
        company, zip, pobox, country, province, city,
            email, Hphone, Wphone, emailSend);
        return donorById;
    }
    //  second feature search 

    public int updateBedRooms(int count,int bedid)
    {
        hospitalDataContext objbed = new hospitalDataContext();
      int bedupd=  objbed.spUpdateBedRooms(count, bedid);
      return bedupd;
    }
    public ISingleResult<tblBedRoom> getBedRoomsData()
    {
        hospitalDataContext objgetBed = new hospitalDataContext();
        //var query=from x in objgetBed.tblBedRooms select(objgetBed.tblRoomTypes);
        var opp= objgetBed.spGetBedRoomAndRoomType();
        return opp;
    }
    public bool updateBedRoomsAvalability(int id,int num)
    { 
    hospitalDataContext objfill=new hospitalDataContext();
    var update = objfill.tblBedRooms.Single(x => x.bedId == id);
    update.bedAvailable = num;
    objfill.SubmitChanges();
    return true;
    }
    // end of search feature
    // parking feature

    public bool insertTicket(string tNo)
    {
        hospitalDataContext objticket = new hospitalDataContext();
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
        hospitalDataContext objget = new hospitalDataContext();
        var result = from x in objget.tblTickets where x.ticketNo == ticket select x;
        
            return result;
        
       
    }
    public bool deleteParkingTicket(int id)
    {
        hospitalDataContext objdel = new hospitalDataContext();
        var delTicket = objdel.tblTickets.Single(x => x.ticketId == id);
        objdel.tblTickets.DeleteOnSubmit(delTicket);
        objdel.SubmitChanges();
        
       
            return true;
       
    }
    //end of parking feature
}