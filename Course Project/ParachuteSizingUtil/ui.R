library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Parachute Sizing Utility"),
    sidebarPanel(
        h3('Inputs'),
        numericInput('m', 'Mass (kg)', 1,min=1,max=1000,step=1),
        numericInput('w', 'Wind Speed (m/s)', 0, min=0, max=50, step=5),
        sliderInput('Cd', 'Estimated Drag Coefficient',value = .5, min = .5, max = 3.5, step = 0.05,),
        sliderInput('h', 'Height (m)',value = 100, min = 50, max = 10000, step = 50,)
    ),
    mainPanel(
        h3('Parachute Size'),
        p("Please specify the mass of your rocket, the estimated wind conditions, the estimate drag coefficient, and the target height of the rocket. The utility shally dynamically optimize the parachute size needed for a safe recovery. Please feel free to continue to modify the values until you find something that fits your model. Be sure to take into account the assumptions inherent in the calculations. And when in doubt, err on the side of caution and add more parachute!"),
        h4('The area of the parachute that you would need is (in meters): '),
        textOutput('area'),
        h4('The diameter of a parachute that is circular and will meet your area
           criteria is (in meters): '),
        textOutput('dia'),
        p(HTML("<br>")),
        p('Recall that there are inbuilt assumptions into this utility. Pleease
          use caution when designing a recovery system and double check all 
          calculations before building and launching a rocket. A list of all
          assumptions is given below.'),
        p(HTML("<ol><li>Final landing speed will be 20 fps</li><li>This system will be used with Standard Atmospheric conditions</li><li>Once deployed, the time needed to reach terminal velocity is negligible</li></ol>"))
    )
))