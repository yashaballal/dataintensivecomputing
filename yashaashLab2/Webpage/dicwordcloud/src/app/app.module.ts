import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { TagCloudModule } from 'angular-tag-cloud-module';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { AgWordCloudModule } from 'angular4-word-cloud'

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    TagCloudModule,
    AgWordCloudModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
