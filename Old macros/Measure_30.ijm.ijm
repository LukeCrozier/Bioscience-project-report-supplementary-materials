//Really simply measure the ROIs in order, first easured in slice 1, second on slice 2 etc up to the number of slices
//ooutput then prompts save window where you can relocate but not rename, must change filename in second last line before running macro
 MAxProjStack="16.12.06.Pen3H2O 30 min LatB.Stack of Max.tif"
selectWindow(MAxProjStack);
path2=getDirectory(MAxProjStack);
for (o=0;o<nSlices; o++){
roiManager("Select",o);

	setSlice(o+1);
	run("Measure"); 
}
    selectWindow("Results");
 saveAs("Results", path2+"Results for " +MAxProjStack +" C6.csv");
    run("Clear Results");
 

    
