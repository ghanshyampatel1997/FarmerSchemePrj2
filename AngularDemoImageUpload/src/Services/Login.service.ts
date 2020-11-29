import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})


export class LoginService
{
    constructor(private http:HttpClient)
    {
        
    }
    readonly uri="https://localhost:44334/api/Login"
           
    GetLoginUserType(logindata)
     {
        return this.http.post(this.uri,logindata);
     }
    //  Approvefarmerselldata(Id:number)
    //   {
    //   return this.http.post(this.uri,Id);
    //  }
}
   
