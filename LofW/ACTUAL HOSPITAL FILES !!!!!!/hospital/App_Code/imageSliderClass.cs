using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for imageSliderClass
/// </summary>
public class imageSliderClass
{
    public string[] getImages()
    {
        HospitalDataContext objImg = new HospitalDataContext();
        var allImages = objImg.imagesliders.Select(x => x.image_url).ToArray();
        return allImages;
    }

    public string getImagesByIndex(int i)
    {
        HospitalDataContext objImg = new HospitalDataContext();
        var allImages = objImg.imagesliders.Select(x => x.image_url).ToArray();
        if (i < allImages.Length)
        {
            return allImages[i];
        }
        else
        {
            return allImages[0];
        }
    }

    public int getImagesCount()
    {
        HospitalDataContext objImg = new HospitalDataContext();
        var allImages = objImg.imagesliders.Select(x => x.image_url).ToArray();
        return allImages.Length;
    }

    // return all rows of imageslider tabble
    public List<imageslider> getAllImageInfo()
    {
        HospitalDataContext objimg = new HospitalDataContext();
        var allImages = objimg.imagesliders.Select(x => x);
        return allImages.ToList();
    }
    public IQueryable<imageslider> getImagesById(int _id)
    {
        HospitalDataContext objimgsID = new HospitalDataContext();
        var singleRow = objimgsID.imagesliders.Where(x => x.Id == _id).Select(x => x);
        return singleRow;
    }

    public bool commitUpdate(int _id, string _imagURL, string _desc)
    {
        HospitalDataContext objimagesU = new HospitalDataContext();
        using (objimagesU)
        {
            var upimg = objimagesU.imagesliders.Single(x => x.Id == _id);
            upimg.image_url = _imagURL;
            upimg.description = _desc;
            
            objimagesU.SubmitChanges();
            return true;
        }
    }

    public bool commitInsert(string _imageURLI, string _descI)
    {
        HospitalDataContext dbobjI = new HospitalDataContext();
        using (dbobjI)
        {
            imageslider dbObjImg = new imageslider();
           // dbObjImg.Id = _idI;
            dbObjImg.image_url = _imageURLI;
            dbObjImg.description = _descI;
            //insert command
            dbobjI.imagesliders.InsertOnSubmit(dbObjImg);//insert one complete row
            //commit insert against database
            dbobjI.SubmitChanges();
            return true;
        }
    }

    public bool commitDelete(int _id)
    {
        HospitalDataContext objimagesD = new HospitalDataContext();
        using (objimagesD)
        {
            var objDelImg = objimagesD.imagesliders.Single(x => x.Id == _id);
            objimagesD.imagesliders.DeleteOnSubmit(objDelImg);
            objimagesD.SubmitChanges();
            return true;
        }
    }
}