import { Component } from '@angular/core';
import { CloudData, CloudOptions, ZoomOnHoverOptions } from 'angular-tag-cloud-module';
import { AgWordCloudData } from 'angular4-word-cloud';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})

export class AppComponent {

 public wordCountDisplay:boolean = false;
 public countDisplay1 = 0;
 public countDisplay2 = 0;
 public countDisplay3 = 0;
 public countDisplay4 = 0;
 public countDisplay5 = 0;
 public countDisplay6 = 0;
 
 public displayValue = 'Twitter Data';
 public displayFlag:boolean = false; 
 public conditionFlag1:boolean = true; 
 public conditionFlag2:boolean = false; 
 public conditionFlag3:boolean = false; 


 options1 = {
    settings: {
        minFontSize: 200,
        maxFontSize: 1000,
    },
    margin: {
        top: 0,
        right: 0,
        bottom: 0,
        left: 0
    },
    labels: false // false to hide hover labels
};

  zoomOnHoverOptions: ZoomOnHoverOptions = {
    scale: 1.3, // Elements will become 130 % of current zize on hover
    transitionTime: 0.3, // it will take 1.2 seconds until the zoom level defined in scale property has been reached
    delay: 0.3 // Zoom will take affect after 0.8 seconds
  };
 


  countVal1 = {'avengersendgame': 8204,
  'avengers':1320,
  'comic': 1004,
  'marvel': 1004,
  'movie': 1233,
  'thanos': 123,
  'about': 3445,
  'think': 2324,
  'endgame': 465,
  'still':3445,
  'people': 567
  }

countVal2 = {'marvel|avengers': 1988,
  'avengers|end':1142,
  'avengers|endgame': 5084,
  'avengers|marvel': 1982,
  'avengers|game': 1069,
  'avengers|avengersendgame': 1033,
  'avengers|movie': 3445,
  'avengers|infinity': 611,
  'avengers|que': 1038,
  'avengers|war':686,
  'avengers|los': 456
  }

countVal3 = {'captain': 3467,
  'comic':1320,
  'batman': 1004,
  'series': 1004,
  'creator': 1233,
  'marvel': 123,
  'story': 3445,
  'first': 2324,
  'strong': 465,
  'about':3445,
  'detective': 567
  }

countVal4 = {'marvel|captain': 4367,
  'marvel|costume':1320,
  'marvel|into': 1004,
  'captain|comic': 1004,
  'comic|marvel': 1233,
  'captain|hero': 123,
  'marvel|hero': 3445,
  'marvel|became': 2324,
  'comic|dc': 465,
  'marvel|power':3445,
  'marvel|danvers': 567
  }


countVal5 = {'more': 15365,
  'hours':14960,
  'some': 10983,
  'comic': 22501,
  'marvel': 13834,
  'tmnt': 13688,
  'issue': 19943,
  'member': 18041,
  'scored': 17344,
  'film':7557,
  'just': 8353
  }

countVal6 = {'more|volume': 1705,
  'film|new':1535,
  'some|spiderman': 1416,
  'more|than': 998,
  'some|home': 1416,
  'comic|book': 1416,
  'some|far': 1416,
  'more|see': 2324,
  'some|eggs': 465,
  'some|identities':3445,
  }

  data1: Array<AgWordCloudData> = [
  	{ text: 'avengersendgame', size:50},
    { text: 'avengers', size: 25},
    { text: 'comic', size: 20 },
    { text: 'marvel', size: 20},
    { text: 'movie', size: 40},
    { text: 'thanos', size: 30},
    { text: 'about', size: 20},
    { text: 'think', size: 40},
    { text: 'endgame', size: 20},
    { text: 'still', size: 45},
    { text: 'people', size: 16}
  ];

