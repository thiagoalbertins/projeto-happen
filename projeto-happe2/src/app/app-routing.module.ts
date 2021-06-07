import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CadastroClienteComponent } from './components/cadastro-cliente/cadastro-cliente.component';
import { PerguntasComponent } from './components/perguntas/perguntas.component'

const routes: Routes = [
  { path: '', redirectTo: 'cadastro-cliente', pathMatch: 'full' },
  { path: 'cadastro-cliente', component: CadastroClienteComponent },
  { path: 'perguntas', component: PerguntasComponent },
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }