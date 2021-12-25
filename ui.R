library(shiny)
library(shinydashboard)

sidebar <- dashboardSidebar(
  # Custom CSS to hide the default logout panel
  tags$head(tags$style(HTML('.shiny-server-account { display: none; }'))),
  
  # The dynamically-generated user panel
  uiOutput("userpanel"),
  
  sidebarMenu(
    menuItem("Home", icon = icon("home"), tabName = "Home"),
    menuItem("Disease Diagnosis", tabName = "Disease_Diagnosis", icon=icon("plus", lib = "glyphicon")),
    menuItem("Disease Dataset", icon = icon("th"), tabName = "Dataset"),
    menuItem("HelpLines", tabName = "Helplines", icon=icon("user", lib = "glyphicon")),
    menuItem("Our Team", icon = icon("earphone", lib="glyphicon"), tabName = "Our_Team")
    
  )
)


body <- dashboardBody(
  
  tabItems(
    tabItem(tabName = "Home", 
            h1(align="center","Welcome to MedAssist"),
            p(align="center", style="font-size: 18px", "This is a system to predict health problems based on the symptoms")
    ),
    tabItem(tabName = "Disease_Diagnosis",
            h2(align="center","Disease Diagnosis"),br(),
            
            fluidRow(
              box(
                style="font-size:16px",title ="Symptom Details", width = 6, solidHeader = TRUE, status = "warning",
                selectizeInput("sym1", "Select Symptom 1", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
                selectizeInput("sym2", "Select Symptom 2", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
                selectizeInput("sym3", "Select Symptom 3", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
                selectizeInput("sym4", "Select Symptom 4", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
                selectizeInput("sym5", "Select Symptom 5", choice=c('Type a Symptom' = '', unique(sym$symptom)) ),
                br(),
                actionButton("do", "Diagnose")
                
              ),
              box(
                style="font-size:16px",title = "Diagnosis Results",width = 6, solidHeader = TRUE, status="warning",
                textOutput("result")
              )
            )
            
    ),
    
    tabItem(tabName = "Dataset",
            h2(align="center", "This can contain the disease dataset (if reqd)")
    ),
    tabItem(tabName = "Helplines",
            h2(align="center","Important Contact Details"),
            br(),
            style="font-size: 18px",
            p("Ambulance: 102"),
            p("National Health Helpline (Toll free Number): 1800-180-1104"),
            p("Medical Helpline (State Andhra Pradesh, Gujarat, Uttarakhand, Goa, Tamil Nadu, Rajasthan, Karnataka, Assam, Meghalaya, Madhya Pradesh and Uttar Pradesh): 108"),
            p("CMC Vellore: 0416 228 1000")
            
    ),
    tabItem(tabName = "Our_Team",
            h2(align="center","Our Team"),br()
            
    )
  )
  
  
  
)

# Put them together into a dashboardPage
dashboardPage(
  skin="yellow",
  dashboardHeader(title = "MedAssist"),
  sidebar,
  body
)



