using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class AdminFarmerSellRequestController : ApiController
    {
        private FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();

        [HttpGet]
        public IHttpActionResult Getfarmersellrequestddetails()
        {
            try
            {
                dynamic selldata = (from p in Db.Cropprices
                                    join f in Db.FarmerCropdetils on p.CropId equals f.CropId
                                    join r in Db.RollTypes on f.UserID equals r.UserID
                                    join u in Db.UserRegisters on r.UserEmailId equals u.UserEmailId
                                    select new
                                    {
                                        f.cropType,
                                        p.cropname,
                                        p.MSP,
                                        f.fertilizerType,
                                        f.quantity,
                                        f.FarmerSellID,
                                        u.fullname,
                                        u.ContactNo_,
                                        u.city,
                                        f.SoilPHCertificate,
                                        f.AproovedFarmersell
                                    }).ToList();
                return Ok(selldata);
            }
            catch
            {
                return BadRequest("No Data Found!!!");
            }
        }

        [HttpPost]
        public IHttpActionResult PostSellrequestApproval(dynamic id)
        {
            try
            {
                int ID = Convert.ToInt32(id);
                FarmerCropdetil fd = (from f in Db.FarmerCropdetils
                                      where f.FarmerSellID == ID
                                      select f).First();
                fd.AproovedFarmersell = true;
                Db.Entry(fd).State = EntityState.Modified;
                //Db.RollTypes.Add(roll);
                Db.SaveChanges();
                return Ok("Farmer Sell Request Approved");
            }
            catch
            {
                return BadRequest("Farmer sell Id is not valid.");
            }
        } 
    }
}
