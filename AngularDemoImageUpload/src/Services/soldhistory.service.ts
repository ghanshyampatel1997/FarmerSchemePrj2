import { HttpClient } from '@angular/common/http';
import{Injectable} from '@angular/core'
@Injectable({providedIn:"root"})
export class soldhistoryservice
{
    constructor(private http:HttpClient)
        {
        }
    Getsoldhistory()
      {
         // debugger;
         return this.http.get("https://localhost:44334/api/Soldhistory");
      }  
}