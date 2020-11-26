import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import{FormsModule} from '@angular/forms'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FarmerCropSellRequestComponent } from './farmer-crop-sell-request/farmer-crop-sell-request.component';
import { UploadImageService } from '../Services/upload-image.service';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import{ReactiveFormsModule} from '@angular/forms';
import { BidderComponent } from './bidder/bidder.component'
import { BidderService } from '../Services/Bidder.service';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { SoldhistoryComponent } from './soldhistory/soldhistory.component';
import { soldhistoryservice } from 'src/Services/soldhistory.service';
import { RegistrationComponent } from './registration/registration.component';
import { BidderRegistrationComponent } from './bidder-registration/bidder-registration.component';
import { FarmerRegisterService } from 'src/Services/FarmerRegistration.service';
import { ViewmarketplaceComponent } from './viewmarketplace/viewmarketplace.component';
import { ViewMarketPlaceservice } from 'src/Services/viewmarketplace.service';
import { InsuranceApplicationComponent } from './insurance-application/insurance-application.component';
import { InsuranceService } from 'src/Services/Insurance.Service';
import { InsuranceClaimComponent } from './insurance-claim/insurance-claim.component';
import { Claimservice } from 'src/Services/Claim.service';
import { AdminFarmerRegiComponent } from './admin-farmer-regi/admin-farmer-regi.component';
import { Farmerregisterdataservice } from 'src/Services/AdminFarmerregi.service';


@NgModule({
  declarations: [
    AppComponent,
    FarmerCropSellRequestComponent,
    BidderComponent,
    AboutComponent,
    ContactComponent,
    HomeComponent,
    LoginComponent,
    SoldhistoryComponent,
    RegistrationComponent,
    BidderRegistrationComponent,
    ViewmarketplaceComponent,
    InsuranceApplicationComponent,
    InsuranceClaimComponent,
    AdminFarmerRegiComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    ReactiveFormsModule,

  ],
providers: [UploadImageService,BidderService,soldhistoryservice,
  FarmerRegisterService,ViewMarketPlaceservice,InsuranceService,
  Claimservice,Farmerregisterdataservice],
  bootstrap: [AppComponent]
})
export class AppModule { }
