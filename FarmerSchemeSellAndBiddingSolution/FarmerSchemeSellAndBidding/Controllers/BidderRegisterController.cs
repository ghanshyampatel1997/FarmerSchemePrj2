using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class BidderRegisterController : ApiController
    {
        FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();
        //Post method To inbuilt data from Angular
        #region Bidderregistration
        [HttpPost]
        public IHttpActionResult PostFRegistration()
        {
            try
            {
                var httpRequest = HttpContext.Current.Request;

                string rt = "BIDDER";
                string ueid = httpRequest["Emailid"];

                dynamic emailid = (from r in db.RollTypes
                                   where r.RollType1.ToUpper() == rt && r.UserEmailId.ToLower() == ueid.ToLower()
                                   select r.UserEmailId).ToList();
                if (emailid.Count != 0)
                {
                    return Ok(ueid + " is already used by another Bidder");
                }
                else
                {
                    string imageName1 = null;
                    //Upload Image
                    var postedFile1 = httpRequest.Files["Image1"];
                    //Create custom filename
                    imageName1 = new String(Path.GetFileNameWithoutExtension(postedFile1.FileName).Take(10).ToArray()).Replace(" ", "-");
                    imageName1 = imageName1 + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile1.FileName);
                    var filePath1 = "D:/desktop/dotnet training/Final Project Repository/FarmerSchemePrj2/AngularDemoImageUpload/src/assets/img/" + imageName1;
                    string filepath11 = "/assets/img/" + imageName1;

                    string imageName2 = null;
                    //var httpRequest = HttpContext.Current.Request;
                    //Upload Image
                    var postedFile2 = httpRequest.Files["Image2"];
                    //Create custom filename
                    imageName2 = new String(Path.GetFileNameWithoutExtension(postedFile2.FileName).Take(10).ToArray()).Replace(" ", "-");
                    imageName2 = imageName2 + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile2.FileName);
                    var filePath2 = "D:/desktop/dotnet training/Final Project Repository/FarmerSchemePrj2/AngularDemoImageUpload/src/assets/img/" + imageName2;
                    string filepath22 = "/assets/img/" + imageName2;

                    string imageName3 = null;
                    //var httpRequest = HttpContext.Current.Request;
                    //Upload Image
                    var postedFile3 = httpRequest.Files["Image3"];
                    //Create custom filename
                    imageName3 = new String(Path.GetFileNameWithoutExtension(postedFile3.FileName).Take(10).ToArray()).Replace(" ", "-");
                    imageName3 = imageName3 + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile3.FileName);
                    var filePath3 = "D:/desktop/dotnet training/Final Project Repository/FarmerSchemePrj2/AngularDemoImageUpload/src/assets/img/" + imageName3;
                    string filepath33 = "/assets/img/" + imageName3;

                    //Adding data into table userRegister
                    UserRegister userRegister = new UserRegister();
                    userRegister.UserEmailId = ueid;
                    userRegister.password = httpRequest["Password"];
                    userRegister.ContactNo_ = httpRequest["ContactNo"];
                    userRegister.fullname = httpRequest["Fullname"];
                    userRegister.address1 = httpRequest["Address1"];
                    userRegister.address2 = httpRequest["Address2"];
                    userRegister.city = httpRequest["City"];
                    userRegister.state = httpRequest["State"];
                    userRegister.pincode = (int?)Convert.ToInt64(httpRequest["Pincode"]);
                    userRegister.pancardDocument = filepath22;
                    userRegister.aadharCardDocument = filepath11;


                    //Adding data into table rollType
                    RollType rollType = new RollType();
                    //rollType.UserID= Convert.ToInt32(httpRequest["Emailid"]);
                    rollType.RollType1 = "BIDDER";
                    rollType.certificate = filepath33;
                    rollType.ApprovedStatus = null;
                    rollType.UserEmailId = ueid;

                    //Adding data into table bankDetail
                    BankDetail bankDetail = new BankDetail();
                    bankDetail.IFSCCode = httpRequest["IFSCCode"]; ;
                    bankDetail.BankAccountNo = (int?)Convert.ToInt64(httpRequest["BankAccountno"]);


                    //saving Images
                    postedFile1.SaveAs(filePath1);
                    postedFile2.SaveAs(filePath2);
                    postedFile3.SaveAs(filePath3);


                    // saving data into table userRegister
                    db.UserRegisters.Add(userRegister);
                    db.SaveChanges();

                    // saving data into table rolltype
                    db.RollTypes.Add(rollType);
                    db.SaveChanges();

                    //getting userid as foreingn key for other table  
                    int uid = (from r in db.RollTypes
                               where r.RollType1.ToUpper() == rt && r.UserEmailId.ToLower() == ueid.ToLower()
                               select r.UserID).First();


                    //saving data of bank details
                    bankDetail.UserID = uid;
                    db.BankDetails.Add(bankDetail);
                    db.SaveChanges();

                    return Ok("Registration Successfull. Use " + uid + " for Login Userid");
                }
            }
            catch (Exception e)
            {
                return Ok(e.Message);
            }

        }
#endregion
    }
}
