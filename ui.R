#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
    # Application title
    titlePanel("Covid-19 Models"),

    # Sidebar with a slider input for number of bins
      tabsetPanel(
        tabPanel(
          "Introduction and Interpretation",
          mainPanel(
            h2("Introduction"),
            h4("This assignment is a Covid-19 simulation model to see how different 
               factors impact the direction of the disease as well as the spread of the disease.
               In the other tabs, there are different models where you can control the different factors
               to visualize how they impact covid 19. In those models you will be able to control, the 
               initial number of infected, number of interactions, and more. The initial values are acquired
               from multiple sources and represent an imaginary Covid variant that stays similar to the values
               of current covid strains. Notable numbers are the infection rate of 3 percent and a recovery time
               of 10 days which is slightly longer than current CDC guidelines. The graphs plot 3 different lines
               one displaying the number of susceptible individuals, one with the number of infected individuals
               and one with the number of recovered individuals. With this you can visualize the amount of time
               it would take to return to normalcy given the current values of the sliders. Due to the type of model
               this is (SIR) we do not see the impacts of if individuals became susceptible again after acquiring
               the diseases. "),
            hr(),
            h2("Interpretation"),
            h4("The deterministic model displays interesting information on how the imaginary covid simulation would
               occur. It seems that with an infection probability of 3% and 10 transmissible acts per day
               the number of individuals who are infected increases rather quickly peaking around 40 units of time
               into the simulation. This then transitions to a falling number of infected individuals with an 
               increase of individuals who are recovered and no longer susceptible. While this isn't an accurate
               representation of Covid-19 as we now know that individuals who are recovered can still get covid
               (more akin to a SIRS model). This simulation displays what it would be like for the first wave of 
               sorts. Depending on the factors you change the graph also changes with it. It seems that the number
               of individuals initialy infected significantly impacts the amount of overall infected. It also seems
               that the recovery time significantly impacts the number of infected during the peak. If recovery
               time was longer than the initial value of 10, more individuals are infected, while if its below 10, 
               less are infected. Similar effects occur when you modify the infection rate and the number of
               transmissible acts."),
            hr(),
            h4("The stochastic model also displays fairly similar information to the deterministic model apart from
               the difference in starting values (number of individuals - 1000 and number of initial infected - 100)
               . Depending on the number of simulations, the overall path also seems to different slightly. 
               Though there is a trend, the simulations display how there could be a range of values that you do 
               not see with the deterministic model. In the second graph it displays the variance in values in the 
               different simulations showing how the values could vary depending on the run. Like the deterministic
               model, factors like recovery rate and number of transmissible acts have a large impact on the 
               trajectory of the disease and the number of infected and recovered. One large limitation from this 
               approach is that the sample size is fairly small, the number of infected and starting number of
               individuals does not represent a large population and cannot account for the small variance from day
               to day. The overall model generalizes actions and standardizes them to find an average, when in
               reality, these values significantly impact the trajectory of the disease. ")
          ),
        ),
        tabPanel(
          "Deterministic Covid-19 Model",
        sidebarLayout(
            sidebarPanel(
                sliderInput("humans",
                            "Number of Individuals:",
                            min = 1,
                            max = 1000,
                            value = 500),
                sliderInput("initial",
                            "Initial Infected:",
                            min = 1,
                            max = 1000,
                            value = 1),
                sliderInput("irate",
                            "Infection Rate:",
                            min = 0,
                            max = 1,
                            value = .03),
                sliderInput("actrate",
                            "Number of Transmissible Acts Per Day:",
                            min = 0,
                            max = 50,
                            value = 10),
                sliderInput("rrate",
                            "Recovery Rate (disease duration in days):",
                            min = 0,
                            max = 20,
                            value = 10),
                sliderInput("arate",
                            "Arrival Rate:",
                            min = 0,
                            max = 1,
                            value = .005),
                sliderInput("dsrate",
                            "Suspectible Departure Rate:",
                            min = 0,
                            max = 1,
                            value = .02),
                sliderInput("dirate",
                            "Infected Departure Rate:",
                            min = 0,
                            max = 1,
                            value = .00666),
                sliderInput("drrate",
                            "Recovered Departure Rate:",
                            min = 0,
                            max = 1,
                            value = .02),
            ),
    
            # Show a plot of the generated distribution
            mainPanel(
                plotOutput("dcmPlot")
            )
        ),
      ),
      tabPanel(
        "Stochastic Covid-19 Model",
        sidebarLayout(
          sidebarPanel(
            sliderInput("initial",
                        "Initial Infected:",
                        min = 1,
                        max = 1000,
                        value = 1),
            sliderInput("irate",
                        "Infection Rate:",
                        min = 0,
                        max = 1,
                        value = .03),
            sliderInput("actrate",
                        "Number of Transmissible Acts Per Day:",
                        min = 0,
                        max = 50,
                        value = 10),
            sliderInput("rrate",
                        "Recovery Rate (disease duration in days):",
                        min = 0,
                        max = 20,
                        value = 10),
            sliderInput("arate",
                        "Arrival Rate:",
                        min = 0,
                        max = 1,
                        value = .005),
            sliderInput("dsrate",
                        "Suspectible Departure Rate:",
                        min = 0,
                        max = 1,
                        value = .02),
            sliderInput("dirate",
                        "Infected Departure Rate:",
                        min = 0,
                        max = 1,
                        value = .00666),
            sliderInput("drrate",
                        "Recovered Departure Rate:",
                        min = 0,
                        max = 1,
                        value = .02),
          ),
          
          # Show a plot of the generated distribution
          mainPanel(
            plotOutput("icm1Plot"),
            plotOutput("lim1StoPlot")
          )
        ),
      ),
    )
))
