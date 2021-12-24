shinyServer<-(
  function(input,output){
    observeEvent(input$do,{
      
      if( input$sym1 !='')
      {
        output$result <- renderPrint( {
          library(readxl)
          
          sym <- read_excel("symptoms.xlsx",sheet="Sheet1",range="A1:B132",col_type="text")
          sym<- data.frame(sym)
          
          test1<- read_excel("test1.xlsx",sheet="Sheet1",range="A1:EB2",col_type="text")
          test1<- data.frame(test1)
          
          did<-as.character(sym[sym$symptom == input$sym1,1])
          test1[[did]]<- '1'
          
          if (input$sym2 != '')
          {
            did<-as.character(sym[sym$symptom == input$sym2,1])
            test1[[did]]<- '1'
          }
          if (input$sym3 != '')
          {
            did<-as.character(sym[sym$symptom == input$sym3,1])
            test1[[did]]<- '1'
          }
          if (input$sym4 != '')
          {
            did<-as.character(sym[sym$symptom == input$sym4,1])
            test1[[did]]<- '1'
          }
          
          if (input$sym4 != '')
          {
            did<-as.character(sym[sym$symptom == input$sym5,1])
            test1[[did]]<- '1'
          }
          
          ds<- read_excel("td.xlsx",sheet="Sheet1",range="A1:EB110",col_type="text")
          df<- data.frame(ds)
          df$eye <- factor(df$eye)
          df.train<- df[,]
          
          ds.test<- read_excel("test1.xlsx",sheet="Sheet1",range="A1:EB2",col_type="text")
          df.test<- data.frame(ds.test)
          test<- df.test[1,]
          test$eye<- factor(test$eye)
          
          library(randomForest)
          rf<-randomForest(eye ~., df.train)
          pre<- predict(rf,test1)
          dia1<- as.numeric(as.character(pre))
          
          disease<-  read_excel("diagnosis.xlsx",sheet="Sheet1",range="A1:B110",col_type="text")
          disease<- as.data.frame(disease)
          res<-as.character(disease[disease$id ==dia1,2])
          
          cat("Disease You may have: ")
          cat(res)
        }
        )
      }
      else
      {
        output$result <- renderText ("Plese Select Symtoms") 
      }
    }
    )
  }
)

            