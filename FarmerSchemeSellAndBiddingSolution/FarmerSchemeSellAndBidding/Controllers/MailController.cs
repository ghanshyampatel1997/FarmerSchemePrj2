using FarmerSchemeSellAndBidding.Models;
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
        //Post method when user forgots the password
        #region SendMailForForgotPassword
        [HttpPost] 
        public async Task<string> GetMail(dynamic mailid)
        {
            string email= mailid.mailid;
            if(mailid != null)
            {
            // TO check whether email is present or not if yes, then password will be sent to the registered Emailid.
                if (Db.UserRegisters.FirstOrDefault(u => u.UserEmailId == email) is null) return "Invalid Email Id";
                //Random generator = new Random();
                //int r = generator.Next(100000, 1000000);
                string r = (from u in Db.UserRegisters
                     where u.UserEmailId == email
                     select u.password).FirstOrDefault();
                var e = r;

                //Decryption
                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                System.Text.Decoder utf8Decode = encoder.GetDecoder();
                byte[] todecode_byte = Convert.FromBase64String(e);
                int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                char[] decoded_char = new char[charCount];
                utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                string pass = new String(decoded_char);


                SmtpClient smtp = new SmtpClient();
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("FarmerScheme@gmail.com");
                mailMessage.To.Add(email);
                mailMessage.Subject = "Forgot Password Of Farmer Scheme Web Application.";
                mailMessage.Body = "Dear User.Your password is " + pass + ". Kindly Remember it for future login into the system";
                await Task.Run(() => smtp.SendAsync(mailMessage, null));
                return r;

            }
            else
            {
                return "Invalid Email Id";
            }
            
        }
#endregion
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
