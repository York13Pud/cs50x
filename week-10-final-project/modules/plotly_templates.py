import pandas as pd
import plotly.express as px


def plotly_hbar(data, x:str, x_title:str, y:str, y_title:str, title:str, text:str, x_max_range:int, x_max_range_extra:int = 6, dtick:int = 5):
    """
    __Summary__
    
    This function will create a plotly horizontal bar figure using a pre-defined set of defaults.

    __Parameters__

    data: A dataframe containing the data to use.
    x (String): The column to use for the x-axis. 
    x_title (String): The title for the y-axis.
    y (String): The column to use for the y-axis.
    y_title (String): The title for the y-axis.
    title (String): The title of the figure.
    text (String): The column to use to show the value of each bar in the figure.
    x_max_range (Int): The maximum range for the x-axis.
    x_max_range_extra (Int) (Optional): The additional amount to add to the max length of the x-axis. By default, an additional 6 will be added to this.
    dtick (Int) (Optional): The spacing between the tickers on the x-axis. The default is increments of 5.
    """
    
    fig = px.bar(data,
                 x = x,        
                 y = y, 
                 orientation = "h", 
                 title = title, 
                 color = y,
                 text = text)
    
    fig.update_layout(xaxis_title = x_title, 
                      yaxis_title = y_title,
                      autosize = False,
                      width = 1200,
                      height = 700,
                      showlegend = False,
                      font = dict(
                          size = 14,
                      ),
                      title_font_size = 24,
                      title_x = 0.5)
    
    fig.update_xaxes(range = [0, x_max_range + x_max_range_extra], 
                     tickangle = 45, 
                     tick0 = 0, 
                     dtick = dtick)

    return fig