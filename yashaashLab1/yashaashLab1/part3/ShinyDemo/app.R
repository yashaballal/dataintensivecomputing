library(shiny)
library(ggplot2)
library(dplyr)
library(sp)
library(stringr)
library(maps)
library(maptools)
library(ggthemes)

ui <- fluidPage(
titlePanel("Influenza Heat Maps"),                                                                                #this be the title
  sidebarLayout(position = "left",  
      sidebarPanel("Select Options",
           selectInput("state", "Select an option",                                                                   #this be the map choice select button
           list( "CDC Map","Twitter Maps","CDC vs Twitter Maps", "Select Key Plots"))
      ),
      mainPanel(
      h3(textOutput("selected_var")),
      column(4,plotOutput("plot1", width="800px", height = "500px", click="plot_click"),
      column(4,plotOutput("plot2", width="800px", height = "500px", click="plot_click")))
      )))

server <- function(input, output) {

  output$selected_var <- renderPrint({
      if (is.null(input$state))                                                                                     
      {return(NULL)} else if (input$state == "CDC Map" ){
      paste("This is the map as per CDC website")
     } else if (input$state == "Twitter Maps" ){
      paste("This is the data collected through Twitter")
     } else if (input$state == "CDC vs Twitter Maps" ){
      paste("This is the comparison between CDC and Twitter data.
        According to Twitter data, the chances of flu are maximum in California followed by Texas.
        According to the CDC data,Texas and the areas around it are high risk indeed, while California belongs to the low category")
     } else if (input$state == "Select Key Plots" ){
      paste("This is the data that is collected for the keywords flu and influenza")
     }

    })
  output$plot1 <- renderPlot({
   if (is.null(input$state))                                                                                     
      return(NULL)

  if (input$state == "CDC Map" ){
  fun1 <- function(x1){
    y<-vector()
    for(x in x1)
    {
        if(x=='Level 10')
        {
            y<-c(y,10)
        }
        else if(x=='Level 9')
        {
            y<-c(y,9)
        }
        else if(x=='Level 8')
        {
            y<-c(y,8)
        }
        else if(x=='Level 7')
        {
            y<-c(y,7)
        }
        else if(x=='Level 6')
        {
            y<-c(y,6)
        }
        else if(x=='Level 5')
        {
            y<-c(y,5)
        }
        else if(x=='Level 4')
        {
            y<-c(y,4)
        }
        else if(x=='Level 3')
        {
            y<-c(y,3)
        }
        else if(x=='Level 2')
        {
            y<-c(y,2)
        }
        else if(x=='Level 1')
        {
            y<-c(y,1)
        }
    }
    return(y)
}
  fulldata<-read.csv("StateDataforMap_2018-19week6.csv")
  fulldata$region <- tolower(fulldata$STATENAME)

  us_states<-map_data("state")
  INFLUENZA<-merge(us_states,fulldata,by="region")
  INFLUENZA$activity<- as.character(INFLUENZA$ACTIVITY.LEVEL)
  INFLUENZA$LEVEL <- fun1(INFLUENZA$activity)
  states_map <- map_data("state")
  return(ggplot(INFLUENZA, aes(map_id = INFLUENZA$region)) + 
  geom_map(aes(fill = INFLUENZA$LEVEL), map = states_map, colour="grey0") +
  scale_fill_gradientn(colours=c("green","yellow","red")) + 
  expand_limits(x = states_map$long, y = states_map$lat)+theme_map())
  }

  if (input$state == "Twitter Maps" ){
   latlong2state <- function(pointsDF) {
  # Prepare SpatialPolygons object with one SpatialPolygon
  # per state (plus DC, minus HI & AK)
  states <- map('state', fill=TRUE, col="transparent", plot=FALSE)
  IDs <- sapply(strsplit(states$names, ":"), function(x) x[1])
  states_sp <- map2SpatialPolygons(states, IDs=IDs,
                                   proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Convert pointsDF to a SpatialPoints object 
  pointsSP <- SpatialPoints(pointsDF, 
                            proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Use 'over' to get _indices_ of the Polygons object containing each point 
  indices <- over(pointsSP, states_sp)
  
  # Return the state names of the Polygons object containing each point
  stateNames <- sapply(states_sp@polygons, function(x) x@ID)
  stateNames[indices]
}
load("DataFinal.Rdata")
df1<-data.frame(rt3$lng,rt3$lat)
testPoints<- latlong2state(df1)
testPoints<- testPoints[!is.na(testPoints)]
finaltp<- as.data.frame(table(testPoints))
finaltp$region<- finaltp$testPoints


library(ggplot2)
library(dplyr)

us_states<-map_data("state")
INFLUENZA<-merge(us_states,finaltp,by="region", all.x=TRUE, all.y=TRUE )
INFLUENZA[is.na(INFLUENZA)]<-0

#https://stackoverflow.com/questions/24399367/plot-fill-color-map-with-usa-states-data-in-r
states_map <- map_data("state")
 return(ggplot(INFLUENZA, aes(map_id = INFLUENZA$region)) + 
  geom_map(aes(fill = INFLUENZA$Freq), map = states_map, colour="grey0") +
  scale_fill_gradientn(colours=c("green","yellow","red")) + 
  expand_limits(x = states_map$long, y = states_map$lat)+theme_map())
  }

  

 if (input$state == "CDC vs Twitter Maps" ){
  fun1 <- function(x1){
    y<-vector()
    for(x in x1)
    {
        if(x=='Level 10')
        {
            y<-c(y,10)
        }
        else if(x=='Level 9')
        {
            y<-c(y,9)
        }
        else if(x=='Level 8')
        {
            y<-c(y,8)
        }
        else if(x=='Level 7')
        {
            y<-c(y,7)
        }
        else if(x=='Level 6')
        {
            y<-c(y,6)
        }
        else if(x=='Level 5')
        {
            y<-c(y,5)
        }
        else if(x=='Level 4')
        {
            y<-c(y,4)
        }
        else if(x=='Level 3')
        {
            y<-c(y,3)
        }
        else if(x=='Level 2')
        {
            y<-c(y,2)
        }
        else if(x=='Level 1')
        {
            y<-c(y,1)
        }
    }
    return(y)
}
  load("DataFinal.Rdata")
  fulldata<-read.csv("StateDataforMap_2018-19week6.csv")
  fulldata$region <- tolower(fulldata$STATENAME)

  us_states<-map_data("state")
  INFLUENZA<-merge(us_states,fulldata,by="region")
  INFLUENZA$activity<- as.character(INFLUENZA$ACTIVITY.LEVEL)
  INFLUENZA$LEVEL <- fun1(INFLUENZA$activity)
  states_map <- map_data("state")
  return(ggplot(INFLUENZA, aes(map_id = INFLUENZA$region)) + 
  geom_map(aes(fill = INFLUENZA$LEVEL), map = states_map, colour="grey0") +
  scale_fill_gradientn(colours=c("green","yellow","red")) + 
  expand_limits(x = states_map$long, y = states_map$lat)+theme_map())
  }

if (input$state == "Select Key Plots" ){

latlong2state <- function(pointsDF) {
  # Prepare SpatialPolygons object with one SpatialPolygon
  # per state (plus DC, minus HI & AK)
  states <- map('state', fill=TRUE, col="transparent", plot=FALSE)
  IDs <- sapply(strsplit(states$names, ":"), function(x) x[1])
  states_sp <- map2SpatialPolygons(states, IDs=IDs,
                                   proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Convert pointsDF to a SpatialPoints object 
  pointsSP <- SpatialPoints(pointsDF, 
                            proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Use 'over' to get _indices_ of the Polygons object containing each point 
  indices <- over(pointsSP, states_sp)
  
  # Return the state names of the Polygons object containing each point
  stateNames <- sapply(states_sp@polygons, function(x) x@ID)
  stateNames[indices]
}
load("DataFinal.Rdata")
df1<-data.frame(rtflu$lng,rtflu$lat)
testPoints<- latlong2state(df1)
testPoints<- testPoints[!is.na(testPoints)]
finaltp<- as.data.frame(table(testPoints))
finaltp$region<- finaltp$testPoints


library(ggplot2)
library(dplyr)
us_states<-map_data("state")
INFLUENZA<-merge(us_states,finaltp,by="region", all.x=TRUE, all.y=TRUE )
INFLUENZA[is.na(INFLUENZA)]<-0

#https://stackoverflow.com/questions/24399367/plot-fill-color-map-with-usa-states-data-in-r
states_map <- map_data("state")
 return(ggplot(INFLUENZA, aes(map_id = INFLUENZA$region)) + 
  geom_map(aes(fill = INFLUENZA$Freq), map = states_map, colour="grey0") +
  scale_fill_gradientn(colours=c("green","yellow","red")) + 
  expand_limits(x = states_map$long, y = states_map$lat)+theme_map())
}})

output$plot2 <- renderPlot({
    if (input$state == "Twitter Maps" || input$state == "CDC Map")
        return (NULL)

    if (input$state == "CDC vs Twitter Maps" ){
latlong2state <- function(pointsDF) {
  # Prepare SpatialPolygons object with one SpatialPolygon
  # per state (plus DC, minus HI & AK)
  states <- map('state', fill=TRUE, col="transparent", plot=FALSE)
  IDs <- sapply(strsplit(states$names, ":"), function(x) x[1])
  states_sp <- map2SpatialPolygons(states, IDs=IDs,
                                   proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Convert pointsDF to a SpatialPoints object 
  pointsSP <- SpatialPoints(pointsDF, 
                            proj4string=CRS("+proj=longlat +datum=WGS84"))
  
  # Use 'over' to get _indices_ of the Polygons object containing each point 
  indices <- over(pointsSP, states_sp)
  
  # Return the state names of the Polygons object containing each point
  stateNames <- sapply(states_sp@polygons, function(x) x@ID)
  stateNames[indices]
}
load("DataFinal.Rdata")
df1<-data.frame(rt3$lng,rt3$lat)
testPoints<- latlong2state(df1)
testPoints<- testPoints[!is.na(testPoints)]
finaltp<- as.data.frame(table(testPoints))
finaltp$region<- finaltp$testPoints


library(ggplot2)
library(dplyr)
us_states<-map_data("state")
INFLUENZA<-merge(us_states,finaltp,by="region", all.x=TRUE, all.y=TRUE )
INFLUENZA[is.na(INFLUENZA)]<-0

#https://stackoverflow.com/questions/24399367/plot-fill-color-map-with-usa-states-data-in-r
states_map <- map_data("state")
 return(ggplot(INFLUENZA, aes(map_id = INFLUENZA$region)) + 
  geom_map(aes(fill = INFLUENZA$Freq), map = states_map, colour="grey0") +
  scale_fill_gradientn(colours=c("green","yellow","red")) + 
  expand_limits(x = states_map$long, y = states_map$lat)+theme_map())
    }
    })
}

shinyApp(ui, server)