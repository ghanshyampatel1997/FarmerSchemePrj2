using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace FarmerSchemeSellAndBidding.Controllers
{
    public class LoginController : ApiController
    {
        private FarmerSchemeDBEntities4 db = new FarmerSchemeDBEntities4();
//Post Method To login
#region CheckingLoginCredential
        [HttpPost]
        public IHttpActionResult Getlogindata(dynamic login)
        {
            if (login != null)
            {
                string utype;
                string upass;
                string type = login.usertype;
                string pw = login.password;
                if (type.ToLower()=="admin")
                {
                    string uid1 = login.userid;
                    string pas;
                    try
                    {
                        //To check Password match for User id
                        pas = (from a in db.Admins
                                      where a.AdminID == uid1
                                      select a.Password).First();
                    }
                    catch
                    {
                        return BadRequest("User id is incorrect.");
                    }
                    if(pw==pas)
                    {
                        string[] data = {"admin",uid1};
                        return Ok(data);
                    }
                    else
                    {
                        return BadRequest("Password incorrect");
                    }
                }
                else
                {
                    int uid = login.userid;
                    //To check userid is available or not
                    try
                    {
                        utype = (from u in db.RollTypes
                                 where u.UserID == uid
                                 select u.RollType1).First();
                    }
                    catch
                    {
                        return BadRequest("Userid is incorrect.");
                    }
                    if (type.ToLower() == utype.ToLower())
                    {
                        upass = (from r in db.RollTypes
                                 join u in db.UserRegisters
                                 on r.UserEmailId equals u.UserEmailId
                                 where r.UserID == uid && r.RollType1.ToLower() == type.ToLower()
                                 select u.password).FirstOrDefault();
                        if (upass == pw)
                        {
                        //To check whether Admin  approved or not
                            bool? status = (from u in db.RollTypes
                                           where u.UserID == uid
                                           select u.ApprovedStatus).FirstOrDefault();
                            if(status==null)
                            {
                                return BadRequest("You are not approved by Admin. Contact admin for details, provided in contact us page.");
                            }
                            else
                            {
                                string name = (from r in db.RollTypes
                                         join u in db.UserRegisters
                                         on r.UserEmailId equals u.UserEmailId
                                         where r.UserID == uid && r.RollType1.ToLower() == type.ToLower()
                                         select u.fullname).FirstOrDefault();
                                string[] data = { type.ToLower(), name };
                                return Ok(data);
                                
                            }
                        }
                        else
                        {
                            return BadRequest("Password is incorrect.");
                        }
                    }
                    else
                    {
                        return BadRequest("User id and usertype does not match.");
                    }

                }

            }
            else
            {
                return NotFound();
            }
        }
        #endregion
    }
}
