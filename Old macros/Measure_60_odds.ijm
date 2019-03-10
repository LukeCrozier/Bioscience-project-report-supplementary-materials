//Macro to measure the area around the diamond shadows within the oval ROIs of size specified in "drawOval complete d"
 
 MAxProjStack="16.12.05.Pen3_H2O 30 min latB.Stack of Max.tif"
selectWindow(MAxProjStack);
path2=getDirectory(MAxProjStack);
run("Clear Results");

//for number of slices in image, select the diamond cutout ROI, select the correct slice (although should have anyway when selected the ROI)
//then it measures the data and outputs that into a 'results' window
for (o=0;o<nSlices; o++){
	n=(2*o);
	y=(61+n);
roiManager("Select",y);

	setSlice(o+1);
	run("Measure"); 
}
//Automatically saves the results, you need to rename the file, change the bit that says 'D5' to D1 or D2 or whichever number diamond shadow you are measuring at the moment
    selectWindow("Results");
 saveAs("Results", path2+"Results for " +MAxProjStack +" D5.csv");
    run("Clear Results");
 

    
