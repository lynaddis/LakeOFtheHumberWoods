using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for mapRequestClass
/// </summary>
public class directionRequestClass
{

    public List<Direction_request> getRequest()
    {
        HospitalDataContext objRequest = new HospitalDataContext();
        var allRequests = objRequest.Direction_requests.Select(x => x);
        return allRequests.ToList();
    }

    public bool commintInsert(string sLoc, string eLoc, string date)
    {
        HospitalDataContext objRequest = new HospitalDataContext();
        using (objRequest)
        {
            Direction_request newRequest = new Direction_request();
            newRequest.startloc = sLoc;
            newRequest.endloc = eLoc;
            newRequest.request_date = date;
            objRequest.Direction_requests.InsertOnSubmit(newRequest);
            objRequest.SubmitChanges();
            return true;
        }
    }

    public bool DeleteRequest(int Id)
    {
        HospitalDataContext objRequest = new HospitalDataContext();
        using (objRequest)
        {
            var DeleteRequest = objRequest.Direction_requests.Single(x => x.Id == Id);
            objRequest.Direction_requests.DeleteOnSubmit(DeleteRequest);
            objRequest.SubmitChanges();
            return true;
        }
    }
}