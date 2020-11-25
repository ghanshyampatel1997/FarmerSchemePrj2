import { HttpClient } from '@angular/common/http';
import{Injectable} from '@angular/core'
import { InsuranceForm } from 'src/app/Models/Insurance.model';


@Injectable({providedIn:"root"})
export class InsuranceService
{
    constructor(private http:HttpClient)
        {
        }
        readonly uri="https://localhost:44334/api/InsuranceApplication";
        GetInsuranceForm() {
            return this.http.get(this.uri);
      }  
      InsertInsuranceForm(InsForm:InsuranceForm)
       {
        return this.http.post(this.uri,InsForm );
      }
}

