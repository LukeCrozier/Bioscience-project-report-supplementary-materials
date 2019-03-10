

//macro to invert the diamond shaow selections (after the "name and sort" macro these will be in ROIs number 0,2,4,6...
//The inversions will then be combined with the oval ROIs at roi numbers 1,3,5...  and 'ADD' will combine the two, outputting an oval with the diamond shadow sut out 
//the shadow will then be excluded form subsequent measure
//the ROIs will then total 120 (0-119) and the new diamond free cutouts at roi numbers 119,117,115 etc can be ,measure with the "measure 60 odds" command"

//create a variable with file name
 AverageBgCorrected="FILE.tif"
selectWindow(AverageBgCorrected);

for (o=1;o<=nSlices; o++){
	a=(2*(o-1));
	b=((2*o)-1);
setSlice(o);
//inverts the diamond shadow ROIs and saves the output as a new ROI
	roiManager("Select",a);
	run("Make Inverse");
	roiManager("Add")
	c=(a+60);
//createvariable that contains "c,b" that can then be referenced in roi manager commands (will not accept two variables in the roiManager commands)
// 'AND' combines them and 'add' adds the new combined ROI to the roi manager
	ROIs=newArray(c,b);
	roiManager("Select",ROIs);
	roiManager("AND");
	roiManager("Add");
}
   
//SAVE YOUR ROIS IN THIS ORDER- necessary for subsequent measuring macro
 
 