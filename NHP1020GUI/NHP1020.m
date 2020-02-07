function varargout = NHP1020(varargin)
% NHP1020 MATLAB code for NHP1020.fig
%      NHP1020, by itself, creates a new NHP1020 or raises the existing
%      singleton*.
%
%      H = NHP1020 returns the handle to a new NHP1020 or the handle to
%      the existing singleton*.
%
%      NHP1020('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NHP1020.M with the given input arguments.
%
%      NHP1020('Property','Value',...) creates a new NHP1020 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NHP1020_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NHP1020_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NHP1020

% Last Modified by GUIDE v2.5 06-Feb-2020 19:05:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NHP1020_OpeningFcn, ...
                   'gui_OutputFcn',  @NHP1020_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before NHP1020 is made visible.
function NHP1020_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NHP1020 (see VARARGIN)

% Choose default command line output for NHP1020
handles.output = hObject;

section1 = axes('unit', 'normalized', 'position', [0 2/3 1 1/3]);
section2 = axes('unit', 'normalized', 'position', [0 1/3 1 1/3]);
section3 = axes('unit', 'normalized', 'position', [0 0 1 1/3]);

% Set color
handles.color1 = '#ece7f2';
handles.color2 = '#a6bddb';
handles.color3 = '#2b8cbe';

set(section1, 'Color', handles.color1, 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');
set(section2, 'Color', handles.color2, 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');
set(section3, 'Color', handles.color3, 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');

set(handles.textStep1, 'BackgroundColor', handles.color1);
set(handles.textStep2, 'BackgroundColor', handles.color2);
set(handles.textStep3, 'BackgroundColor', handles.color3);

handles.bordercolor = [0.8 0.8 0.8];
% Color Section 1
handles.buttoncolor1 = '#e5f5e0';
set(handles.uipanelSpecifyFolder, 'BackgroundColor', handles.color1, 'HighlightColor', handles.bordercolor);
set(handles.pushbuttonSpecifyFolder, 'BackgroundColor', handles.buttoncolor1);
set(handles.uipanelSkullThickness, 'BackgroundColor', handles.color1, 'HighlightColor', handles.bordercolor);
set(handles.pushbuttonCalculatePatch, 'BackgroundColor', handles.buttoncolor1);
axes(handles.axesSkullandBrain);
hold off

% Color Section 2
handles.buttoncolor2 = '#a1d99b';
set(handles.uipanelInion, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelInionX, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelInionY, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelInionZ, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelNasion, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelNasionX, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelNasionY, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelNasionZ, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelO_q, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);
set(handles.uipanelFp_q, 'BackgroundColor', handles.color2, 'HighlightColor', handles.bordercolor);


% Color Section 3
handles.buttoncolor3 = '#31a354';
set(handles.uipanelCustomizePosition, 'BackgroundColor', handles.color3, 'HighlightColor', handles.bordercolor);
set(handles.uipanelSliceNumber, 'BackgroundColor', handles.color3, 'HighlightColor', handles.bordercolor);
set(handles.pushbuttonImportPosition, 'BackgroundColor', handles.buttoncolor3);
set(handles.pushbuttonCustomizePosition, 'BackgroundColor', handles.buttoncolor3);
set(handles.pushFinalRun, 'BackgroundColor', handles.buttoncolor3);
axes(handles.axesEEGLabView);
hold off
axes(handles.axesInskullFinalView);
hold off
axes(handles.axesSkullFinalView);
hold off

handles.GUIpath = pwd;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NHP1020 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = NHP1020_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonSpecifyFolder.
function pushbuttonSpecifyFolder_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSpecifyFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Specify a data folder
mydir  = handles.GUIpath;
idcs   = strfind(mydir,'/');
newdir = [mydir(1:idcs(end)-1) '/data'];
basedir = mydir(1:idcs(end)-1);
selpath = uigetdir(newdir);
idcs   = strfind(selpath,'/');

% Set saving path and animal name
handles.basedir = basedir;
handles.datapath = selpath;
handles.animal = selpath(idcs(end)+1:end);

% Add Toolbox
addpath(genpath([handles.basedir '/toolbox']));

% Feedback
set(handles.uipanelSpecifyFolder, 'Title', ['Loaded: ', selpath(idcs(end-1)+1:end)]);
if isfile([handles.datapath '/' handles.animal '_castPatchFull.stl']) == 1
    handles.castPatchFull = stlread([handles.datapath '/' handles.animal '_castPatchFull.stl']);
    handles.castPatch = reducepatch(handles.castPatchFull,0.1);
    
    if isfile([handles.datapath '/' handles.animal '_ctPatchFull.stl'])
        handles.ctPatchFull = stlread([handles.datapath '/' handles.animal '_ctPatchFull.stl']);
        handles.ctPatch = reducepatch(handles.ctPatchFull,0.2);
        
        if isfile([handles.datapath '/' handles.animal '_octPatch.stl'])
            handles.octPatch = stlread([handles.datapath '/' handles.animal '_octPatch.stl']);
            axes(handles.axesSkullandBrain);
            hold off
            p = patch(handles.axesSkullandBrain, handles.castPatch);
            set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
            daspect([1 1 1])
            light('Position', [1 0 0], 'Style', 'infinite' )
            camlight; lighting phong
            hold on
            p = patch(handles.axesSkullandBrain, handles.octPatch);
            set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
            alpha(0.5)
            view([0, -1, 0])
        end
    end
end
            
guidata(hObject, handles);


% --- Executes on button press in pushbuttonCalculatePatch.
function pushbuttonCalculatePatch_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCalculatePatch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Progress view
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
        'Message','Loading...');
d.Value = 0.2;
pause(.5)

% Save skull thickness
handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));

% Load images
ct   = load_nii( [handles.datapath '/' handles.animal, '_CT_skull_filt.nii.gz']  );
cast = load_nii( [handles.datapath '/' handles.animal, '_inskull_mask_filt.nii.gz'] );
xgv = ((0:(cast.hdr.dime.dim(2))-1)*cast.hdr.dime.pixdim(2)) -cast.hdr.hist.qoffset_x ;
ygv = ((0:(cast.hdr.dime.dim(3))-1)*cast.hdr.dime.pixdim(3)) +cast.hdr.hist.qoffset_y ;
zgv = ((0:(cast.hdr.dime.dim(4))-1)*cast.hdr.dime.pixdim(4)) +cast.hdr.hist.qoffset_z ;
[X,Y,Z] = meshgrid(ygv,xgv,zgv);

% brain
castPatchFull = isosurface(X,Y,Z,squeeze(cast.img),0.5); 
castPatch     = reducepatch(castPatchFull,0.1);
stlwrite([handles.datapath '/' handles.animal '_castPatchFull.stl'], castPatchFull);
stlwrite([handles.datapath '/' handles.animal '_castPatch.stl'], castPatch);
% skull
zeroInd = max(find(zgv<2.0));
ct.img(:,:,1:zeroInd) = 0;
ct.img(find(cast.img>0.5)) = 0; % prevent overlapp of the two volumes
ctPatchFull = isosurface(X,Y,Z,squeeze(ct.img),500); 
ctPatch     = reducepatch(ctPatchFull,0.2);

stlwrite([handles.datapath '/' handles.animal '_ctPatchFull.stl'], ctPatchFull);
stlwrite([handles.datapath '/' handles.animal '_ctPatch.stl'], ctPatch);

% calculate the closest distance for all vertices of the ct to the cast.
% vertices that are very close to the cast, most likely correspond to the
% inside skull surface. Remove those vertices and corresponding faces
minDist = zeros( size(ctPatch.vertices,1),2 );
for i = 1:length(ctPatch.vertices)
    iMat  = [ ctPatch.vertices(i,1)*ones(size(castPatchFull.vertices,1),1),...  
              ctPatch.vertices(i,2)*ones(size(castPatchFull.vertices,1),1),...  
              ctPatch.vertices(i,3)*ones(size(castPatchFull.vertices,1),1)]';
    tmp = castPatchFull.vertices' - iMat;
    dst = sqrt(sum( tmp .* tmp, 1 ));
    minDist(i,1) = min(dst);
    disc         = find(dst==min(dst));
    minDist(i,2) = disc(1);
end

% Load skullThick from input
skullThick = handles.skullThick;


% Progress view
d.Value = 0.4;
d.Message = 'Calculating ...';
pause(.5)

% Calculate octPatch
valInd            = find( minDist(:,1)>skullThick );
invInd            = zeros(length(ctPatch.vertices),1 );
invInd(valInd)    = 1:length(valInd);
octPatch.vertices = ctPatch.vertices(valInd,:);
valPatch          = zeros(length(ctPatchFull.faces),1);
for i = 1:length(ctPatch.faces)
    if ismember( ctPatch.faces(i,1), valInd ) && ismember( ctPatch.faces(i,2), valInd ) && ismember( ctPatch.faces(i,3), valInd )  
        valPatch(i) = 1;
        %pi = pi + 1;
        %octPatch.faces(pi) = invInd(ctPatch.faces(i,:));

    end
end
octPatch.faces = invInd(ctPatch.faces(find(valPatch),:));
stlwrite([handles.datapath '/' handles.animal '_octPatch.stl'], octPatch);

% Progress view
d.Value = 0.8;
d.Message = 'Displaying ...';
pause(.5)

% Display Section
axes(handles.axesSkullandBrain);
hold off
p = patch(handles.axesSkullandBrain, castPatch);
set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
daspect([1 1 1])
view(2)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
p = patch(handles.axesSkullandBrain, octPatch);
set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
alpha(0.5)
view([0, -1, 0])

% Close progress bar
d.Value = 1;
d.Message = 'Done!';
pause(.5)
close(d);
close(f);

% Save to handles
handles.castPatchFull = castPatchFull;
handles.castPatch = castPatch;
handles.octPatch = octPatch;
guidata(hObject, handles);



% --- Executes on button press in pushbuttonImportPosition.
function pushbuttonImportPosition_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonImportPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile('*.*');
if filename(end-3:end) == '.txt'
    % Read from .txt
    tmp_qStrLst = readcell([pathname, filename]);
    count = 1;
    for i = 1 : length(tmp_qStrLst)
        
        % Mid in degree
        el = 90 - ((180 * (i-1)) / (length(tmp_qStrLst)-1));
        az = 0;
        inskullelectrodes(count) = InskullElectrode(1, [az, el], num2str(count));
        count = count + 1;
        if tmp_qStrLst{i,1} ~= 0
            for j = 1 : tmp_qStrLst{i,1}
                
                % Left
                az = 90 * (j / tmp_qStrLst{i,2});
                inskullelectrodes(count) = InskullElectrode(1, [az, el], num2str(count));
                count = count + 1;
                
                % Right
                az = - az;
                inskullelectrodes(count) = InskullElectrode(1, [az, el], num2str(count));
                count = count + 1;
            end
        end
    end
end

if filename(end-3:end) == '.xyz'
    locs = readlocs([handles.datapath '/' filename], 'format', {'channum','X','Y','Z','labels'});
    for i = 1 : length(locs)
        x = locs(i).X;
        y = locs(i).Y;
        z = locs(i).Z;
        label = locs(i).labels;
        inskullelectrodes(i) = InskullElectrode(2, [x, y, z], label);
    end
end

if filename(end-4:end) == '.locs'
    locs = readlocs([handles.datapath '/' filename]);
    for i = 1 : length(locs)
        x = locs(i).X;
        y = locs(i).Y;
        z = locs(i).Z;
        label = locs(i).labels;
        inskullelectrodes(i) = InskullElectrode(2, [x, y, z], label);
    end
end


bl = ' ';

% Save locations
addon = char(datetime);
fid = fopen([handles.datapath '/location_' addon '.xyz'], 'w');
for i = 1 : length(inskullelectrodes)
    fprintf(fid, [num2str(i) bl num2str(inskullelectrodes(i).cartesian_eeglab(1)) bl num2str(inskullelectrodes(i).cartesian_eeglab(2)) bl num2str(inskullelectrodes(i).cartesian_eeglab(3)) bl inskullelectrodes(i).label '\n']);
end
fclose(fid);

% load locations
locs = readlocs([handles.datapath '/location_' addon '.xyz'], 'format', {'channum','X','Y','Z','labels'});

% Show in EEGLab View
cla(handles.axesEEGLabView, 'reset')
axes(handles.axesEEGLabView);
topoplot([], locs, 'emarker', {'.','r',15,1}, 'hcolor', handles.bordercolor); % 'electrodes', 'labels', 

handles.inskullelectrodes = inskullelectrodes;

guidata(hObject, handles);


% --- Executes on button press in pushbuttonCustomizePosition.
function pushbuttonCustomizePosition_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCustomizePosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% handles.SliceNumber = str2double(get(handles.editSliceNumber, 'String'));
% handles.ColumnNames = {'Number of Electrodes', 'Nominator'};
% handles.ColumnNames
% tmpRowNames = cell(1, handles.SliceNumber);
% for num_of_slice = 1 : handles.SliceNumber
%     tmpRowNames(num_of_slice) = {num2str(num_of_slice)};
%     
% end
% handles.RowNames = tmpRowNames;
% guidata(hObject, handles);
% 
% option


% --- Executes on button press in pushFinalRun.
function pushFinalRun_Callback(hObject, eventdata, handles)
% hObject    handle to pushFinalRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Progress view
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
        'Message','Loading...');
