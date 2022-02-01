library(shiny)

shinyServer( 
      function(input, output) {
            
            mu <- reactive({as.numeric(input$mu)})
            sd <- reactive({as.numeric(input$sd)})
            score <- reactive({as.numeric(input$score)})
            
            output$newHist <- renderPlot({
                  zVals <- seq (-5,5, length = 100)
                  
                  x <- mu() + zVals * sd()
                  y <- dnorm(zVals)
                  plot(x, y, xlim=c(0,100), col = "red", type = "l", xlab = "Scores", ylab = "Density")
                  
                  lines(c(mu(), mu()), c(0, 1),col="orange",lwd=7)
                  lines(c(mu() - sd(), mu() - sd()), c(0,1), col = "blue", lwd = 2)
                  lines(c(mu() + sd(), mu() + sd()), c(0,1), col = "blue", lwd = 2)
                  lines(c(score(), score()), c(0,1), col = "black", lwd = 1)
            })
      
            output$percentile <- renderText({
                  paste("Your percentile: ", 100 * round(pnorm((score() - mu()) / sd()), 4))
            })
      } 
)