  data2: Array<AgWordCloudData> = [
  	{ text: 'marvel|avengers', size: 5},
    { text: 'avengers|end', size: 7},
    { text: 'avengers|endgame', size: 9},
    { text: 'avengers|marvel', size: 3},
    { text: 'avengers|game', size: 4},
    { text: 'avengers|avengersendgame', size: 10},
    { text: 'avengers|movie', size: 20},
    { text: 'avengers|infinity', size: 4},
    { text: 'avengers|que', size: 2},
    { text: 'avengers|war', size: 6},
    { text: 'avengers|los', size: 9}
  ];

  data3: Array<AgWordCloudData> = [
  	{ text: 'captain', size: 5},
    { text: 'comic', size: 7},
    { text: 'batman', size: 9},
    { text: 'series', size: 3},
    { text: 'creator', size: 4},
    { text: 'marvel', size: 10},
    { text: 'story', size: 20},
    { text: 'first', size: 4},
    { text: 'strong', size: 2},
    { text: 'about', size: 6},
    { text: 'detective', size: 9}
  ];

  data4: Array<AgWordCloudData> = [
  	{ text: 'marvel|captain', size: 5},
    { text: 'marvel|costume', size: 7},
    { text: 'marvel|into', size: 9 },
    { text: 'captain|comic', size: 3},
    { text: 'comic|marvel', size: 4},
    { text: 'captain|hero', size: 10},
    { text: 'marvel|hero', size: 20},
    { text: 'marvel|became', size: 4},
    { text: 'comic|dc', size: 2},
    { text: 'marvel|power', size: 6},
    { text: 'marvel|danvers', size: 9}
  ];

  data5: Array<AgWordCloudData> = [
  	{ text: 'more', size: 5},
    { text: 'hours', size: 7},
    { text: 'some', size: 9},
    { text: 'comic', size: 3},
    { text: 'marvel', size: 4},
    { text: 'tmnt', size: 10},
    { text: 'issue', size: 20},
    { text: 'member', size: 4},
    { text: 'scored', size: 2},
    { text: 'film', size: 6},
    { text: 'just', size: 9}
  ];

  data6: Array<AgWordCloudData> = [
  	{ text: 'more|volume', size: 5},
    { text: 'film|new', size: 7 },
    { text: 'some|spiderman', size: 9},
    { text: 'more|than', size: 3},
    { text: 'some|home', size: 4},
    { text: 'comic|book', size: 10},
    { text: 'some|far', size: 20 },
    { text: 'more|see', size: 4 },
    { text: 'some|eggs', size: 2},
    { text: 'some|identities', size: 6},
  ];

   DataOptions: any = ['Twitter Data','NYT Data','Common Crawl Data']

  changeSelection(event)
  {
  	this.displayValue = event.target.value
  	this.displayFlag = true
  	if(this.displayValue === 'Twitter Data')
  	{
  		this.conditionFlag2 =false;
  		this.conditionFlag3 =false
  		this.conditionFlag1 = true;
  	}
  	else if(this.displayValue === 'NYT Data')
  	{
  		this.conditionFlag2 =true;
  		this.conditionFlag3 =false
  		this.conditionFlag1 = false;
  	}
  	else if(this.displayValue === 'Common Crawl Data')
  	{
  		this.conditionFlag2 =false;
  		this.conditionFlag3 =true
  		this.conditionFlag1 = false;
  	}


  }

  logClicked1(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay1 = this.countVal1[(click.target as Element).innerHTML];
  }

  logClicked2(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay2 = this.countVal2[(click.target as Element).innerHTML];
  }

  logClicked3(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay3 = this.countVal3[(click.target as Element).innerHTML];
  }

  logClicked4(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay4 = this.countVal4[(click.target as Element).innerHTML];
  }

  logClicked5(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay5 = this.countVal5[(click.target as Element).innerHTML];
  }

  logClicked6(click){
  	this.wordCountDisplay = true;
  	console.log((click.target as Element).innerHTML)
  	this.countDisplay6 = this.countVal6[(click.target as Element).innerHTML];
  }

}
