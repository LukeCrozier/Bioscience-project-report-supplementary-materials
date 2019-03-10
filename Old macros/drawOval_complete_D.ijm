//Macro to take a .csv file with x and y columns containing x and y coordinates 
//where each row is sequntially added as an oval ROI at the slice equal to the row number


//create a variable with file name
MAxProjStack="16.12.06.Pen3H20 30 min  LatB.Stack of Max.tif"
//ensure correct file is selected and results window is empty
selectWindow(MAxProjStack);
run("Clear Results");
//open the .csv file containing the x and y coordinates, opens in window titled "results"
open("C:/Users/UKREX/Documents/UNI/Y2/Summer project/Diamond Site/Data/Stefan/Collections/16-12-06/ROIs/16-12-06 Pen3-gfp H2O LatB/D/Oval tracking csv files/D1.csv");
// Loops number of times rqual to number of results rows in the opened file (i++ means increment i by 1 each time) 
    for (i = 0; i < nResults; i++) 
   { 
   	//set variables, pa nd q are the ith result in the x and y columns and "slice" is equal to i+1 and therfore is the slice number (i goes '0 to (nResults-1)),the slices must be from 1 to nResults where nResuts<= total slices in image) 
      slice=i+1;
      p= getResult("x", i); 
      q= getResult("y", i); 
	  setSlice(slice);
	  //makeOval plots an oval ROI, google to find other commands for rectangle or point etc.
	  //change 50,50 if different width and height required
	makeOval(p,q,50,50);
	//save new ROI in ROI manager, runs same command as pressing 't' would when drawing ROIs
      roiManager("Add"); 
   } 
//no save clause, simply adds the ROIS, save manually after checking position of ROIs in each frame matches expectations