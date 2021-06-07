import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable()
export class DataService {

  private submited1Source = new BehaviorSubject(false);
  currentSubmited1 = this.submited1Source.asObservable();

  private submited2Source = new BehaviorSubject(false);
  currentSubmited2 = this.submited2Source.asObservable();

  constructor() { }

  changeSubmited() {
    this.submited1Source.next(false)
    this.submited2Source.next(false)
  }

}