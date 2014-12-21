// 21 December 2014
// flippedpython
// version 3
// updated: add circles appear to rotate on y axis at end

int rows = 7; // change rows
int columns = 5;  // change columns
int diameter = 60; // change cell diameter
int cellGap = 2; // used to create a gap between each circle and the edge of the window
int w; // window width
int h; // window height
Circle[][] cells;
int activeRow, activeColumn;
int speed;

float factor = 1.0; // v3 used to rotate circle

void setup()
{
  // setup frame dimensions
  w = cellGap + columns*(diameter + cellGap*2) + cellGap;
  h = cellGap + rows*(diameter + cellGap*2) + cellGap;
  size(w, h);
  
  // set title bar
  frame.setTitle(str(rows) + " rows, " + str(columns) + " columns, diameter " + str(diameter) + " pixels");
  
  // set various darwing modes
  noStroke();
  smooth();
  ellipseMode(CORNER); // set ellipse to top left corner
  
  // change the frame rate to a value between 1 and 60
  frameRate(60);
  
  // create empty array
  cells = new Circle[columns][rows];
  // setup pointer to first cell be be moved i.e. left column, bottom row
  activeRow = rows-1; activeColumn = 0;
  // set cell speed
  speed = 12;
  // populate array with positions and colours (shades of blue), transparency
  for (int row = 0; row < rows; row++)
  {
    for (int column = 0; column < columns; column++)
    {
      cells[column][row] = new Circle(cellGap*2 + column*(diameter + cellGap*2), cellGap*2 + row*(diameter + cellGap*2), color(0,0, 80 + random(100)),random(255));
      // all cells above top border of window
      cells[column][row].y = -diameter - 2;
      println(cells[column][row].x, cells[column][row].y);
    }
  }
  
  factor = 1.0;
}

void draw()
{
  // move active cell
  updateCells();
  background(#ffffff);
  //float factor = 0.99;
  
  // draw all cells in window
  for (int row = 0; row < rows; row++)
  {
    for (int column = 0; column < columns; column++)
    {
      fill(cells[column][row].colour,cells[column][row].alpha);
      // v3 added factor to appear to rotate circle
      ellipse(cells[column][row].x, cells[column][row].y, diameter*factor, diameter);
    }
  }
  
  // if ALL cells at final destination
  // change rotation factor
  if ((activeRow == 0) && (activeColumn == (columns-1)))
  {
    if ((factor > 0) && (factor <= 1.0))
    {
      println("factor: " + str(factor));
      factor -= 0.01;
    }
    else
    {
      background(#ffffff);
      noLoop();
    }
  }
  
}

void updateCells()
{
    // check if active cell has started moving
    if (cells[activeColumn][activeRow].status == 0)
    {
      // change status to moving
      cells[activeColumn][activeRow].status = 1;
      // move cell down
      cells[activeColumn][activeRow].y += speed;
    }
    
    // if current cell is moving update its position
    if (cells[activeColumn][activeRow].status == 1)
    {
      cells[activeColumn][activeRow].y += speed;
      // check if it has moved below its final destination y position
      // and move it back to destination y position
      if (cells[activeColumn][activeRow].y >= cells[activeColumn][activeRow].destinationY)
      {
        // change status to finished for current cell
        cells[activeColumn][activeRow].status = 2;
        cells[activeColumn][activeRow].y = cells[activeColumn][activeRow].destinationY;
        
        // if ALL cells at final destination
        if ((activeRow == 0) && (activeColumn == (columns-1)))
        {
          //noLoop();
          println("finished");
        }
        // if at top row move to next column bottom row
        else if ((activeRow == 0) && (activeColumn < (columns-1)))
        {
          activeRow = rows-1;
          activeColumn++;
        }
        // if not on top row move 1 row up
        else if ((activeRow > 0))
        {
          activeRow--;
        }  
      }
    }
}

void mousePressed()
{
  // start again with random colours in RGB
  if(mouseButton==LEFT)
  {
    activeRow = rows-1; activeColumn = 0;
    cells = new Circle[columns][rows];
    factor = 1.00;
    // update cells
    for (int row = 0; row < rows; row++)
    {
      for (int column = 0; column < columns; column++)
      {
        cells[column][row] = new Circle(cellGap*2 + column*(diameter + cellGap*2), cellGap*2 + row*(diameter + cellGap*2), color(random(255),random(255), random(255)),random(255));
        cells[column][row].y = -diameter - 2;
        println(cells[column][row].x, cells[column][row].y);
      }
    }
    
    loop();
  }
}
