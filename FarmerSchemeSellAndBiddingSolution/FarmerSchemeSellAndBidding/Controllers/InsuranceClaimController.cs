using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class InsuranceClaimController : ApiController
    {
        private FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        //GET method to Appilied Insurance data
        #region
        [HttpGet]
        public IHttpActionResult GetInsuranceClaim([FromUri]int Pn)
        {
            List<string> data = new List<string>();
            data.Add("State Bank Of India");
            try
            {
            //TO check policy nuber is present Are not
                int? sumi = (from i in Db.InsuranceApplications
                             where i.PolicyNo == Pn
                             select i.SumInsured).First();
                data.Add(sumi.ToString());
            }
           
             catch
            {
                return BadRequest("Policy number is incorrect");
            }
            string name = (from i in Db.InsuranceApplications
                           join r in Db.RollTypes
                           on i.UserID equals r.UserID
                           join u in Db.UserRegisters
                           on r.UserEmailId equals u.UserEmailId
                           select u.fullname).First();
            data.Add(name);
            return Ok(data);
        }
        #endregion
        //Post Method To Apply for claim
        #region
            [HttpPost]
        public IHttpActionResult PostInsuranceClaim(dynamic InsClaim)
        {
            if (InsClaim != null)
            {
                ClaimForm claimform = new ClaimForm();
                try
                {
                    int pnum = InsClaim.PolicyNo;
                    int PolicyNumber = (from c in Db.InsuranceApplications
                                    where c.PolicyNo == pnum
                                    select c.PolicyNo).First();
                    dynamic PolicyNo= (from c in Db.ClaimForms
                                   where c.PolicyNo == PolicyNumber
                                   select c.PolicyNo).ToList();
                    if(PolicyNo.Count != 0)
                    {
                        return Ok("Already Applied For Claim.");
                    }
                }
                catch
                {
                    return Ok("Policy number is incorrect");
                }
                int Pnum = InsClaim.PolicyNo;
                claimform.PolicyNo = Pnum;
                claimform.CauseOfLoss = InsClaim.Causeofloss;
                claimform.dateOfLoss = InsClaim.Dateofloss;

                Db.ClaimForms.Add(claimform);
                Db.SaveChanges();

                long ClaimNo = (from c in Db.ClaimForms
                                where c.PolicyNo == Pnum
                                select c.ClaimNo).FirstOrDefault();
                dynamic Suminsured = (from i in Db.InsuranceApplications
                                      where i.PolicyNo == Pnum
                                      select i.SumInsured).FirstOrDefault();
                dynamic Uid = (from i in Db.InsuranceApplications
                               where i.PolicyNo == Pnum
                               select i.UserID).FirstOrDefault();
                int uid = Uid;
                dynamic BankAccountnumber = (from b in Db.BankDetails
                                             where b.UserID == uid
                                             select b.BankAccountNo).FirstOrDefault();
                int? Ban = (int?)BankAccountnumber;

                int sum = Suminsured;
                return Ok("Added Succesfully.Your Claim number is  " + ClaimNo.ToString() + ". Please use this number for any further references when Admin Will Approve You will get Sum insurance amount of " + sum.ToString() + " In " + Ban.ToString()+" Bank accoount number.");
            }
            else
            {
                return Ok("Data is present");
            }
        }
#endregion
    }
}
