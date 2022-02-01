library(shiny)

shinyUI(pageWithSidebar( 
      headerPanel("Plot of your test score relative to the class."), 
      sidebarPanel(
            p("Enter the average score on the test, the standard deviation of the test and your score for the test."),
            sliderInput('mu', 'Input the test average',value = 50, min = 10, max = 90, step = 1,),
            sliderInput('sd', 'Input the test standard deviation', value = 10, min = 2, max = 20, step = 1,),
            sliderInput('score', 'Input your test score', value = 50, min = 0, max = 100, step = 1,)
      ),
      
      mainPanel(
            p("The red curve is the distribution of scores, assuming normality, of the 
              test given the mean and standard deviation that you inputed. The orange line is the average
              score on the test. The blue lines indicate 1 standard deviation above and below the mean. 
              The black line indicates your score."),
            plotOutput('newHist'),
            textOutput('percentile')
      ) 
))