import { Component, Input, OnDestroy, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { DataService } from 'src/app/services/data/data.service';

@Component({
  selector: 'app-resultado',
  templateUrl: './resultado.component.html',
  styleUrls: ['./resultado.component.css']
})
export class ResultadoComponent implements OnInit, OnDestroy {

  @Input() resultado: any;
  
  submited1:boolean;
  submited2:boolean;
  subscription: Subscription;

  constructor(private data: DataService) { }

  ngOnInit() {
    this.subscription = this.data.currentSubmited2.subscribe(submited2 => this.submited2 = submited2)
    this.subscription = this.data.currentSubmited2.subscribe(submited1 => this.submited1 = submited1)
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }

  newSubmited() {
    this.data.changeSubmited()
  }

}
