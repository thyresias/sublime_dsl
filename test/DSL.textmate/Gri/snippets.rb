# encoding: utf-8

snippets do

  default_scope 'source.gri'
  file_format :textmate

  tab 'con', 'Contour', <<-'TXT', uuid: '2046FFE7-A68E-4955-8FCA-C802F456792C', file: 'Contour (con)'
# `date`
# ${1:$TM_FULLNAME}

# Read columnar data (x,y,z), convert to a grid, then contour.

# Data from figure 5 of Koch et al., 1983, J. Climate
# Appl. Met., volume 22, pages 1487-1503.
open "http://gri.sourceforge.net/gridoc/examples/example5.dat"
read columns x y z
close
set x size 12
set x axis 0 12 2
set y size 10
set y axis 0 10 2
set y margin 15
draw axes
set color rgb 0 0 .6 # dark blue
set line width symbol 0.2
set symbol size 0.2
draw symbol bullet
set font size 8
draw values
set color black
set x grid 0 12 0.25
set y grid 0 10 0.25

# Uncomment one of the 'convert' lines below, to try
# various gridding schemes.
convert columns to grid         # "default"
#convert columns to grid objective                # As default
#convert columns to grid objective -1.4 -1.4      # As default
#convert columns to grid objective -1.4 -1.4 5 1  # As default
#convert columns to grid objective -1.4 -1.4 5 -1 #  + fill grid
#convert columns to grid objective -2   -2        # Average
#convert columns to grid objective  2    2        #
#convert columns to grid boxcar                   # Ugly
#convert columns to grid boxcar -2 -2             # Still ugly

set font size 12
draw contour 0 40 10 2
set line width rapidograph 3
draw contour 0 40 10
set color black
draw title "N. Am. wind (Fig5 Koch et al, 1983)"

TXT

  tab 'icon', 'Icon', "# `date`\n# ${1:$TM_FULLNAME}\n\nset x size 5\nset y size 5\nset y margin 20\nset x axis 0 1 0.25\nset y axis 0 20 10\nset font size 0\n\\\\background_color = \"hsb 0.6 0.2 1.0\"\n\\\\line_color =       \"red\"\n\\\\word_color =       \"rgb 0.0 0.1 0.6\"\n\nread columns x y\n0.0  12.5\n0.25 19  \n0.5  12  \n0.75 15  \n1    13  \n\ndraw axes none\nset color \\\\background_color\nset line width axis rapidograph 6\ndraw curve filled to ..ybottom.. y\nset color black\n#draw axes frame\n\nset color \\\\line_color\nset line width 10\ndraw curve\n\nset color \\\\word_color\nset font size 100\nset font to Helvetica\ndraw label \"Gri\" at 0.05 1.3\n", uuid: '68248C77-9EB9-4B05-BEA6-162719D55AE0', file: 'Gri logo'

end