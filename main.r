library(shiny)

csv=read.csv("exam.csv")
csv=csv[,c(1:6)]



# Define UI for dataset viewer app ----
ui=fluidPage(
    sidebarLayout(
        sidebarPanel(    
            selectInput(inputId = "sltLevel",
                label = "Choose the level:",
                choices = unique(as.character(csv[,3]))
            ),
            selectInput(inputId = "sltClass",
                label = "Choose the Class:",
                choices = unique(as.character(csv[,2]))
            ),
            numericInput(inputId = "obs",
                label = "Number of observations to view:",
                value = 10)
        ),
        mainPanel(
            tableOutput("view")
        )
    )
)

server=function(input, output) {
  # Return the requested dataset ----
  f.subCsv=reactive({
	str.level=input$sltLevel
	str.class=input$sltClass
		
	idx.level=which(csv[,3]==str.level)
	idx.class=which(csv[,2]==str.class)
	
	idx=intersect(idx.level,idx.class)
	return(csv[idx,])
  })
 

  # Show the first "n" observations ----
  output$view=renderTable({
	csv.sub=f.subCsv();
    head(csv.sub, n =input$obs)
  })
}
shinyApp(ui = ui, server = server)


