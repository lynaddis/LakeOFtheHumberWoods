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
        HospitalDataContext objCountry = new HospitalDataContext();
        var allcountry = from x in objCountry.tblCountries select x;
        return allcountry;
    }
    public IQueryable<tblProvince> getProvinceByCountryId(int id)
    {
        HospitalDataContext objProvince = new HospitalDataContext();
        var provinceById = from x in objProvince.tblProvinces where x.provinceCountryId == id select x;
        return provinceById;
    }
    public IQueryable<tblCity> getCityById(int id)
    {
        HospitalDataContext objCity = new HospitalDataContext();
        var cityById = from x in objCity.tblCities where x.cityProvinceId == id select x;
        return cityById;
    }
    public ISingleResult<donorInformation> getDonorInformation()
    {
        HospitalDataContext objDonor = new HospitalDataContext();
        var donorInfo = objDonor.spGetDonorInformation();
        return (ISingleResult<donorInformation>)donorInfo;
    }
    public ISingleResult<donorInformation> getDonorInformationById(int id)
    {
        HospitalDataContext objDonor = new HospitalDataContext();
        var donorById = objDonor.spGetDonorInformationById(id);
        return (ISingleResult<donorInformation>)donorById;
    }
    public int updateDonorInformation(int id,int amount,string title,string fname,string middle,string lname,string type,
        string company,string zip,string pobox,string country,string province,string city,
            string email,string Hphone,string Wphone,string emailSend)
    {
        HospitalDataContext objupd = new HospitalDataContext();
        int donorById = objupd.spUpdateDonorInformation(id,amount,title,fname,middle,lname,type,
        company,zip,pobox,country,province,city,
            email,Hphone,Wphone,emailSend);
        return donorById;
    }
    public int insertDonorInformation(int amount, string title, string fname, string middle, string lname, string type,
       string company, string zip, string pobox, string country, string province, string city,
           string email, string Hphone, string Wphone, string emailSend)
    {
        HospitalDataContext objins = new HospitalDataContext();
        int donorById = objins.spInsertDonorInformation(amount, title, fname, middle, lname, type,
        company, zip, pobox, country, province, city,
            email, Hphone, Wphone, emailSend);
        return donorById;
    }
    //  second feature search 

    public int updateBedRooms(int count,int bedid)
    {
        HospitalDataContext objbed = new HospitalDataContext();
      int bedupd=  objbed.spUpdateBedRooms(count, bedid);
      return bedupd;
    }
    public ISingleResult<tblBedRoom> getBedRoomsData()
    {
        HospitalDataContext objgetBed = new HospitalDataContext();
        //var query=from x in objgetBed.tblBedRooms select(objgetBed.tblRoomTypes);
        var opp= objgetBed.spGetBedRoomAndRoomType();
        return (ISingleResult<tblBedRoom>)opp;
    }
    public bool updateBedRoomsAvalability(int id,int num)
    { 
    HospitalDataContext objfill=new HospitalDataContext();
    var update = objfill.tblBedRooms.Single(x => x.bedId == id);
    update.bedAvailable = num;
    objfill.SubmitChanges();
    return true;
    }
    // end of search feature
    // parking feature

    public bool insertTicket(string tNo)
    {
        HospitalDataContext objticket = new HospitalDataContext();
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
        HospitalDataContext objget = new HospitalDataContext();
        var result = from x in objget.tblTickets where x.ticketNo == ticket select x;
        
            return result;
        
       
    }
    public bool deleteParkingTicket(int id)
    {
        HospitalDataContext objdel = new HospitalDataContext();
        var delTicket = objdel.tblTickets.Single(x => x.ticketId == id);
        objdel.tblTickets.DeleteOnSubmit(delTicket);
        objdel.SubmitChanges();
        
       
            return true;
       
    }
    //end of parking feature
}