using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for mapMarker
/// </summary>
public class mapMarker
{
    public List<string> address = new List<string>();

    public void addAddress(string h_address)
    {
        this.address.Add(h_address);
    }
   
}