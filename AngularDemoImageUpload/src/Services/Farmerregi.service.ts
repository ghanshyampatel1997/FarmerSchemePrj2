import { HttpClient } from '@angular/common/http'
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})
export class Farmerregisterdataservice
{
    constructor(private http:HttpClient)
        {
        }
        readonly uri="https://localhost:44334/api/AdminFarmer";
        Getfarmerregisterdata() {
            return this.http.get(this.uri);
      }  
    //   InsertInsuranceForm()
    //    {
    //     return this.http.post(this.uri,InsuranceForm );
    //   }
}