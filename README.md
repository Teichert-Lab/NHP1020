# NHP1020
This is a MATLAB repository for non-human primates' EEG.

## Usage:
### Download
1. Git clone this repository.
2. Please download toolbox from this link and set path to the downloaded toolbox.
3. Open NHP1020/GUI.m file in MATLAB and run.
### Load Image and Analysis
4. Select skull image and brain image using Load CT Skull button and Load Inskull Mask button.
5. Press Display Skull button to preview the skull image.
6. Enter Inion and Nasion location, Number of Slices and skullThick in the corresponding blank.
7. Press Option button to set electrodes positions. You can either type in how many parts you want to divide each slice evenly in the Nominator, then type in how many electrodes you want to be set on this slice. Or you could load the Settings from txt file. There is a sample Settings.txt for reference.
8. After specifying the electrodes' position, press preview button to see the distribution of the electrodes. It usually takes 1 minite to generate. If it is OK, press confirm to continue. 
9. Now, press Analyze button to see the physical electrodes' position on the skull in third image.
10. If everything is satisfactory, press Print.txt to acquire output txt files.

## Structure
### getElectrode
### getqlst
### getQuant

## Update
### 02/07/2020
1. Color rendering
2. Layout updates
3. Automatically .stl detection 
Credits to Sven Holcombe (stlwrite) and Eric Johnson (stlread)
Sven (2020). stlwrite - write ASCII or Binary STL files (https://www.mathworks.com/matlabcentral/fileexchange/20922-stlwrite-write-ascii-or-binary-stl-files), MATLAB Central File Exchange. Retrieved February 7, 2020.  
Eric Johnson (2020). STL File Reader (https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader), MATLAB Central File Exchange. Retrieved February 7, 2020.
4. Skull electrodes final view
5. Brain color update
6. EEGlab plot update (red electrodes, gray line )

