import { HttpClient } from '@angular/common/http';

import{Injectable} from '@angular/core'

@Injectable({providedIn:"root"})
export class ViewMarketPlaceservice
{

    constructor(private http:HttpClient)
        {

        }

    GetViewMarketplace()
      {
          let data;
         // debugger;
         return data=this.http.get("https://localhost:44334/api/ViewMarketPlaceFarmer");
         console.log(data);
      }  
}