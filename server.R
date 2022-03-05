#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(EpiModel)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$dcmPlot <- renderPlot({

        param <- param.dcm(inf.prob = input$irate, act.rate = input$actrate, rec.rate = 1/ input$rrate,
                           a.rate = input$arate, ds.rate = input$dsrate, di.rate = input$dirate, dr.rate = input$drrate)
        init <- init.dcm(s.num = input$humans, i.num = input$initial, r.num = 0)
        control <- control.dcm(type = "SIR", nsteps = 500, dt = 0.5)
        mod <- dcm(param, init, control)
        
        plot(mod, main = "Deterministic SIR Covid Model")
    })
    
    output$icm1Plot <- renderPlot({
      
      param <- param.icm(inf.prob = input$irate, act.rate = input$actrate, rec.rate = 1/ input$rrate,
                         a.rate = input$arate, ds.rate = input$dsrate, di.rate = input$dirate,
                         dr.rate = input$drrate)
      init <- init.icm(s.num = 900, i.num = input$initial, r.num = 0)
      control <- control.icm(type = "SIR", nsteps = 300, nsims = 10, a.rand = FALSE, d.rand = FALSE)
      sim <- icm(param, init, control)
      plot(sim, main = "Stochastic SIR Covid Model")
    })
    
    output$lim1StoPlot <- renderPlot({
      
      param <- param.icm(inf.prob = input$irate, act.rate = input$actrate, rec.rate = 1/ input$rrate,
                         a.rate = input$arate, ds.rate = input$dsrate, di.rate = input$dirate,
                         dr.rate = input$drrate)
      init <- init.icm(s.num = 900, i.num = input$initial, r.num = 0)
      control <- control.icm(type = "SIR", nsteps = 300, nsims = 10, a.rand = FALSE, d.rand = FALSE)
      sim <- icm(param, init, control)
      plot(sim, main = "Stochastic SIR Covid Model", sim.lines = TRUE, sim.alpha = 0.15, ylim = c(0, 20))
    })
    
})
