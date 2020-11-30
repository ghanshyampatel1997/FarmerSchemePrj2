using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    
    public class ViewMarketPlaceFarmerController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();
        //GET Method to fetch ViewMarket place
        #region View Market Place
        [HttpGet]
        public IHttpActionResult GetViewMarketplace()
        {
            var ViewMarketPlace = db.ViewMarketplace();

            if (ViewMarketPlace != null)
            {
                return Ok(ViewMarketPlace);
            }
            else
            {
                return NotFound();
            }
        }
        #endregion
    }
}
