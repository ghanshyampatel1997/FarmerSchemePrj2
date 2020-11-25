using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class InsuranceApplicationController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();
        [HttpPost]
        //[Route("InsuranceApplication")]
        public IHttpActionResult PostinsuranceForm(dynamic InsForm)
        {
            try
            {
                if (InsForm != null)
                {
                    try
                    {
                        int uid = InsForm.Userid;
                        int Iid = (from l in db.InsuranceApplications
                                   where l.UserID == uid
                                   select l.PolicyNo).First();

                        return Ok("You have already applied for Insurance.Your Policy number is  " + Iid.ToString() + " .Please use this number for future claim. ");

                    }
                    catch
                    {
                        int uid = InsForm.Userid;
                        int fid = (from l in db.FarmerLands
                                   where l.UserID == uid
                                   select l.FarmId).First();
                        InsuranceApplication insuranceApplication = new InsuranceApplication();
                        insuranceApplication.season = InsForm.season;
                        /*this.Insurance.season = season.value;
                        this.Insurance.year = year.value;
                        this.Insurance.cropname = cropname.value;
                        this.Insurance.SumInsured = suminsured.value;
                        this.Insurance.Area = area.value;
                        this.Insurance.Userid = 1;*/
                        insuranceApplication.year = InsForm.year;
                        insuranceApplication.cropname = InsForm.cropname;
                        insuranceApplication.SumInsured = InsForm.SumInsured;
                        insuranceApplication.FarmId = fid;
                        insuranceApplication.UserID = uid;

                        db.InsuranceApplications.Add(insuranceApplication);
                        db.SaveChanges();
                        int PolicyNo = (from i in db.InsuranceApplications
                                        where i.UserID == uid
                                        select i.PolicyNo).FirstOrDefault();
                        return Ok("Added succesufully.Your Policy number is  " + PolicyNo.ToString() + " .Please use this number for future claim. ");

                    }
                }
                else
                {
                    return BadRequest("Data is not fatched from form");
                }
            }
            catch(Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}
