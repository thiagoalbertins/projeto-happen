import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatNativeDateModule, MAT_DATE_LOCALE} from '@angular/material/core';
import { CadastroClienteComponent } from './components/cadastro-cliente/cadastro-cliente.component';
import { PerguntasComponent } from './components/perguntas/perguntas.component';
import { ResultadoComponent } from './components/resultado/resultado.component';
import { DataService } from './services/data/data.service';

@NgModule({
  declarations: [
    AppComponent,
    CadastroClienteComponent,
    PerguntasComponent,
    ResultadoComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    MatDatepickerModule,
    MatNativeDateModule
  ],
  providers: [{provide: MAT_DATE_LOCALE, useValue: 'pt-BR'}, DataService],
  bootstrap: [AppComponent]
})
export class AppModule { }
