Kinetic Analysis of Vasculogenesis

ImageJ1 plugin for generating and analyzing a skeletal network from phase contrast images of in vitro vasculogenesis. This
plugin uses the Skeletonized 2D/3D(http://imagej.net/Skeletonize3D), the AnalyzeSkeleton(http://imagej.net/AnalyzeSkeleton)
and the particle analyzer plugins (http://imagej.net/Particle_Analysis) and a number of image processing tools from FIJI
including, Background Subtraction, Convolution, Enhance Contrast and Maximum are streamlined into image preprocessing.  
Thresholding of the resulting images are calculated useing the FIJI included algorithms
(http://imagej.net/Auto_Threshold#Available_methods) from wtih skeletons are generated.  AnalyzeSkeleton is then applied to 
each time point and results are determined slicewise and calculations from the particle analyzer and summary statistics 
calculated by time point.  In toto this enables the calculation of the following parameters with or without the correct image 
calibrations: "Slice", "Total Branch Networks", "Nodes", "Triples", "Quadruples", "Tubes", "Total Length", "Avg Length",
"Tubes/Nodes", "Closed Networks", "Network size".  The plugin also generates a timecourse stack of the threshold result and the calculated skeleton.

Please address any comments or questions to icbm@iupui.edu.
