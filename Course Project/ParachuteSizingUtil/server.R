library(shiny)
shinyServer(
    function(input, output) {
        psize<-function(m,w,cd,h){
            size<-(m^2*9.81*sqrt(w^2+37.21))/(cd*.5*m*37.21*6.1*(1.225*exp((-9.81*h*0.0289644)/(8.31432*22))))
            return(as.numeric(size))
        }
        output$area<-renderText({psize(input$m,input$w,input$Cd,input$h)})
        output$dia<-renderText({psize(input$m,input$w,input$Cd,input$h)/3.14})
#         input$goButton
#         isolate(paste(input$text1, input$text2))
        
#         area<-reactive(sum(input$m,input$w,input$Cd,input$h))
#         output$area<-renderText({area})
#         diameter<-reactive(sqrt(area/3.14))
#         output$dia<-renderText(as.numeric({diameter}))
    }
)