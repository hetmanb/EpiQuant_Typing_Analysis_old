# Theme gratefully borrowed from https://gist.github.com/semerj/6f9edcb5deee392862df

plot_theme <- function() {
  
  # Generate the colors for the chart procedurally with RColorBrewer
  palette <- brewer.pal("Greys", n=9)
  color.background = palette[1]
  color.grid.major = palette[4]
  color.axis.text = "black"# palette[7]
  color.axis.title = "black"#palette[7]
  color.title = "black"#palette[9]
  color.panel.border = palette[9]
  strip.text = "black"
  
  # Begin construction of chart
  theme_bw(base_size = 9) +
    
    # Set the entire chart region to a light gray color
    theme(panel.background=element_rect(fill=color.background, color=color.background)) +
    theme(plot.background=element_rect(fill=color.background, color=color.background)) +
    theme(panel.border=element_rect(color=color.panel.border)) +
    
    # Format the grid
    theme(panel.grid.major=element_line(color=color.grid.major,size=.25)) +
    theme(panel.grid.minor=element_blank()) +
    theme(axis.ticks=element_blank()) +
    
    # Format the legend, but hide by default
    #     theme(legend.position="right") +
    theme(legend.background = element_rect(fill=color.background)) +
    theme(legend.text = element_text(size=10,color=color.axis.title)) +
    #     theme(text = element_text(family = input_font)) +
    
    # Set title and axis labels, and format these and tick marks
    theme(plot.title=element_text(color=color.title, size=14, vjust=1.25)) +
    theme(axis.text.x=element_text(size=11,color=color.axis.text)) +
    theme(axis.text.y=element_text(size=11,color=color.axis.text)) +
    theme(axis.title.x=element_text(size=13,color=color.axis.title, vjust=0)) +
    theme(axis.title.y=element_text(size=13,color=color.axis.title, vjust=1.25)) +
    theme(strip.text.x = element_text(size = 10, colour = strip.text))
  
  # Plot margins
  #     theme(plot.margin = units(c(0.35, 0.2, 0.3, 0.35), "cm"))
}