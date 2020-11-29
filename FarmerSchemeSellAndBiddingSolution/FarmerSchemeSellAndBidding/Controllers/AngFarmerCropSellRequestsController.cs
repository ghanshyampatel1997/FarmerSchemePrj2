using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Description;
using FarmerSchemeSellAndBidding.Models;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class AngFarmerCropSellRequestsController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();

        // POST: api/AngFarmerCropSellRequests
        [ResponseType(typeof(AngFarmerCropSellRequest))]
        public HttpResponseMessage PostAngFarmerCropSellRequest()
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateResponse(HttpStatusCode.NotAcceptable);
                //return BadRequest(ModelState);
            }
            try
            {
                string imageName = null;
                var httpRequest = HttpContext.Current.Request;
                //Upload Image
                var postedFile = httpRequest.Files["Image"];
                //Create custom filename
                imageName = new String(Path.GetFileNameWithoutExtension(postedFile.FileName).Take(10).ToArray()).Replace(" ", "-");
                imageName = imageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(postedFile.FileName);
                var filePath = "D:/desktop/dotnet training/Final Project Repository/FarmerSchemePrj2/AngularDemoImageUpload/src/assets/img/" + imageName;
                postedFile.SaveAs(filePath);
                string filepath2 = "/assets/img/" + imageName;

                string cname = httpRequest["Crope Name"];
                int cid = (from cr in db.Cropprices
                           where cr.cropname == cname
                           select cr.CropId).First();

                FarmerCropdetil farmerCropdetil = new FarmerCropdetil();

                farmerCropdetil.cropType = httpRequest["Crope type"];
                farmerCropdetil.CropId = cid;//httpRequest["Crope Name"];
                farmerCropdetil.fertilizerType = httpRequest["Fertilizer type"];
                farmerCropdetil.quantity = Convert.ToInt32(httpRequest["Quantity"]);
                farmerCropdetil.SoilPHCertificate = filepath2;
                farmerCropdetil.AddedDate = DateTime.Now;
                farmerCropdetil.UserID= Convert.ToInt32(httpRequest["userid"]);

                db.FarmerCropdetils.Add(farmerCropdetil);
                db.SaveChanges();

                return Request.CreateResponse(HttpStatusCode.Created,"Your Request for Sell Crop is Submitted");
            }
            catch(Exception e)
            {
                return Request.CreateResponse(HttpStatusCode.OK, e.Message);
            }
            //int cid = (from cr in db.Cropprices
            //           where cr.cropname == angFarmerCropSellRequest.cropname
            //           select cr.CropId).First();

            //FarmerCropdetil farmerCropdetil = new FarmerCropdetil();

            //farmerCropdetil.cropType = angFarmerCropSellRequest.cropType;
            //farmerCropdetil.CropId = cid;
            //farmerCropdetil.fertilizerType = angFarmerCropSellRequest.fertilizerType;
            //farmerCropdetil.quantity = angFarmerCropSellRequest.quantity;
            //farmerCropdetil.SoilPHCertificate = angFarmerCropSellRequest.SoilPHCertificate;

            //db.FarmerCropdetils.Add(farmerCropdetil);
            //db.SaveChanges();

            //return Ok();
        }

       
    }
}