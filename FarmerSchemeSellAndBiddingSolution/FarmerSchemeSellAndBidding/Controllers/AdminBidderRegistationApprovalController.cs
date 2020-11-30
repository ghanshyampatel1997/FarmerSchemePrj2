using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class AdminBidderRegistationApprovalController : ApiController
    {
        FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        // GET: api/AdminFarmer
        #region To Get bidderdetails
        [HttpGet]
        public IHttpActionResult GetBidderdetails()
        {
            try
            {
                dynamic bidderdata = (from r in Db.RollTypes
                                      join u in Db.UserRegisters
                                      on r.UserEmailId equals u.UserEmailId
                                      join b in Db.BankDetails
                                      on r.UserID equals b.UserID
                                      where r.RollType1.ToLower() == "bidder"
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
                                      }).ToList();
                return Ok(bidderdata);
            }
            catch
            {
                return BadRequest("Data is not Available.");
            }
        }
        #endregion
        //Post:api/AdminFarmer?id=ID
        #region Admin approval
        [HttpPost]
        public IHttpActionResult PostApprovebidderRegi(dynamic id)
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
                return Ok("Bidder Approved");
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        #endregion

    }
}
