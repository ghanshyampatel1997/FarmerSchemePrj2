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
    public class AdminClaimApprovalController : ApiController
    {
        FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        //get method to fetch Insuranceapplicationdata
        #region to Fetch insurance applictaion
        [HttpGet]
        public IHttpActionResult Getadmininsuranceclaimapp()
        {
            try
            {
                dynamic insapp = (from i in Db.InsuranceApplications
                                  join c in Db.ClaimForms on i.PolicyNo equals c.PolicyNo
                                  join r in Db.RollTypes on i.UserID equals r.UserID
                                  join u in Db.UserRegisters on r.UserEmailId equals u.UserEmailId
                                  select new
                                  {
                                      i.season,
                                      i.year,
                                      i.cropname,
                                      i.SumInsured,
                                      i.FarmId,
                                      c.ClaimNo,
                                      c.CauseOfLoss,
                                      c.dateOfLoss,
                                      u.fullname,
                                      u.city,
                                      u.ContactNo_,
                                      c.ClaimApprove
                                  }).ToList();
                return Ok(insapp);
            }
            catch
            {
                return BadRequest("Not eligible for Claim");
            }
        }
        #endregion
        //Post method to Add Claim approval by admin
        #region Adminapprovalclaim request
        [HttpPost]
        public IHttpActionResult PostClaimApproval(dynamic Num)
        {
            try
            {
                int NUM = Convert.ToInt32(Num);
                ClaimForm Cno = (from c in Db.ClaimForms
                                 where c.ClaimNo == NUM
                                 select c).First();
                Cno.ClaimApprove = true;
                Db.Entry(Cno).State = EntityState.Modified;
                Db.SaveChanges();
                return Ok("Claim Request is Approved");
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
        #endregion
    }
}