d.Value = 0.2;
pause(.5)

% Get O_q and Fp_q, percentage of I2N
O_q = str2double(get(handles.editO_q, 'String'));
Fp_q = str2double(get(handles.editFp_q, 'String'));

% Get inion and nasion input
inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
inskullsurface = InskullSurface(handles.castPatchFull, inion, nasion, O_q, Fp_q);

% Progress view
d.Value = 0.5;
d.Message = 'Getting electrodes on skull';
pause(.5)

% Getting electrodes on skull
skullelectrodes = getskullelectrodes(handles.inskullelectrodes, inskullsurface, handles.castPatchFull, handles.octPatch);

% Display final inskull electrodes
cla(handles.axesInskullFinalView, 'reset')
axes(handles.axesInskullFinalView);
p = patch(handles.axesInskullFinalView,handles.castPatch);
set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
daspect([1 1 1])
view([0, 0, 1])
camroll(90)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
for i = 1:length(skullelectrodes)
%     if(electrodes(i).use == 1)
%         plot3( skullelectrodes(i).pos(1), skullelectrodes(i).pos(2),skullelectrodes(i).pos(3) ,'ko','markerfacecolor','b','markersize',10);
%     end
    plot3( skullelectrodes(i).pos(1), skullelectrodes(i).pos(2),skullelectrodes(i).pos(3) ,'ko','markerfacecolor','r','markersize',10);
