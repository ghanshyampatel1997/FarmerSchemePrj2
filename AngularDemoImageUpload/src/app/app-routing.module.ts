import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { AdminFarmerRegiComponent } from './admin-farmer-regi/admin-farmer-regi.component';
import { BidderComponent } from './bidder/bidder.component';
import { ContactComponent } from './contact/contact.component';
import { FarmerCropSellRequestComponent } from './farmer-crop-sell-request/farmer-crop-sell-request.component';
import { HomeComponent } from './home/home.component';
import { InsuranceApplicationComponent } from './insurance-application/insurance-application.component';
import { InsuranceClaimComponent } from './insurance-claim/insurance-claim.component';
import { LoginComponent } from './login/login.component';
import { RegistrationComponent } from './registration/registration.component';
import { SoldhistoryComponent } from './soldhistory/soldhistory.component';
import { ViewmarketplaceComponent } from './viewmarketplace/viewmarketplace.component';

const routes: Routes = [
  {path:'About', component: AboutComponent},
  {path:'Contact', component: ContactComponent },
  {path: 'Home', component: HomeComponent},
  {path: 'Login', component: LoginComponent},
  {path: 'Bidder', component: BidderComponent},
  {path: 'Cropsell', component: FarmerCropSellRequestComponent},
  {path: 'SoldHistory', component:SoldhistoryComponent},
  {path: 'FarmerRegister', component:RegistrationComponent},
  {path: 'ViewMarketPlace', component:ViewmarketplaceComponent},
  {path: 'InsuranceApplication', component:InsuranceApplicationComponent},
  {path: 'InsuranceClaim', component:InsuranceClaimComponent},
  {path: 'AdminFamerRegister', component:AdminFarmerRegiComponent}
  
  //{path: '', redirectTo: '/Home', pathMatch:'full'}
  ];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
