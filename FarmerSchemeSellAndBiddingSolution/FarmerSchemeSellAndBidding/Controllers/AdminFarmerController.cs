using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using FarmerSchemeSellAndBidding.Models;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class AdminFarmerController : ApiController
    {
        private FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        // GET: api/AdminFarmer
        [HttpGet]
        public IHttpActionResult Getfarmerdetails()
        {
            try
            {
                dynamic farmerdata = (from r in Db.RollTypes
                                      join u in Db.UserRegisters
                                      on r.UserEmailId equals u.UserEmailId
                                      join b in Db.BankDetails
                                      on r.UserID equals b.UserID
                                      join f in Db.FarmerLands
                                      on r.UserID equals f.UserID
                                      where r.RollType1.ToLower() == "farmer"
                                      select new
                                      {
                                          u.UserEmailId,
                                          u.ContactNo_,
                                          u.fullname,
                                          u.address1,
                                          u.address2,
                                          u.city,
                                          u.state,
                                          u.pincode,
                                          u.pancardDocument,
                                          u.aadharCardDocument,
                                          r.UserID,
                                          r.certificate,
                                          r.ApprovedStatus,
                                          b.IFSCCode,
                                          b.BankAccountNo,
                                          f.landArea,
                                          f.landAddress,
                                          f.landPinCode
                                      }).ToList();
                return Ok(farmerdata);
            }
            catch
            {
                return BadRequest("Data is not Available.");
            }
        }
        //Post:api/AdminFarmer?id=ID
        [HttpPost]
        public IHttpActionResult PostApproveFarmerRegi(dynamic id)
        {
            try
            {
                int ID = Convert.ToInt32(id);
                RollType rollType = (from r in Db.RollTypes
                                where r.UserID == ID
                                select r).First();
                rollType.ApprovedStatus = true;
                Db.Entry(rollType).State = EntityState.Modified;
                //Db.RollTypes.Add(roll);
                Db.SaveChanges();
                return Ok("Farmer Approved");
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }

       
        }
    }
}