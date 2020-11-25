using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class SoldhistoryController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();
        public IHttpActionResult Getsoldhistory()
        {
            return Ok(db.Soldhistory());
        }
    }
}
