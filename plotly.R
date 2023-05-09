library(plotly)
library(jsonlite)
library(rjson)

fig <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
               marker = list(size = 10,
                             color = 'rgba(255, 182, 193, .9)',
                             line = list(color = 'rgba(152, 0, 0, .8)',
                                         width = 2)))
fig <- fig %>% layout(title = 'Styled Scatter',
                      yaxis = list(zeroline = FALSE),
                      xaxis = list(zeroline = FALSE))

json = plotly_json(fig,jsonedit = F)

write(toJSON(fromJSON(json)),"data.json")

## fig2

fig2 <- plot_ly(
  type = 'contour',
  z = matrix(c(10, 10.625, 12.5, 15.625, 20, 5.625, 6.25, 8.125, 
               11.25, 15.625, 2.5, 3.125, 5, 8.125, 12.5, 0.625, 
               1.25, 3.125, 6.25, 10.625, 0, 0.625, 2.5, 5.625, 
               10), nrow=5, ncol=5),
  colorscale = 'Jet',
  autocontour = F,
  contours = list(
    start = 0,
    end = 8,
    size = 2
  )
)

json2 = plotly_json(fig2,jsonedit = F)

write(toJSON(fromJSON(json2)),"data2.json")
