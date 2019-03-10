// This macro is made to sort ROI manager files by renaming them in a certain sequence and then running thae sort command that works in numerical then alphabetical order (i think).
//Currently the values of p and q are set up so that the files will interleave, starting from the 31st (number 30) ROI is is named to become the first ROI, with the original first ROI now second, the 32nd slotting into 3rd and the orginal third pushed back to 4th and so on


//create a variable with file name
 MaxProjStack="16.12.06.Pen3H2O 30 min LatB.Stack of Max.tif"
//ensure correct file is selected and results window is empty
selectWindow(MaxProjStack);

//Loop equal to the number of frames (in my data that means 30 as there were 30 time points)
for (o=0;o<30; o++){

	q=(30+o);
	p=(o+1);
//The next loop is to rename the ROIs in the ROI manager, starting from ROI 30 (the 31st since numbering starts at 0) 
//the ROIs will be named such that when the 'sort' command is run, they will interleave with the first 30 ROIs, putting the 31st next to the first and the 32nd next to the seocnd etc.

	if(p<10){
	roiManager("Select",q);
roiManager("Rename", "000"+p+"-000 Dia");
	}
	if(p>=10){
roiManager("Select",q);
roiManager("Rename", "00"+p+"-000 Dia");
	
}
}
roiManager("Sort");
//As long as in order, run this then "add and t and Save" macro then "measure 60 odds" macro in this order
