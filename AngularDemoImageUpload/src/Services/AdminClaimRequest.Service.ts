import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})


export class Claimrequestservice
{
    constructor(private http:HttpClient)
    {
        
    }
    readonly uri="https://localhost:44334/api/AdminClaimApproval"
           
    Getclaimrequestdata()
     {
        return this.http.get(this.uri);
     }
     Approveclaimdata(Num:number)
      {
      return this.http.post(this.uri,Num);
     }
}