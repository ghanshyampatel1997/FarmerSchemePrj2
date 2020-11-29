import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})
export class BiddingStatusService
{
    constructor(private http:HttpClient)
        {
        }
        readonly uri="https://localhost:44334/api/AdminBidApproval";
        GetBiddingStatus() {
            return this.http.get(this.uri);
     
        }  
        ApproveBidStatusdata (ID:number)
        {
            return this.http.post(this.uri,ID);
        }

    }   