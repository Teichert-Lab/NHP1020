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

% Last Modified by GUIDE v2.5 04-Feb-2020 14:27:27

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
set(section1, 'Color', 'b', 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');
set(section2, 'Color', 'y', 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');
set(section3, 'Color', 'g', 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual');
set(handles.pushbuttonCalculatePatch, 'BackgroundColor', 'r');
set(handles.pushFinalRun, 'BackgroundColor', 'r');

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

% Feedback
set(handles.textSpecifyFolder, 'String', selpath(idcs(end-1)+1:end));
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

% Add Toolbox
addpath(genpath([handles.basedir '/toolbox']));

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

% skull
zeroInd = max(find(zgv<2.0));
ct.img(:,:,1:zeroInd) = 0;
ct.img(find(cast.img>0.5)) = 0; % prevent overlapp of the two volumes
ctPatchFull = isosurface(X,Y,Z,squeeze(ct.img),500); 
ctPatch     = reducepatch(ctPatchFull,0.2);

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

% Progress view
d.Value = 0.8;
d.Message = 'Displaying ...';
pause(.5)

% Display skull
axes(handles.axesSkull);
hold off
p = patch(handles.axesSkull, ctPatch);
set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
daspect([1 1 1])
view(3)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
set(handles.axesSkull,'xtick',[],'ytick',[])

% Display brain
axes(handles.axesBrain);
hold off
p = patch(handles.axesBrain, castPatch);
set(p, 'FaceColor', [1.0 0.1 0.1], 'EdgeColor', 'none');
daspect([1 1 1])
view(3)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
set(handles.axesBrain,'xtick',[],'ytick',[])

% Display Section
axes(handles.axesMRsection);
hold off
p = patch(handles.axesMRsection, castPatch);
set(p, 'FaceColor', [1.0 0.1 0.1], 'EdgeColor', 'none');
daspect([1 1 1])
view(2)
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
p = patch(handles.axesMRsection, octPatch);
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
axes(handles.axesEEGLabView);
hold on
topoplot([], locs, 'emarker', {'.','b',15,1}, 'hcolor', 'r'); % 'electrodes', 'labels', 

handles.inskullelectrodes = inskullelectrodes;

guidata(hObject, handles);


% --- Executes on button press in pushbuttonCustomizePosition.
function pushbuttonCustomizePosition_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCustomizePosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
set(p, 'FaceColor', [1.0 0.1 0.1], 'EdgeColor', 'none');
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
    plot3( skullelectrodes(i).pos(1), skullelectrodes(i).pos(2),skullelectrodes(i).pos(3) ,'ko','markerfacecolor','b','markersize',10);
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
