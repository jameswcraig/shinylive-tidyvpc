library(tidyvpc)
library(shiny)
library(bslib)

obs_data <- tidyvpc::obs_data[MDV == 0]
sim_data <- tidyvpc::sim_data[MDV == 0]


ui <- page_sidebar(
  title = "Visual Predictive Check (VPC)",
  sidebar = sidebar(
    title = "VPC controls",
    selectInput(
      "bin_method",
      "Binning Method",
      choices = c(
        "jenks",
        "kmeans",
        "sd",
        "pretty",
        "pam",
        "kmeans",
        "hclust",
        "bclust",
        "fisher"
      )
    ),
    numericInput("n_bins", "Number of bins", 6),
    selectInput(
      "bin_midpoint",
      "Bin Midpoint",
      choices = c("xmedian", "xmean", "xleft", "xright", "xmax", "xmin")
    )

  ),
  card(card_header("VPC Plot"),
       plotOutput("vpc_plot"))
)

server <- function(input, output) {
  output$vpc_plot <- renderPlot({
    observed(obs_data, x = TIME, yobs = DV) |>
      simulated(sim_data, ysim = DV) |>
      binning(
        bin = input$bin_method,
        nbins = input$n_bins,
        xbin = input$bin_midpoint
      ) |>
      vpcstats() |>
      plot()

  })
}

shinyApp(ui, server)
