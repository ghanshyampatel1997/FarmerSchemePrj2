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
    public class CroppricesController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();

        // GET Method to Fetch Cropprice Table
        #region FetchCropDetails
        public IQueryable<Cropprice> GetCropprices()
        {
            return db.Cropprices;
        }
        #endregion
        //Get Method to Fetch Cropprice Table
        // GET: api/Cropprices/5
        #region FetchPerticularCropDetails
        [ResponseType(typeof(Cropprice))]
        public IHttpActionResult GetCropprice(int id)
        {
            Cropprice cropprice = db.Cropprices.Find(id);
            if (cropprice == null)
            {
                return NotFound();
            }

            return Ok(cropprice);
        }

            #endregion
    }
}
