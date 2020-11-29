﻿using FarmerSchemeSellAndBidding.Models;
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
        FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        [HttpGet]
        public IHttpActionResult geBiddingStatusDetails()
        {
            try
            {
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

        [HttpPost]
        public IHttpActionResult PostBidStat(dynamic id)
        {
            try
            {
                int ID = Convert.ToInt32(id);
                BiddingTable Bid = (from b in Db.BiddingTables
                                    where b.BidID == ID
                                    select b).First();
                Bid.ApprovedBid = true;
                Db.Entry(Bid).State = EntityState.Modified;
                Db.SaveChanges();
                return Ok("Bid approved!!");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }


    }
}