import pydot
import matplotlib.pyplot as plt
import io
import PIL
import sys

def splitkeep(s, delimiter):
    split = s.split(delimiter)
    return [delimiter+substr for substr in split[1:]]

def press(event):
    global graph_number
    global graphs 
    print('press', event.key)
    sys.stdout.flush()
    if event.key == 'right' or event.key == 'down' :
      if(graph_number == len(graphs)-1):
        fig = plt.figure(0)
        fig.text(0,0,"last available graph")
        plt.draw()
        plt.pause(0.001)
      else:
        graph_number += 1
        show_graph(graph_number)
    elif (event.key == 'left' or event.key == 'up') :
      if( graph_number == 0):
        fig = plt.figure(0)
        fig.text(0,0,"first available graph")
        plt.draw()
        plt.pause(0.001)
      else: 
        graph_number += -1
        show_graph(graph_number)
    elif event.key == 'ctrl+c':
      fig = plt.figure(0)
      plt.close(fig)
      exit

    

def show_graph(i):
  g = pydot.graph_from_dot_data(graphs[i])
  #g[0].write_png('somefile.png')
  #img = PIL.Image.open('somefile.png')
  png = g[0].create_png()
  img = PIL.Image.open(io.BytesIO(png))

  fig = plt.figure(0)
  fig.clf()
  ax  = plt.axes()

  fig.canvas.manager.full_screen_toggle()
  ax.imshow(img)
  fig.canvas.mpl_connect('key_press_event', press)
  fig.tight_layout()
  plt.draw()
  plt.pause(0.001)

debug_trace_filename = "trace.debug"
f = open(debug_trace_filename)
s = f.read()
graphs = splitkeep(s,"digraph")
graph_number = 0
show_graph(graph_number)
input("press a key to close")
