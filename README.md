# NHP1020
This is a MATLAB repository for non-human primates' EEG.

## Usage:
### Download
1. Git clone this repository.
2. Please put the CT and MR file ending by 'CT_skull.nii.gz' and 'inskull.nii.gz' in the NHP1020/data folder.
3. Open NHP1020/NHP1020GUI/NHP1020.m file in MATLAB and run.
4. Additional Toolboxes: Phased Array System Toolbox, [eeglab](https://sccn.ucsd.edu/eeglab/download.php). It is recommended to change ensure that the eeglab folder name is 'eeglab' and put the eeglab folder into the NHP1020/toolbox folder.

### Load Image and Analysis
5. Specify a folder in the **Data Panel** for saving data. If .stl files are available, it will load them automatically. Otherwiise, it will calucate the the brain and skull from the .nii.gz files. If you need change the skullthickness, just press **Recalculate Patch** button after specifying a number for skullthickness.
7. Enter Inion and Nasion location, the percentages of Oz and Fpz in the **Matric Panel**. Press **Preview** to see if it is satisfactory.
8. In the **Layout Panel**, there are two options to import electrodes' postion: import it from the off-the-shelf eeglab postions (.sph, .xyz, .locs) or import it from the customized .txt file. The schema is shown after importing the electrodes' positions.
9. Now, press **Run** button to see the physical electrodes' position on the skull.

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

1. Sven (2020). stlwrite - write ASCII or Binary STL files (https://www.mathworks.com/matlabcentral/fileexchange/20922-stlwrite-write-ascii-or-binary-stl-files), MATLAB Central File Exchange. Retrieved February 7, 2020.  
2. Eric Johnson (2020). STL File Reader (https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader), MATLAB Central File Exchange. Retrieved February 7, 2020.

