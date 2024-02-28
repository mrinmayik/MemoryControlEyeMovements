#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(DT)
library(shinymanager)

library(ggplot2)

#First setup some paths etc.
if(grepl("*[M|m]rinmayi*", Sys.info()['nodename'])){
  setwd("~/GitDir/MemoryControlEyeMovements/ShinyApp/RetrievalControl/")
}

# Define UI for application that draws a histogram
ui <- fluidPage(
  #Read in CSS
  includeCSS('www/customstylesheet.css'),
  includeCSS('https://fonts.googleapis.com/icon?family=Material+Icons'),
  title = "Memory Control",
  dashboardPage(
    dashboardHeader(title=""),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Background", tabName= "background", icon=tags$i(class = "material-icons", "article", style = "font-size:inherit;")),
        menuItem("The Study", tabName= "study", icon=tags$i(class = "material-icons", "bar_chart", style = "font-size:inherit;")),
        menuItem("Conclusions", tabName= "conclusion", icon=tags$i(class = "material-icons", "psychology", style = "font-size:inherit;")),
        menuItem("Related Material", tabName= "materials", icon=tags$i(class = "material-icons", "link", style = "font-size:inherit;"))
      ) #Closes sidebarMenu
    ), #Closes dashboardSidebar
    dashboardBody(
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "customstylesheet.css")),
      tags$head(tags$style(rel = "stylesheet", 
                           type = "text/css", href = "https://fonts.googleapis.com/icon?family=Material+Icons")),
      
      tabItems(
        ########## Background ##########
        tabItem(tabName = "background",
                fluidRow(
                  box(width = 6,
                      title = "1. What is the goal of the study?",
                      p("This web app accompanies the the paper titled 'Control of Memory Retrieval Alters Memory-Based Eye Movements' published in the Journal of Experimental Psychology: Learning, Memory and Cognition in 2023. The information presented here is a summary of the results reported in the paper, and is meant for a non-scientific audience. The app was created by Mrinmayi Kulkarni, the first author on the paper."),
                      p(HTML("Past studies have shown that our memories can influence what we pay attention to. For instance, driving through a neighbourhood might remind you about a dinner you had there with a friend. This memory, in turn, will increase the likelihood that your attention is drawn to the restaurant when you pass by it (see study by Nickel and colleagues, 2020).")),
                      p(HTML("But what happens to attention when you inttentionally try to control the retrieval of that memory? Will the restaurant still draw your attention? Can you reduce the influence of that memory on your attention if you attempt to suppress it? Does your memory for that event get worse if you suppress it?"))
                  ), #Close goal box
                  box(width = 6,
                      title = "2. Why should we care?",
                      p("Although the ability to remember past events is essential for daily living, it is not always beneficial. Let's update that previous example. Imagine that, instead of an enjoyable dinner with a friend, you had an unpleasant experience, like an argument. Or imagine someone who has experienced a traumatic event, such as getting mugged in a park. In the future, a reminder such as walking through the park, may trigger the retrieval of that traumatic memory - which is not pleasant."),
                      p("In such situations, it may be more adaptive to control our retrieval of that memory."),
                      img(src = "PatternCompletion.gif", width = "75%", height = "75%", offset = 0, style='padding:0px;'),
                      br(),
                      br(),
                      p("In fact, such 'flashbacks' are a common feature of conditions such as Post Traumatic Stress Disorder (PTSD) or Major Depressive Disorder, where reminders can trigger the vivid recollection of negative memories. These flashbacks can pull attention away from the task at-hand disrupting a person's ability to perform daily activities, and can be emotionally distressing.")
                  ), #Close importance box
                  box(width = 6,
                      title = "3. How can we control our memories?",
                      p("Studies have suggested that we can use at least two strategies to control memory retrieval."),
                      h4("Retrieval Suppression"),
                      p(HTML("This involves pushing the retrieved information out of your awareness, that is, trying <em>not</em> to think of the negative experience of being mugged.")),
                      img(src = "Suppress.gif", width = "75%", height = "75%", offset = 0, style='padding:0px;'),
                      h4("Thought Substitution"),
                      p("This involves calling to mind alternate information instead of the retrieved memory, for instance thinking of a pleasant memory of a picnic in the park, instead of the traumatic memory of getting mugged."),
                      img(src = "Substitute.gif", width = "75%", height = "75%", offset = 0, style='padding:0px;')
                  ), #Close strategies box
                  box(width = 6,
                      title = "4. What did we do?",
                      h4("Our Research Question"),
                      p("In this study we tested the effect of retrieval suppression and thought substitution (collectively called retrieval control), on attentional distribution after a memory cue (a reminder). We also examined whether controlling retrieval affects how well you remember that information later on."),
                      h4("Eye-tracking"),
                      p("One method to study attention is through the use of eye-tracking. Past studies have demonstrated that our eyes often move to the location to which we are attending. For instance, you are moving your eyes along this text, as you pay attention to successive words to make sense of the sentence."),
                      p("In our study, we used eye-tracking to examine retrieval control affected eye-movements, which can tell us about what they may pay attention to."),
                      h4("Our Method"),
                      p("We recruited 26 particiants (18–31 years old) to complete our experiment. Participants completed multiple phases in the experiment, while undergoing eye-tracking.")
                  ) #Close study box
                ) #Close fluidRow
        ), #Close background tabItem
        ########## Study ##########
        tabItem(tabName = "study",
                #h2(HTML("<center>The Study<center>")),
                fluidRow(
                  box(width = 12, #style = "background:black",
                      title = "The Experiment",
                      p(HTML("Participants completed three phases during the experiment.<ol><li>The Study Phase</li><li>The Memory Control and Search Phase</li><li>The Final Memory Phase</li></ol>")),
                      br(),
                      h4("The Study Phase"),
                      p(HTML("In this phase, participants were instructed to learn 216 scene-object pairs. These pairs were created by linking pictures of everyday scenes (e.g., a park, a brewery, a kitchen), with pictures of ONE of the following:<ul><li>A hammer</li><li>A screw driver</li><li>A pair of scissors</li><li>Barack Obama</li><li>Rupert Grint</li><li>Bruno Mars</li></ul>")),
                      p("In all, participants completed 216 trials that looked like this. In each trial, a scene was presented, and then a face or a tool was superimposed on top of the scene. Participants were instructuted to try to remember which scene when with which object (either face or tool)."),
                      img(src = "Encoding.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      br(),
                      br(),
                      h4("The Memory Control and Search Phase"),
                      p("In each trial in this phase, participants either retrieved information they had learned in the study phase, suppressed it, or substitute it with other learned information. After this, they performed a simple search task. During this phase, we tracked where on the screen participants were looking."),
                      p(HTML("Each trial began with an instruction - the word <strong>Retrieve</strong>, <strong>Suppress</strong>, or <strong>Substitute</strong>. This was followed by a scene that they had learnt as part of a  pair during the study phase (the scene cue). The word at the begining of the trials told participants what they should do when the scene was presented, and in the short break after the scene, during which a cross was presented on the screen.<ul><li>On the <strong>Retrieve</strong> trials, participants were instructured to call to mind the object (face or tool) that they had studied with the scene, and keep thinking about it throughout the break in the in the trial.</li><li>On <strong>Suppress</strong> trials, they were instructed to push the matching object out of their awareness - to try NOT to think of the matching object.</li><li>On the <strong>Substitute</strong> trials, participants were instructed to call to mind another object from <i>opposite</i> category of the matching object.For instance, if the scene was paired with a face, they had to call to mind a specific tool from the three that they studied, and vice versa.</li></ul>")),
                      img(src = "Search.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      br(),
                      br(),
                      p("After the break following the scene cue, participants were presented with a display consisting of all 6 studied objects, intermixed with 6 black dots, like the one shown below. They were instructed to move their eyes around the object and the dots as they wished, until 5 dots disappeared from the screen."),
                      img(src = "SearchDisplayEMs.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      helpText("The red circle is an illustration of how a participant might move their eyes in a trial.", style = "max-width:50%;font-size:smaller"),
                      p("At this point, they were asked to make a single eye movement to the remaining dot on the screen"),
                      img(src = "ProbeDisplayEMs.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      br(),
                      br(),
                      h4("The Final Memory Phase"),
                      p("In this last phase, participants completed a surprise memory test. Here, in each trial they were presented with scenes they had learned during the study phase, and they had to choose which face or tool that scene had been paired with."),
                      p("We did not inform participants beforehand that their memory would be tested, because we did not want them to rehearse the matching objects in suppress or substitute trials. We were interested in studying whether controlling their memories during the memory control and search phase would weaken their memories for the scene-object pair."), 
                      img(src = "Posttest.gif", width = "25%", height = "25%", offset = 0, style='padding:0px;')
                  ), #Close procedure box
                  box(width = 12,
                      title = "The Results",
                      h4("Viewing of the Matching Object in the Search Display"),
                      p("As a reminder, in this experiment, we were interested in studying if the attention drawn to the information retrieved from memory might be reduced if participants attempted to control the retrieval of that memory. To test if this was the case, we first examined at how much they looked at the matching face that was embedded in the search display in Retrieve, Suppress and Substitute trials."),
                      p(HTML("In the plot below, the three bars refer to the three conditions, and the height of the bar is an indication of amount of eye movements dedicated to that matching object. A higher value indicates that <i>more</i> viewing was directed to the matching object.")),
                      p("You can see in the retrieve condition (blue bar), when participants were instructed to call to mind the matching object, that more eye movements were directed to the matching face relative to the Suppress (red) and substitute (yellow) conditions."),
                      img(src = "AssociateViewing.png", width = "25%", height = "25%", offset = 0, style='padding:0px;'),
                      br(),
                      br(),
                      h4("Performance in the Final Memory Phase"),
                      p("Next we were interested in testing whether controlling retrieval of memories affects how well you remember them later. For this, we looked at how accurate participants' responses were in the final memory phase. In the plot below, the height of the bar represents the accuracy of the response (higher value indicates a more accurate response). Here, accuracy is presented separately for scene-face pairs (left cluster of bars), and scene-tool pairs (right cluster of bars). The colour of the bar indicates the condition."),
                      p(HTML("In this measure, we found that when the matching object was a tool, accuracy was lower in the Suppress (red) and Substitute (yellow) conditions, relative to the Baseline (white) condition. The Baseline condition consists of the set of scene-object pairs that were learned in the study phase, but were neither retrieved nor controlled in the memory control and search phase. This is basically a control condition, because it allows us to test whether memory for pairs in the Suppress and Substitute conditions is worse even compared to pairs for which participants received <i>no reminders</i> in the  memory control and search phase.")),
                      img(src = "PosttestAccuracy.png", width = "25%", height = "25%", offset = 0, style='padding:0px;')
                  ) #Close results box
                ) #Close fluidRow
        ), #Close study tabItem
        ########## Conclusion ##########
        tabItem(tabName = "conclusion",
                fluidRow(
                  box(width = 12,
                      title = "What do these results mean?",
                      p("The results from this experiment suggest that controlling memory retrieval following reminders (the scene cues), can reduce the influence of those memories on attention - i.e., those memories are less likely to draw the participants' attention. We also found that controlling memory for scene-tool pairs affected how well participants remembered them in a later memory test. This drop in memory accuracy for the suppressed and substituted pairs was worse even relative to trials that weren't presented during the memory control and search phase (the baseline pairs). This is interesting because it means that controlling a memory weakens it to a level over and above what we might expect from just passive forgetting (i.e., pairs that were forgotten because they weren't rehearsed). This suggests that the neural process by which we lose memories due to forgetting is different from the one by which we lose memories that the target of retrieval suppression, or thought substitution!"),
                      h4("So, what's the deal with the scene-face pairs?"),
                      p(HTML("This was an interesting finding - and an unexpected one. During the memory control and search phase, we found that the reduction in viewing of the suppressed and substituted matching faces was equivalent to that of the matching tools. This is why we did not separate the viewing data for faces and tools. But when it comes to the accuracy of the memory responses, we found that controlling memories of scene-face pairs did <i>not</i> weaken them, relative to the baseline pairs.")),
                      p("We think that this may be because faces are a special class of stimuli. Evolutionarily, faces are important in our everyday life (more so than hammers and scredrivers!). Faces can give us critical information such as the identity of another person, their emotional state, and so on. It is possible, then, that the brain treats faces differently from other objects, making it harder to modify memories for faces. Another possibility is that, because these were famous faces, participants had a lot of contextual information about them, even before they began the experiment (e.g., watching Barack Obama speak, watching Rupert Grint's movies, or enjoying Bruno Mars' music). Participants could have used this information to build stronger associations between the scenes and faces, making those memories more resistant to weakening. Perhaps, if we had used non-famous faces, we might have seen comparable weakening of scene-face pair memory."),
                      h4("What does this mean for PTSD and Depression?"),
                      p(HTML("Our results suggest that controlling memories might make them less likely to draw attention, weaken their trace. It is possible that this may be an effective strategy in these mental health disorders to reduce the disruption caused by the retrieval of traumatic memories. However, this is <i>veeeery</i> preliminary evidence. We need to conduct follow-up studies with emotional stimuli to examine if our results will translate to negative memories. Similarly, we need more data on such studies from patients populations to examine whether this is a reasonable treatment approach."))
                  ), #Close discussion box
                  box(width = 12,
                      title = "Questions? Comments? Suggestions?",
                      p(HTML("You can find me on <s>Twitter</s>"), tags$a(href="https://twitter.com/mrinmayi17", "X"), "or", tags$a(href = "https://www.linkedin.com/in/mrinmayi-kulkarni/", "LinkedIn"), "! 🙂"),
                      p("Code for this shiny app can be found on my", tags$a(href="https://github.com/mrinmayik/MemoryControlEyeMovements", "Github repository."))
                  )
                ) #Close fluidRow
        ), #Close conclusion tabItem
        ########## Related Materials ##########
        tabItem(tabName = "materials",
                fluidRow(
                  box(width = 12,
                      title = "Links to Related Reading",
                      tags$ul(
                        tags$li(tags$a(href="https://psycnet.apa.org/record/2024-38477-001", "Published article"), "with tons of more information!"),
                        tags$li(tags$a(href="https://osf.io/preprints/psyarxiv/q4fvs", "Full text"), "(Free to view)"),
                        tags$li(tags$a(href="https://linkinghub.elsevier.com/retrieve/pii/S0010027720301311", "Study by Nickel and colleagues, 2020"), "referenced in the Background tab"))
                  ) #Close discussion box
                ) #Close fluidRow
        ) #Close conclusion tabItem
      ) #Close tabItems
    ) #Close dashboardBody
  ) #Close dashboardPage
)


# Define server logic required to draw a histogram
server <- function(input, output) {
}

# Run the application 
shinyApp(ui = ui, server = server)
