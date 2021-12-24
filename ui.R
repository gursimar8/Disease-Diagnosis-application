library(shiny)
shinyUI(fluidPage(
  pageWithSidebar(
    headerPanel("Disease Diagnosis"),
    sidebarPanel(
      
      fluidRow(
        column(10, align="center",
               "Symtom Details")
      ),
      selectizeInput("sym1", "Select Symptom 1", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
      selectizeInput("sym2", "Select Symptom 2", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
      selectizeInput("sym3", "Select Symptom 3", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
      selectizeInput("sym4", "Select Symptom 4", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
      selectizeInput("sym5", "Select Symptom 5", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
      
      fluidRow(
        column(3, offset = 4,
               actionButton("do", "Diagnose")
        )
      )
    ),
    mainPanel(
      fluidRow(
        column(8, align="center",
               ("Diagnosis result"),
               textOutput("result")
        )
      )
      
    )
  )
)
)