end

% Display final skull electrodes
cla(handles.axesSkullFinalView, 'reset')
axes(handles.axesSkullFinalView);
p = patch(handles.axesSkullFinalView, handles.castPatch);
set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
daspect([1 1 1])
view([0, 0, 1])
camroll(90)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
octPatch = handles.octPatch;
p = patch(handles.axesSkullFinalView, octPatch);
set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
alpha(0.5)
for i = 1:length(skullelectrodes)
    pos     = skullelectrodes(i).skull;
    posMat  = [pos(1) * ones(size(octPatch.vertices,1),1),...
               pos(2) * ones(size(octPatch.vertices,1),1),...
               pos(3) * ones(size(octPatch.vertices,1),1)]';

    tmpP     = octPatch.vertices' - posMat;
    dstP     = sqrt(sum( tmpP .* tmpP, 1 ));
    circlInd = find(dstP<5);
    x        = skullelectrodes(i).normalSkull;

    tmp = [pos pos+10*x];
    plot3( tmp(1,:), tmp(2,:), tmp(3,:), 'Color', 'r', 'LineWidth', 2 ) 
    tmp = octPatch.vertices(circlInd,:)';
    plot3( tmp(1,:), tmp(2,:), tmp(3,:), 'ko', 'markerfacecolor', 'k', 'markersize', 1)
