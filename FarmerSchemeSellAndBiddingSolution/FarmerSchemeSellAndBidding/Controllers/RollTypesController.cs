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
    public class RollTypesController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();

        // GET: api/RollTypes
        public IQueryable<RollType> GetRollTypes()
        {
            return db.RollTypes;
        }

        // GET: api/RollTypes/5
        [ResponseType(typeof(RollType))]
        public IHttpActionResult GetRollType(int id)
        {
            RollType rollType = db.RollTypes.Find(id);
            if (rollType == null)
            {
                return NotFound();
            }

            return Ok(rollType);
        }

        // PUT: api/RollTypes/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutRollType(int id, RollType rollType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != rollType.UserID)
            {
                return BadRequest();
            }

            db.Entry(rollType).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RollTypeExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/RollTypes
        [ResponseType(typeof(RollType))]
        public IHttpActionResult PostRollType(RollType rollType)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.RollTypes.Add(rollType);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = rollType.UserID }, rollType);
        }

        // DELETE: api/RollTypes/5
        [ResponseType(typeof(RollType))]
        public IHttpActionResult DeleteRollType(int id)
        {
            RollType rollType = db.RollTypes.Find(id);
            if (rollType == null)
            {
                return NotFound();
            }

            db.RollTypes.Remove(rollType);
            db.SaveChanges();

            return Ok(rollType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool RollTypeExists(int id)
        {
            return db.RollTypes.Count(e => e.UserID == id) > 0;
        }
    }
}