import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FarmerCropSellRequestComponent } from './farmer-crop-sell-request.component';

describe('FarmerCropSellRequestComponent', () => {
  let component: FarmerCropSellRequestComponent;
  let fixture: ComponentFixture<FarmerCropSellRequestComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FarmerCropSellRequestComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FarmerCropSellRequestComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
