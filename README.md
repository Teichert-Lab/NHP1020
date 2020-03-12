# If you need any help, please [report an issue](https://github.com/Teichert-Lab/NHP1020/issues) or email spike.iatry@gmail.com. We would love to help you solve any issues!

# We have submitted preprint version: *A surface metric and software toolbox for EEG electrode grids in the macaque (Fan Li, Tobias Teichert, 2020)* to bioRxiv, please find [here](https://www.biorxiv.org/content/10.1101/2020.03.10.986588v1)!

# NHP1020
This MATLAB repository establishes a surface metric and software toolbox for EEG electrode grids in the macaque.

## Usage:
### Installation
1. Git clone this repository.
2. Open NHP1020/NHP1020GUI/NHP1020.m file in MATLAB and run.
3. Additional Toolboxes: Phased Array System Toolbox, [eeglab](https://sccn.ucsd.edu/eeglab/download.php). It is recommended to change the eeglab folder name into 'eeglab' (if not) and put the eeglab folder into the NHP1020/toolbox folder.

### Load Image and Analysis (Quick start)
5. Specify a folder in the **Data Panel**. The example folder 'NHP1020/data/jessesym' contains a fully functional example data set. If .stl files are available, it will load them automatically. Otherwise, it will calculate the the brain and skull from the .nii.gz files. If skull surface is patchy, change the skullthickness, and press **Recalculate Patch** button.
6. Enter Inion and Nasion location, the percentages of Oz and Fpz in the **Matric Panel**. Press **Preview** to see if it is satisfactory. 
7. In the **Layout Panel**, there are two options to import electrodes' postion: import it from the off-the-shelf eeglab postions (.sph, .xyz, .locs) or import it from the customized .txt file. The schema is shown after importing the electrodes' positions. There are several sample files in the 'NHP1020/sampleGrid/' folder for reference.
8. Now, press **Run** button to see the physical electrodes' position on the skull.
9. The results are saved in the specified folder and named positionList_ISI.txt.


### Using the GUI (Details)
The NHP1020 software allows the user to design electrodes grids for NHPs. After navigating matlab to the 'NHP1020GUI' folder, the main GUI can be opened with the command 'NHP1020'. The workflow is structured into four main steps which are reflected in the four main panels of the GUI

Data: The main purpose of the data panel is to specify the data folder that contains the CT image and the brain mask in nifty format. This folder will be used to store all the intermittent data and the final results of the process. The software distribution of NHP1020 contains a fully functional example data set that is located in the folder 'NHP1020/data/jessesym'. Once a folder is specified, the GUI will look for two files that contain the character sequence ‘*CT_skull*.nii.gz’ and ‘*inskull*.nii.gz’. If two nifty files match that description, the software will open them and create surface patches of the skull and the brain and save them in stl format. If the necessary stl files have already been generated in an earlier session, the software will immediately open the stl files, rather than generating them from scratch because this process is time-consuming. As soon as the patches have been generated or loaded, they will be automatically displayed in the figures to the right of the data tab. The skull surface is plotted in light blue. The gray brain surface is visible through the semi-transparent skull. For some animals, the default settings may result in holes in the skull. This can typically be resolved by lowering the parameter ‘Skull Thickness’ and pressing the ‘Recalculate Patch’ button. The steps of the data tab can be considered complete once intact skull and brain surfaces have been generated and displayed.

Metric: The main purpose of the ‘metric’ tab is to set up the two-dimensional surface coordinate frame that lies at the heart of the NHP1020. To do so, the user needs to specify the positions of NHP’s Inion- and Nasion-homolog. We suggest identifying these points in a dedicated nifty file viewer such as fsl_eyes. The GUI also provides the option to change the values of O_q and Fp_q. However, it is suggested to use the default values for consistency across labs. Once specified, the ‘Preview’ button will display a figure of the brain patch with the current midline and circumference superposed. If the metric is acceptable, the user can proceed to the layout tab.

Layout: The layout tab allows users to specify the electrode grid they want to project onto the monkey skull. Layouts can be imported from eeglab location files in .sph, .xyz. and .loc formats. A couple of sample grids such as the 10-20 and 10-10 system in spherical coordinates are included in the 'template’ folder of the NHP1020 software. Alternatively, grids can be specified using the NHP1020 shorthand described in section 2.8. A text file containing the shorthand definition of the default NHP1020 layout is also provided in the 'template' folder. Once a layout has been loaded, the software displays a flat-map mock-up of the layout.

Run: Once the layout has been finalized, the electrode positions can be projected to the rhesus skull by pressing the ‘Run’ button. This process is time-intense, so it makes sense to carefully choose the layout before identifying electrode positions on the individual monkey brain and projecting them to skull. The results are saved in a text file ('positionList\_ISI.txt') in the main folder that was specified in the data tab. Each row in the file represents an electrodes by features (Number: row number, Name: electrode's label, brainX: electrode's x-axis value on the brain, brainY: electrode's y-axis value on the brain, brainZ: electrode's z-axis value on the brain, skullX: electrode's x-axis value on the skull, skullY: electrode's y-axis value on the skull, skullZ: electrode's z-axis value on the skull). 


## Update

### 02/11/2020
1. interface improvement
2. flexible reading files
3. toolbox description
4. fix camera rotate bug
5. add more .locs templates

### 02/10/2020
1. fix load data in anywhere
2. automatically calculate patch file if it is not there.
3. polish the interface
4. I2N and N2N preview
5. delete back surface plot

### 02/07/2020
1. Color rendering
2. Layout updates
3. Automatically .stl detection 
Credits to Sven Holcombe (stlwrite) and Eric Johnson (stlread)  
Sven (2020). stlwrite - write ASCII or Binary STL files (https://www.mathworks.com/matlabcentral/fileexchange/20922-stlwrite-write-ascii-or-binary-stl-files), MATLAB Central File Exchange. Retrieved February 7, 2020.  
Eric Johnson (2020). STL File Reader (https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader), MATLAB Central File Exchange. Retrieved February 7, 2020.
4. Skull electrodes final view
5. Brain color update
6. EEGlab plot update (red electrodes, gray line)

## References
1. Fan Li, Tobias Teichert (2020), A surface metric and software toolbox for EEG electrode grids in the macaque. (https://www.biorxiv.org/content/10.1101/2020.03.10.986588v1)
2. Sven (2020). stlwrite - write ASCII or Binary STL files (https://www.mathworks.com/matlabcentral/fileexchange/20922-stlwrite-write-ascii-or-binary-stl-files), MATLAB Central File Exchange. Retrieved February 7, 2020.  
3. Eric Johnson (2020). STL File Reader (https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader), MATLAB Central File Exchange. Retrieved February 7, 2020.