end

% Print out position data
writeElectrodes(skullelectrodes, handles.datapath);

% Close progress bar
d.Value = 1;
d.Message = 'Done!';
pause(.5)
close(d);
close(f);

guidata(hObject, handles);





function editInionX_Callback(hObject, eventdata, handles)
% hObject    handle to editInionX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInionX as text
%        str2double(get(hObject,'String')) returns contents of editInionX as a double


% --- Executes during object creation, after setting all properties.
function editInionX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInionX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInionZ_Callback(hObject, eventdata, handles)
% hObject    handle to editInionZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInionZ as text
%        str2double(get(hObject,'String')) returns contents of editInionZ as a double


% --- Executes during object creation, after setting all properties.
function editInionZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInionZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editInionY_Callback(hObject, eventdata, handles)
% hObject    handle to editInionY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editInionY as text
%        str2double(get(hObject,'String')) returns contents of editInionY as a double


% --- Executes during object creation, after setting all properties.
function editInionY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editInionY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNasionZ_Callback(hObject, eventdata, handles)
% hObject    handle to editNasionZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNasionZ as text
%        str2double(get(hObject,'String')) returns contents of editNasionZ as a double


% --- Executes during object creation, after setting all properties.
function editNasionZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNasionZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNasionY_Callback(hObject, eventdata, handles)
% hObject    handle to editNasionY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNasionY as text
%        str2double(get(hObject,'String')) returns contents of editNasionY as a double


% --- Executes during object creation, after setting all properties.
function editNasionY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNasionY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editNasionX_Callback(hObject, eventdata, handles)
% hObject    handle to editNasionX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editNasionX as text
%        str2double(get(hObject,'String')) returns contents of editNasionX as a double


% --- Executes during object creation, after setting all properties.
function editNasionX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editNasionX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editSkullThickness_Callback(hObject, eventdata, handles)
% hObject    handle to editSkullThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSkullThickness as text
%        str2double(get(hObject,'String')) returns contents of editSkullThickness as a double


% --- Executes during object creation, after setting all properties.
function editSkullThickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSkullThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFp_q_Callback(hObject, eventdata, handles)
% hObject    handle to editFp_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFp_q as text
%        str2double(get(hObject,'String')) returns contents of editFp_q as a double


% --- Executes during object creation, after setting all properties.
function editFp_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFp_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editO_q_Callback(hObject, eventdata, handles)
% hObject    handle to editO_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editO_q as text
%        str2double(get(hObject,'String')) returns contents of editO_q as a double


% --- Executes during object creation, after setting all properties.
function editO_q_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editO_q (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editSliceNumber_Callback(hObject, eventdata, handles)
% hObject    handle to editSliceNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSliceNumber as text
%        str2double(get(hObject,'String')) returns contents of editSliceNumber as a double


% --- Executes during object creation, after setting all properties.
function editSliceNumber_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSliceNumber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
