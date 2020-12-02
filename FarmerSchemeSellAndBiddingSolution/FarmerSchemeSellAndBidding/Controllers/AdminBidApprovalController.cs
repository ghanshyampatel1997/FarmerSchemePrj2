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
    public class AdminBidApprovalController : ApiController
    {
    //Adding Database Entity
        FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        //Get Method to Fetch Biddingdata
        #region Getbiddingstatus
        [HttpGet]
        public IHttpActionResult getBiddingStatusDetails()
        {
        //using trycatch block for error handiling
            try
            {
            //Linq query to fetch data
                dynamic biddingdata = (from b in Db.BiddingTables
                                       join f in Db.FarmerCropdetils
                                       on b.FarmerSellID equals f.FarmerSellID
                                       join c in Db.Cropprices
                                       on f.CropId equals c.CropId
                                       join r in Db.RollTypes
                                       on f.UserID equals r.UserID
                                       join u in Db.UserRegisters
                                       on r.UserEmailId equals u.UserEmailId

                                       select new
                                       {
                                           b.BidID,
                                           b.bidAmount,
                                           b.date,
                                           b.ApprovedBid,
                                           b.Biddingdate,
                                           u.fullname,
                                           f.cropType,
                                           f.CropId,
                                           f.quantity,
                                           c.cropname,
                                           c.MSP
                                       }).ToList();
                return Ok(biddingdata);
            }
            catch
            {
                return BadRequest("No Data Found!!!");
            }
        }
        #endregion
//post method to Add Approvedstatus column
#region POstBidstatus
        [HttpPost]
        public IHttpActionResult PostBidStat(dynamic id)
        {
         //using trycatch block for error handiling
            try
            {
                int ID = Convert.ToInt32(id);
                BiddingTable Bid = (from b in Db.BiddingTables
                                    where b.BidID == ID
                                    select b).First();
                Bid.date = DateTime.Now;
                Bid.ApprovedBid = true;
                //To update Approvedbid
                Db.Entry(Bid).State = EntityState.Modified;
                Db.SaveChanges();
                return Ok("Bid approved!!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

#endregion
    }
}
