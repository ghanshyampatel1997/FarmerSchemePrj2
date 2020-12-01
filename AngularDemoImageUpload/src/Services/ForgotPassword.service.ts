import { HttpClient } from '@angular/common/http';
import{Injectable} from '@angular/core'

@Injectable({providedIn:"root"})
export class ForgotPasswordservice
{
    constructor(private http:HttpClient)
        {
        }
        // readonly uri="https://localhost:44334/api/Mail";

      getPassMail(mail)
      {
        return this.http.post("https://localhost:44334/api/Mail",mail);
      }
    //   PostRepassMail(mail,passs)
    //    {
    //     return this.http.post(mail,passs);
    //   }
}