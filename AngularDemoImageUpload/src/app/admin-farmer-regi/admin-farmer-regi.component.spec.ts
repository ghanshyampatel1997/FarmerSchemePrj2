import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminFarmerRegiComponent } from './admin-farmer-regi.component';

describe('AdminFarmerRegiComponent', () => {
  let component: AdminFarmerRegiComponent;
  let fixture: ComponentFixture<AdminFarmerRegiComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminFarmerRegiComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminFarmerRegiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
