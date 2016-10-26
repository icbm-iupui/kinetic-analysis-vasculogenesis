
// This macro batch processes a folder of images,
// setting the scales to a given specification.
// All the images must be in TIFF format.

   requires("1.33n"); 
  dir = getDirectory("Choose a Source Directory ");
  dir2 = getDirectory("Choose a Destination Directory ");
   list = getFileList(dir);
   start = getTime();
   IJ.log("Starting batch preprocessing of MI data.");
  
   setBatchMode(true); // runs up to 6 times faster
  for (i=0; i<list.length; i++) {
   path = dir+list[i];
   showProgress(i, list.length);
   open(path);
        title = getTitle();
        stop_pos = indexOf(title,".");
	truncatedtitle = substring(title,0,stop_pos);

		width = getWidth();
		height = getHeight();
		size = nSlices()/4;
	
		IJ.log("Processing: " + title);
		IJ.log("Size: " + width + " x " + height + " x " + size);
		setBackgroundColor(0, 0, 0);
		run("Clear Outside", "stack");
        run("Split Channels");
        selectWindow("C1-"+title);
		run("Subtract Background...", "rolling=50 stack");
		
        run("StackReg", "transformation=[Rigid Body]");
	run("StackReg", "transformation=Affine");
	run("32-bit");
        selectWindow("C2-"+title);
       	run("Z Project...", "projection=[Max Intensity]");
       	selectWindow("MAX_C2-"+title);
       	run("Median...", "radius=15");
		run("Subtract Background...", "rolling=300");
		setAutoThreshold("Li dark");
		setOption("BlackBackground", false);
		run("Convert to Mask");
		run("Local Thickness (complete process)", "threshold=128");
		//wait(30000);
		selectWindow("MAX_C2-"+truncatedtitle+"_LocThk");
		//run("8-bit");
		run("Select All");
		run("Copy");
	
        newImage(title+"_EDM", "32-bit white", width, height, size);
        for(j = 1; j <= size; j++){
        	run("Paste");
		run("Next Slice [>]");
        }
		resetMinAndMax();
		run("Invert LUT");
		selectWindow("C2-"+title);
		run("32-bit");
		run("Merge Channels...", "c1=C1-"+title+" c2=C2-"+title+" c3="+title+"_EDM create");
		rename(truncatedtitle+"_Processed" + ".tif");
     save(dir2+getTitle());
         print("Processing time: " + (getTime()-start)/1000 + " s.");
  }


