import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})
export class AdminBidderregisterApprovalservice
{
    constructor(private http:HttpClient)
        {
        }
        readonly uri="https://localhost:44334/api/AdminBidderRegistationApproval";
        Getbidderregisterdata() {
            return this.http.get(this.uri);
        }  
        Approvebidderregisterdata(Id:number) {
            return this.http.post(this.uri,Id);
        }  
   
}