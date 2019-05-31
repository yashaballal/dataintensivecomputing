
				 			DIC Lab 1 ReadMe File
				 	Authors- Yasha Ballal and Abhinav Neelakantan
	Overall:
		The project is divided into three folders. One for each part of the lab.
		Each lab contains the source and input files for the given parts.
		Each part can be run in a jupyter noteboook in with a R kernel
	Installations:
	
		Jupyter notebook and R can be installed using anaconda
		R version used is 3.5.2
		R files can also be opened and executed using Rstudio.

	
		Some libraries need to be pre-installed for each part of R
		They are as following:
		1)part1
			Install the following packages:
			1.ggplot2
			2.ggmap
			3.maptools
			4.maps
		2)part2
			Install the following packages:
			1.plotly
			2.stringr

		3)part3
			Install the following packages:
			1.shiny
			2.ggplot2
			3.dplyr
			4.sp
			5.stringr
			6.maps
			7.maptools
			8.ggthemes
			9.rtweet
			10.revgeo
			11.twitteR

	Additional Requirements:
		1)Google Maps API for parts 1 and 3
		2) Twitter API for part 3

	Executing files:
		ipynb files:
			1)open ipynb file in Jupyter notebook
			2) use the execute shell command or run all cell command
		R files:
			1)open R file in R studio
			2)select statements to run and click run Button

		RData files:
			1)can be loaded independently in RStudio
		Shiny App:
			1) Open R kernel in directory where app.R or ui.R and server.R exist
			2)Load library(shiny)
			3a)Execute command runApp()
			3b)Execute command runApp( appname".R")

