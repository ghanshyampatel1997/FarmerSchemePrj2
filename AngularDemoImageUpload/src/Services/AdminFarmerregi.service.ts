import { HttpClient } from '@angular/common/http'
import { identifierName } from '@angular/compiler';
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
        Approvefarmerregisterdata(Id:number) {
            return this.http.post(this.uri,Id);
        }  
    //   InsertInsuranceForm()
    //    {
    //     return this.http.post(this.uri,InsuranceForm );
    //   }
}