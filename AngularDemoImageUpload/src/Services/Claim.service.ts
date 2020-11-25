import { HttpClient } from '@angular/common/http';
import{Injectable} from '@angular/core'
import { Claim } from 'src/app/Models/Claim.Model';
@Injectable({providedIn:"root"})
export class Claimservice
{
    constructor(private http:HttpClient)
        {
        }
        readonly uri="https://localhost:44334/api/InsuranceClaim/";
       
      
      getInsData(pn:number)
      {
        return this.http.get("https://localhost:44334/api/InsuranceClaim?Pn="+pn);
      }
      InsertClaimForm(InsClaim:Claim)
       {
        return this.http.post(this.uri,InsClaim );
      }
}