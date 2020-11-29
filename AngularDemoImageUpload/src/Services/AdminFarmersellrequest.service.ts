import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})


export class Farmersellrequestapproval
{
    constructor(private http:HttpClient)
    {
        
    }
    readonly uri="https://localhost:44334/api/AdminFarmerSellRequest"
           
    Getfarmersellrequestdata()
     {
        return this.http.get(this.uri);
     }
     Approvefarmerselldata(Id:number)
      {
      return this.http.post(this.uri,Id);
     }
}
   
