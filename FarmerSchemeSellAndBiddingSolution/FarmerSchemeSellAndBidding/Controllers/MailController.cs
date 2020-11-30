﻿using FarmerSchemeSellAndBidding.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web.Http;



namespace FarmerSchemeSellAndBidding.Controllers
{
    public class MailController : ApiController
    {
        private FarmerSchemeDBEntities4 Db = new FarmerSchemeDBEntities4();
        //Post method when we forgot our password
        [HttpPost]
        public async Task<string> GetMail(dynamic mailid)
        {
            string email= mailid.mailid;
            if(mailid != null)
            {
            // TO check email is present are not if yes then pass word will send to Email
                if (Db.UserRegisters.FirstOrDefault(u => u.UserEmailId == email) is null) return "Invalid Email Id";
                //Random generator = new Random();
                //int r = generator.Next(100000, 1000000);
                string r = (from u in Db.UserRegisters
                     where u.UserEmailId == email
                     select u.password).FirstOrDefault();
                SmtpClient smtp = new SmtpClient();
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("FarmerScheme@gmail.com");
                mailMessage.To.Add(email);
                mailMessage.Subject = "Forgot Password Of Farmer Scheme Web Application.";
                mailMessage.Body = "Dear User.Your password is " + r + ". Kindly Remember it for future login into the system";
                await Task.Run(() => smtp.SendAsync(mailMessage, null));
                return r;

            }
            else
            {
                return "Invalid Email Id";
            }
            
        }

        //[HttpGet]
        //public async Task ResendOtp(string email, string pass)  
        //{
        //    SmtpClient smtp = new SmtpClient();
        //    MailMessage mailMessage = new MailMessage();
        //    mailMessage.From = new MailAddress("FarmerScheme@gmail.com");
        //    mailMessage.To.Add(email);
        //    mailMessage.Subject = "Forgot Password";
        //    mailMessage.Body = "Dear User,Your OTP is " + pass;
        //    await Task.Run(() => smtp.SendAsync(mailMessage, null));
        //}

    }
}
