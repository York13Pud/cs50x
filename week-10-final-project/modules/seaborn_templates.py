# -- Import the required libraries / modules
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns


sns_defaults = sns.set_style(rc = {'figure.facecolor': 'white',
                                   'axes.labelcolor': '.15',
                                   'xtick.direction': 'out',
                                   'ytick.direction': 'out',
                                   'xtick.color': '.15',
                                   'ytick.color': '.15',
                                   'axes.axisbelow': True,
                                   'grid.linestyle': '-',
                                   'text.color': '.15',
                                   'font.family': ['sans-serif'],
                                   'font.sans-serif': ['Arial',
                                                       'DejaVu Sans',
                                                       'Liberation Sans',
                                                       'Bitstream Vera Sans',
                                                       'sans-serif'],
                                   'lines.solid_capstyle': 'round',
                                   'patch.edgecolor': 'w',
                                   'patch.force_edgecolor': True,
                                   'image.cmap': 'rocket',
                                   'xtick.top': False,
                                   'ytick.right': False,
                                   'axes.grid': True,
                                   'axes.facecolor': '#EAEAF2',
                                   'axes.edgecolor': 'black',
                                   'grid.color': 'white',
                                   'axes.spines.left': True,
                                   'axes.spines.bottom': True,
                                   'axes.spines.right': False,
                                   'axes.spines.top': False,
                                   'xtick.bottom': True,
                                   'ytick.left': False,
                                   'legend.frameon': False})


def sns_hbarplot_ax(data: pd.DataFrame,
                    x_axis: str,
                    x_axis_label: str,
                    x_axis_max_value: int,
                    x_axis_max_value_extra: int,
                    y_axis: str,
                    y_axis_label: str,
                    title: str):
    sns.barplot()
    ax = sns.barplot(data = data,
                     x = x_axis, 
                     y = y_axis)

    # -- Show values at the end of each bar:
    for i in ax.containers:
        ax.bar_label(i, padding = 8)

    # -- Set axis labels and title:
    ax.set_xlabel(xlabel = x_axis_label, fontsize = 12)
    ax.set_ylabel(ylabel = y_axis_label, fontsize = 12)

    ax.set_title(label = title, pad = 15, 
                loc = "left", fontdict = {"fontsize": 16})

    # -- Set the x-axis to be 20 higher than the rounded max value:
    ax.set_xlim(0, round(x_axis_max_value/10)*10 + x_axis_max_value_extra)

    return ax