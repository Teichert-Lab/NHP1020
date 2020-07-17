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

% Last Modified by GUIDE v2.5 07-Jul-2020 15:52:27

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

% Check filesep
handles.separator = filesep;

% check data path and position file
handles.datapath = 0;
handles.Position_isloaded = 0;

section1 = axes('unit', 'normalized', 'position', [0.05 2/3 30.5/40 1/3]);
section2 = axes('unit', 'normalized', 'position', [0.05 1/3 30.5/40 1/3]);
section3 = axes('unit', 'normalized', 'position', [0.05 0 30.5/40 1/3]);
section4 = axes('unit', 'normalized', 'position', [30.5/40 0 9.5/40 2/3]);
section5 = axes('unit', 'normalized', 'position', [0, 0, 0.05, 1]);


% Set color
handles.color1 = '#f1eef6';
handles.color2 = '#bdc9e1';
handles.color3 = '#74a9cf';
handles.color4 = '#0570b0';

set(section1, 'Color', handles.color1, 'xtick', [], 'ytick', [], 'ztick', []); % 'XTickMode', 'manual', 'YTickMode', 'manual', 'ZTickMode', 'manual'
set(section2, 'Color', handles.color2, 'xtick', [], 'ytick', [], 'ztick', []);
set(section3, 'Color', handles.color3, 'xtick', [], 'ytick', [], 'ztick', []);
set(section4, 'Color', handles.color4, 'xtick', [], 'ytick', [], 'ztick', []);

% 5
x = [0; 0.05; 0.05; 0];
y = [0; 0; 1; 1];
c = [1, 1, 10, 10];
hp = patch(section5, x, y, c);
textLogo=text(0.5, 0.15,'NHP 1020', 'FontSize', 30, 'Units','normalized','FontUnits','normalized');
uistack(textLogo, 'top')
set(textLogo,'Rotation',90);
textLogo=text(0.5, 0.45,'NHP 1020', 'FontSize', 30, 'Units','normalized','FontUnits','normalized');
uistack(textLogo, 'top')
set(textLogo,'Rotation',90);
textLogo=text(0.5, 0.75,'NHP 1020', 'FontSize', 30, 'Units','normalized','FontUnits','normalized');
uistack(textLogo, 'top')
set(textLogo,'Rotation',90);
colormap('gray');
set(section5, 'xtick', [], 'ytick', [], 'ztick', []);
hold off

% 6
section6 = axes('unit', 'normalized', 'position', [30.5/40 2/3 9.5/40 1/3]);
x = [0; 0.05; 0.05; 0];
y = [0; 0; 1; 1];
c = [1, 1, 10, 10];
hp = patch(section6, x, y, c);
textLogo=text(0.1, 0.5,'NHP 1020', 'FontSize', 50, 'Units','normalized','FontUnits','normalized');
uistack(textLogo, 'top')

set(section6, 'xtick', [], 'ytick', [], 'ztick', []);

handles.bordercolor = [0.8 0.8 0.8];
% Color Section 1
handles.buttoncolor1 = '#feedde';
set(handles.uipanelSpecifyFolder, 'BackgroundColor', handles.color1, 'HighlightColor', handles.bordercolor);
set(handles.pushbuttonSpecifyFolder, 'BackgroundColor', handles.buttoncolor1);
set(handles.uipanelSkullThickness, 'BackgroundColor', handles.color1, 'HighlightColor', handles.bordercolor);
set(handles.pushbuttonCalculatePatch, 'BackgroundColor', handles.buttoncolor1);
axes(handles.axesSkullandBrain);
hold off
% Insert label
axes(handles.axesData);
fill(handles.axesData, [0, 0, -0.5, 0.5, 1.5, 1, 1], [0, -0.3, -0.3, -0.5, -0.3, -0.3, 0], 1, 'FaceColor', handles.buttoncolor1);
set(handles.axesData, 'Color', 'none', 'xtick', [], 'ytick', [], 'Visible', 'off');
textData=text(0.5,-0.3,'Data', 'FontSize', 25,'FontUnits','normalized');
set(textData,'Rotation',90);

% Color Section 2
handles.buttoncolor2 = '#fdbe85';
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
set(handles.pushbuttonPreview, 'BackgroundColor', handles.buttoncolor2);
axes(handles.axesI2NandN2N);
% Insert label
axes(handles.axesMetric);
axes(handles.axesMetric);
fill([0, 0, -0.5, 0.5, 1.5, 1, 1], [0, -0.3, -0.3, -0.5, -0.3, -0.3, 0], 1, 'FaceColor', handles.buttoncolor2);
set(handles.axesMetric, 'Color', 'none', 'xtick', [], 'ytick', [], 'Visible', 'off');
textMetric=text(0.5,-0.3,'Metric', 'FontSize', 25,'FontUnits','normalized');
set(textMetric,'Rotation',90);

% Color Section 3
handles.buttoncolor3 = '#fd8d3c';
set(handles.pushbuttonImportPosition, 'BackgroundColor', handles.buttoncolor3);
set(handles.pushbuttonImportLayout, 'BackgroundColor', handles.buttoncolor3);
% Insert label
axes(handles.axesLayout);
axes(handles.axesLayout);
fill([0, 0, -0.5, 0.5, 1.5, 1, 1], [0, -0.3, -0.3, -0.5, -0.3, -0.3, 0], 1, 'FaceColor', handles.buttoncolor3);
set(handles.axesLayout, 'Color', 'none', 'xtick', [], 'ytick', [], 'Visible', 'off');
textLayout=text(0.5,-0.3,'Layout', 'FontSize', 25, 'FontUnits','normalized');
set(textLayout,'Rotation',90);

% Color Section 4
handles.buttoncolor4 = '#d94701';
set(handles.pushbuttonFinalRun, 'BackgroundColor', handles.buttoncolor4);
% Insert label
axes(handles.axesCalculate);
set(handles.axesCalculate, 'unit', 'normalized', 'position', [(30.5/40-0.01*5) (1/3-0.04*5) 0.02*5 0.08*5]);
fill([0, 0.3, 0.3, 0.5, 0.3, 0.3, 0], [0, 0, -0.5, 0.5, 1.5, 1, 1], 1, 'FaceColor', handles.buttoncolor4);
set(handles.axesCalculate, 'Color', 'none', 'xtick', [], 'ytick', [], 'Visible', 'off');

axes(handles.axesTopView);
axes(handles.axesEEGLabView);
hold off
axes(handles.axesInskullFinalView);
hold off
axes(handles.axesSkullFinalView);
hold off

handles.GUIpath = pwd;
% mydir  = handles.GUIpath;
% idcs   = strfind(mydir, handles.separator);
% newdir = [mydir(1:idcs(end)-1) handles.separator 'logo'];

% Insert Logo



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
idcs   = strfind(mydir, handles.separator);
newdir = [mydir(1:idcs(end)-1) handles.separator 'data'];
basedir = mydir(1:idcs(end)-1);
selpath = uigetdir(newdir);
if isequal(selpath,0)
    disp('User canceled image selection')
    return;
else
    idcs   = strfind(selpath, handles.separator);
end

% Set saving path and animal name
handles.basedir = basedir;
handles.datapath = selpath;
handles.animal = selpath(idcs(end)+1:end);

% Add Toolbox
addpath(genpath([handles.basedir handles.separator 'toolbox']));

% Check eeglab toolbox
% eeglab_isLoaded = exist([handles.basedir '/toolbox/eeglab']);
% if eeglab_isLoaded ~= 7 % not exist
%     readlocs_isLoaded = exist('readlocs');
%     if readlocs_isLoaded ~= 2
%         warning = msgbox('Please download eeeglab from https://sccn.ucsd.edu/eeglab/download.php and rename the folder as eeglab and put it in the toolbox folder. Or please set the eeglab and its subpath to the path.');
%         return
%     end
% end
readlocs_isLoaded = exist('readlocs');
topoplot_isLoaded = exist('topoplot');
if (readlocs_isLoaded ~= 2) || (topoplot_isLoaded ~= 2)
    warning = msgbox('Please download eeeglab from https://sccn.ucsd.edu/eeglab/download.php and rename the folder as eeglab and put it in the toolbox folder. Or please set the eeglab and its subfolders to the path.');
    return
end

% Progress view
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
        'Message','Loading...');
d.Value = 0.2;
pause(.5)

% load default skullthick
fid = fopen([handles.datapath handles.separator 'Setup_SkullThickness.txt']);
if fid ~= -1
    line = fgetl(fid);
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editSkullThickness, 'String', newStr(1));
    guidata(hObject, handles);
end


% load default skullthreshold
fid = fopen([handles.datapath handles.separator 'Setup_SkullThreshold.txt']);
if fid ~= -1
    line = fgetl(fid);
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editSkullThreshold, 'String', newStr(1));
    guidata(hObject, handles);
end


fid = fopen([handles.datapath handles.separator 'Setup_LandMarks.txt']);
if fid ~= -1
    line = fgetl(fid);
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editInionX, 'String', newStr(2));
    set(handles.editInionY, 'String', newStr(3));
    set(handles.editInionZ, 'String', newStr(4));
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editNasionX, 'String', newStr(2));
    set(handles.editNasionY, 'String', newStr(3));
    set(handles.editNasionZ, 'String', newStr(4));
    guidata(hObject, handles);
end

fid = fopen([handles.datapath handles.separator 'Setup_O_qFp_q.txt']);
if fid ~= -1
    line = fgetl(fid);
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editO_q, 'String', newStr(2));
    line = fgetl(fid);
    newStr = split(line, ' ');
    set(handles.editFp_q, 'String', newStr(2));
    guidata(hObject, handles);
end

% load default settings
% fid = fopen([handles.datapath handles.separator defaults.txt']);
% if fid ~= -1
%     line = fgetl(fid);
%     line = fgetl(fid);
%     newStr = split(line, ' ');
%     set(handles.editSkullThickness, 'String', newStr(1));
%     set(handles.editInionX, 'String', newStr(2));
%     set(handles.editInionY, 'String', newStr(3));
%     set(handles.editInionZ, 'String', newStr(4));
%     set(handles.editNasionX, 'String', newStr(5));
%     set(handles.editNasionY, 'String', newStr(6));
%     set(handles.editNasionZ, 'String', newStr(7));
%     set(handles.editO_q, 'String', newStr(8));
%     set(handles.editFp_q, 'String', newStr(9));
%     guidata(hObject, handles);
% end

% Feedback
set(handles.uipanelSpecifyFolder, 'Title', selpath(idcs(end-1)+1:end));
% If stl file exits, show directly
if isfile([handles.datapath handles.separator handles.animal '_castPatchFull.stl']) == 1
    % Load stl file
    handles.castPatchFull = stlread([handles.datapath handles.separator handles.animal '_castPatchFull.stl']);
    handles.castPatch = reducepatch(handles.castPatchFull,0.1);
    
    if isfile([handles.datapath handles.separator handles.animal '_ctPatchFull.stl'])
        handles.ctPatchFull = stlread([handles.datapath handles.separator handles.animal '_ctPatchFull.stl']);
        handles.ctPatch = reducepatch(handles.ctPatchFull,0.2);
        
        if isfile([handles.datapath handles.separator handles.animal '_octPatch.stl'])
            handles.octPatch = stlread([handles.datapath handles.separator handles.animal '_octPatch.stl']);
            % Top View
            cla(handles.axesSkullandBrain)
            axes(handles.axesTopView);
            hold off
            p = patch(handles.axesTopView, handles.castPatch);
            set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
            daspect([1 1 1])
            light('Position', [1 0 0], 'Style', 'infinite' )
            camlight; lighting phong
            hold on
            p = patch(handles.axesTopView, handles.octPatch);
            set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
            alpha(0.5)
            view([0, 0, 1])
            camroll(90)
            
            % Section View
            cla(handles.axesSkullandBrain)
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
            handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));
        end
    end
else
    
    
    if 1==0
        % If stl file does not exit, calculate it
        % Save skull thickness
        handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));
        
        % Load images
        %     ct   = load_nii( [handles.datapath handles.separator handles.animal, '_CT_skull_filt.nii.gz']  );
        %     cast = load_nii( [handles.datapath handles.separator handles.animal, '_inskull_mask_filt.nii.gz'] );
        ct   = load_nii( [handles.datapath handles.separator '*CT_skull*.nii.gz']  );
        cast = load_nii( [handles.datapath handles.separator '*inskull*.nii.gz'] );
        xgv = ((0:(cast.hdr.dime.dim(2))-1)*cast.hdr.dime.pixdim(2)) -cast.hdr.hist.qoffset_x ;
        ygv = ((0:(cast.hdr.dime.dim(3))-1)*cast.hdr.dime.pixdim(3)) +cast.hdr.hist.qoffset_y ;
        zgv = ((0:(cast.hdr.dime.dim(4))-1)*cast.hdr.dime.pixdim(4)) +cast.hdr.hist.qoffset_z ;
        [X,Y,Z] = meshgrid(ygv,xgv,zgv);
        
        % brain
        castPatchFull = isosurface(X,Y,Z,squeeze(cast.img),0.5);
        castPatch     = reducepatch(castPatchFull,0.1);
        stlwrite([handles.datapath handles.separator handles.animal '_castPatchFull.stl'], castPatchFull);
        stlwrite([handles.datapath handles.separator handles.animal '_castPatch.stl'], castPatch);
        % skull
        zeroInd = max(find(zgv<2.0));
        ct.img(:,:,1:zeroInd) = 0;
        ct.img(find(cast.img>0.5)) = 0; % prevent overlapp of the two volumes
        ctPatchFull = isosurface(X,Y,Z,squeeze(ct.img),500);
        ctPatch     = reducepatch(ctPatchFull,0.2);
        
        stlwrite([handles.datapath handles.separator handles.animal '_ctPatchFull.stl'], ctPatchFull);
        stlwrite([handles.datapath handles.separator handles.animal '_ctPatch.stl'], ctPatch);
        
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
        stlwrite([handles.datapath handles.separator handles.animal '_octPatch.stl'], octPatch);
        
        % Top View
        cla(handles.axesTopView)
        axes(handles.axesTopView);
        hold off
        p = patch(handles.axesTopView, castPatch);
        set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
        daspect([1 1 1])
        light('Position', [1 0 0], 'Style', 'infinite' )
        camlight; lighting phong
        hold on
        p = patch(handles.axesTopView, octPatch);
        set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
        alpha(0.5)
        view([0, 0, 1])
        camroll(90)
        
        % Display Section
        cla(handles.axesSkullandBrain)
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
        
        % Save to handles
        handles.castPatchFull = castPatchFull;
        handles.castPatch = castPatch;
        handles.octPatch = octPatch;
    end
end

% Close progress bar
d.Value = 1;
d.Message = 'Done!';
pause(.5)
close(d);
close(f);


guidata(hObject, handles);


% --- Executes on button press in pushbuttonCalculatePatch.
function pushbuttonCalculatePatch_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonCalculatePatch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check data folder
if handles.datapath == 0
    warning = msgbox('Please specify a data folder first.');
    return;
end

% Progress view
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
        'Message','Loading...');
d.Value = 0.2;
pause(.5)

% Save skull thickness
handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));
handles.skullThresh = str2double(get(handles.editSkullThreshold, 'String'));

% Load images
ct   = load_nii( [handles.datapath handles.separator '*CT_skull*.nii.gz']  );
cast = load_nii( [handles.datapath handles.separator '*inskull*.nii.gz'] );
xgv = ((0:(cast.hdr.dime.dim(2))-1)*cast.hdr.dime.pixdim(2)) -cast.hdr.hist.qoffset_x ;
ygv = ((0:(cast.hdr.dime.dim(3))-1)*cast.hdr.dime.pixdim(3)) +cast.hdr.hist.qoffset_y ;
zgv = ((0:(cast.hdr.dime.dim(4))-1)*cast.hdr.dime.pixdim(4)) +cast.hdr.hist.qoffset_z ;
[X,Y,Z] = meshgrid(ygv,xgv,zgv);

% brain
castPatchFull = isosurface(X,Y,Z,squeeze(cast.img),0.5); 
castPatch     = reducepatch(castPatchFull,0.1);
stlwrite([handles.datapath handles.separator handles.animal '_castPatchFull.stl'], castPatchFull);
stlwrite([handles.datapath handles.separator handles.animal '_castPatch.stl'], castPatch);
% skull
zeroInd = max(find(zgv<2.0));
ct.img(:,:,1:zeroInd) = 0;
ct.img(find(cast.img>0.5)) = 0; % prevent overlapp of the two volumes
ctPatchFull = isosurface(X,Y,Z,squeeze(ct.img),handles.skullThresh); 
ctPatch     = reducepatch(ctPatchFull,0.2);

stlwrite([handles.datapath handles.separator handles.animal '_ctPatchFull.stl'], ctPatchFull);
stlwrite([handles.datapath handles.separator handles.animal '_ctPatch.stl'], ctPatch);

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
stlwrite([handles.datapath handles.separator handles.animal '_octPatch.stl'], octPatch);

% Progress view
d.Value = 0.8;
d.Message = 'Displaying ...';
pause(.5)

% Top View
cla(handles.axesTopView)
axes(handles.axesTopView);
hold off
p = patch(handles.axesTopView, castPatch);
set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
daspect([1 1 1])
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
p = patch(handles.axesTopView, octPatch);
set(p, 'FaceColor', [0.5 0.5 1], 'EdgeColor', 'none');
alpha(0.5)
view([0, 0, 1])

% Display Section
cla(handles.axesSkullandBrain)
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




% --- Executes on button press in pushbuttonPreview.
function pushbuttonPreview_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.datapath == 0
    warning = msgbox('Please specify a data folder first.');
    return
end

% Get O_q and Fp_q, percentage of I2N
O_q = str2double(get(handles.editO_q, 'String'));
Fp_q = str2double(get(handles.editFp_q, 'String'));
handles.O_q = O_q;
handles.Fp_q = Fp_q;

% Get inion and nasion input
inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;
inskullsurface = InskullSurface(handles.castPatchFull, inion, nasion, O_q, Fp_q);
I2N_data = inskullsurface.I2N.data;
N2N_data = inskullsurface.N2N.data;

% Display I2N and N2N
cla(handles.axesI2NandN2N)
axes(handles.axesI2NandN2N);
hold off
p = patch(handles.axesI2NandN2N, handles.castPatch);
alpha(0.5)
set(p, 'FaceColor', handles.bordercolor, 'EdgeColor', 'none');
daspect([1 1 1])
view([0 -1 0])
light('Position', [1 0 0], 'Style', 'infinite' )
camlight; lighting phong
hold on
plot3(I2N_data(1,:), I2N_data(2,:), I2N_data(3,:), 'Color', [0 1 0], 'LineWidth', 5);
plot3(N2N_data(1,:), N2N_data(2,:), N2N_data(3,:), 'Color', [1 0 0], 'LineWidth', 5);
hold off
guidata(hObject, handles);




% --- Executes on button press in pushbuttonImportPosition.
function pushbuttonImportPosition_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonImportPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check data folder
if handles.datapath == 0
    warning = msgbox('Please specify a data folder first.');
    return;
end

[filename, pathname] = uigetfile('*.*');
if isequal(filename,0) || isequal(pathname,0)
    disp('User canceled position file selection')
    return;
end


if filename(end-3:end) == '.xyz'
    locs = readlocs([pathname handles.separator filename], 'format', {'channum','X','Y','Z','labels'});
    for i = 1 : length(locs)
        x = locs(i).X;
        y = locs(i).Y;
        z = locs(i).Z;
        label = locs(i).labels;
        inskullelectrodes(i) = InskullElectrode(2, [x, y, z], label);
    end
elseif filename(end-4:end) == '.locs'
    locs = readlocs([pathname handles.separator filename]);
    for i = 1 : length(locs)
        x = locs(i).X;
        y = locs(i).Y;
        z = locs(i).Z;
        label = locs(i).labels;
        inskullelectrodes(i) = InskullElectrode(2, [x, y, z], label);
    end
elseif filename(end-3:end) == '.sph'
    locs = readlocs([pathname handles.separator filename]);
    for i = 1 : length(locs)
        x = locs(i).X;
        y = locs(i).Y;
        z = locs(i).Z;
        label = locs(i).labels;
        inskullelectrodes(i) = InskullElectrode(2, [x, y, z], label);
    end
else
    warning = msgbox('Wrong input type, please select a .sph, .xyz or .locs file.');
    return
end


bl = ' ';

% Save locations
addon = char(datetime);
addon = split(addon);
addon = addon{2};
addon = strrep(addon,':', '-');
fid = fopen([handles.datapath handles.separator 'location_' addon '.xyz'], 'w');
for i = 1 : length(inskullelectrodes)
    fprintf(fid, [num2str(i) bl num2str(inskullelectrodes(i).cartesian_eeglab(1)) bl num2str(inskullelectrodes(i).cartesian_eeglab(2)) bl num2str(inskullelectrodes(i).cartesian_eeglab(3)) bl inskullelectrodes(i).label '\n']);
end
fclose(fid);

fid = fopen([handles.datapath handles.separator 'location_' addon '.sph'], 'w');
for i = 1 : length(inskullelectrodes)
    fprintf(fid, [num2str(i) bl num2str(locs(i).sph_theta) bl num2str(locs(i).sph_phi) bl locs(i).labels '\n']);
end
fclose(fid);

% load locations
locs = readlocs([handles.datapath handles.separator 'location_' addon '.xyz'], 'format', {'channum','X','Y','Z','labels'});

% Show in EEGLab View
cla(handles.axesEEGLabView, 'reset')
axes(handles.axesEEGLabView);

topoplot([], locs, 'emarker', {'.','r',15,1}, 'hcolor', handles.bordercolor); % 'electrodes', 'labels', 
hold off
colormap('gray');
handles.inskullelectrodes = inskullelectrodes;
handles.Position_isloaded = 1;

guidata(hObject, handles);



% --- Executes on button press in pushbuttonImportLayout.
function pushbuttonImportLayout_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonImportLayout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Check data folder
if handles.datapath == 0
    warning = msgbox('Please specify a data folder first.');
    return;
end

[filename, pathname] = uigetfile('*.*');
if isequal(filename,0) || isequal(pathname,0)
    disp('User canceled layout file selection')
    return;
end
if filename(end-3:end) == '.txt'
    % Read from .txt
    tmp_qStrLst = readcell([pathname, filename]);
    count = 1;
    for i = 1 : length(tmp_qStrLst)
        if tmp_qStrLst{i,2} == 0
            continue
        end
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
else
    warning = msgbox('Wrong input type, please select a .txt file.');
    return
end

bl = ' ';

% Save locations
addon = char(datetime);
addon = split(addon);
addon = addon{2};
addon = strrep(addon,':', '-');
fid = fopen([handles.datapath handles.separator 'location_' addon '.xyz'], 'w');
for i = 1 : length(inskullelectrodes)
    fprintf(fid, [num2str(i) bl num2str(inskullelectrodes(i).cartesian_eeglab(1)) bl num2str(inskullelectrodes(i).cartesian_eeglab(2)) bl num2str(inskullelectrodes(i).cartesian_eeglab(3)) bl inskullelectrodes(i).label '\n']);
end
fclose(fid);

% load locations
locs = readlocs([handles.datapath handles.separator 'location_' addon '.xyz'], 'format', {'channum','X','Y','Z','labels'});

% Show in EEGLab View
cla(handles.axesEEGLabView, 'reset')
axes(handles.axesEEGLabView);
if length(locs) > 1
    topoplot([], locs, 'emarker', {'.','r',15,1}, 'hcolor', handles.bordercolor); % 'electrodes', 'labels', 
    hold off
    colormap('gray');
    handles.inskullelectrodes = inskullelectrodes;
else
    warning = msgbox('Invalid input, please change formatting.');
end
handles.Position_isloaded = 1;

guidata(hObject, handles);



% --- Executes on button press in pushbuttonFinalRun.
function pushbuttonFinalRun_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonFinalRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning = 0;

% Check data folder
if handles.datapath == 0
    warning = msgbox('Please specify a data folder first.');
    return;
end

% Check position file
if handles.Position_isloaded == 0
    warning = msgbox('Please load a position file first.');
    return;
end

% Progress view
f = uifigure;
d = uiprogressdlg(f,'Title','Please Wait',...
        'Message','Loading...');
d.Value = 0.2;
pause(.5)

% Get O_q and Fp_q, percentage of I2N
handles.O_q = str2double(get(handles.editO_q, 'String'));
handles.Fp_q = str2double(get(handles.editFp_q, 'String'));

% Get inion and nasion input
inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
inskullsurface = InskullSurface(handles.castPatchFull, inion, nasion, handles.O_q, handles.Fp_q);

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
    if skullelectrodes(i).quantity(2) > -handles.O_q/(handles.Fp_q-handles.O_q) || skullelectrodes(i).quantity(2) < (1-handles.O_q)/(handles.Fp_q-handles.O_q)
%     if(electrodes(i).use == 1)
%         plot3( skullelectrodes(i).pos(1), skullelectrodes(i).pos(2),skullelectrodes(i).pos(3) ,'ko','markerfacecolor','b','markersize',10);
%     end
        plot3( skullelectrodes(i).pos(1), skullelectrodes(i).pos(2),skullelectrodes(i).pos(3) ,'ko','markerfacecolor','r','markersize',10);
    end
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
    if skullelectrodes(i).quantity(2) > -handles.O_q/(handles.Fp_q-handles.O_q) || skullelectrodes(i).quantity(2) < (1-handles.O_q)/(handles.Fp_q-handles.O_q)
        plot3( tmp(1,:), tmp(2,:), tmp(3,:), 'Color', 'r', 'LineWidth', 2 ) 
        %tmp = octPatch.vertices(circlInd,:)';
        %plot3( tmp(1,:), tmp(2,:), tmp(3,:), 'ko', 'markerfacecolor', 'k', 'markersize', 1)
    else
        warning = 1;
    end
end

% Print out position data
writeElectrodes(skullelectrodes, handles.datapath, handles.O_q, handles.Fp_q);
% Pirnt default settings
% defaults_path = [handles.datapath handles.separator 'defaults.txt'];
% fid = fopen(defaults_path, 'w');
% if fid == -1
%     error('Author:Function:OpenFile', 'Cannot open file: %s', handles.datapath);
% end
% titleLine = 'skullThick inionX inionY inionZ nasionX nasionY nasionZ O_q Fp_q \n';
% fprintf(fid, titleLine);
% bl = ' ';
% defaultsLine = [num2str(handles.skullThick) bl num2str(inion(1)) bl num2str(inion(2)) bl num2str(inion(3)) bl num2str(nasion(1)) bl num2str(nasion(2)) bl num2str(nasion(3)) bl num2str(handles.O_q) bl num2str(handles.Fp_q) bl '\n'];
% fprintf(fid, defaultsLine);
% fclose(fid);

% Print SkullThickness
handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));
if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
skullThick_path = [handles.datapath handles.separator 'Setup_SkullThickness.txt'];
fid = fopen(skullThick_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', skullThick_path);
end
titleLine = 'SkullThickness \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = [num2str(handles.skullThick) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

% Pirnt inion and nasion
inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;
if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

% Print O_q and Fp_q
O_q = str2double(get(handles.editO_q, 'String'));
Fp_q = str2double(get(handles.editFp_q, 'String'));
handles.O_q = O_q;
handles.Fp_q = Fp_q;
if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
O_qFp_q_path = [handles.datapath handles.separator 'Setup_O_qFp_q.txt'];
fid = fopen(O_qFp_q_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', O_qFp_q_path);
end
titleLine = 'Name Percentage \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['O_q' bl num2str(handles.O_q) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['Fp_q' bl num2str(handles.Fp_q) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

% warning
if warning == 1
    f = msgbox('Invalid input, please change formatting.');
end


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
inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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

inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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

inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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

inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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

inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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

inion = [str2double(get(handles.editInionX, 'String')), str2double(get(handles.editInionY, 'String')), str2double(get(handles.editInionZ, 'String'))];
nasion = [str2double(get(handles.editNasionX, 'String')), str2double(get(handles.editNasionY, 'String')), str2double(get(handles.editNasionZ, 'String'))];
handles.inion = inion;
handles.nasion = nasion;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
LandMarks_path = [handles.datapath handles.separator 'Setup_LandMarks.txt'];
fid = fopen(LandMarks_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', LandMarks_path);
end
titleLine = 'Name X Y Z \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['inion' bl num2str(handles.inion(1)) bl num2str(handles.inion(2)) bl num2str(handles.inion(3)) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['nasion' bl num2str(handles.nasion(1)) bl num2str(handles.nasion(2)) bl num2str(handles.nasion(3)) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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
handles.skullThick = str2double(get(handles.editSkullThickness, 'String'));

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
skullThick_path = [handles.datapath handles.separator 'Setup_SkullThickness.txt'];
fid = fopen(skullThick_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', skullThick_path);
end
titleLine = 'SkullThickness \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = [num2str(handles.skullThick) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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
O_q = str2double(get(handles.editO_q, 'String'));
Fp_q = str2double(get(handles.editFp_q, 'String'));
handles.O_q = O_q;
handles.Fp_q = Fp_q;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
O_qFp_q_path = [handles.datapath handles.separator 'Setup_O_qFp_q.txt'];
fid = fopen(O_qFp_q_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', O_qFp_q_path);
end
titleLine = 'Name Percentage \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['O_q' bl num2str(handles.O_q) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['Fp_q' bl num2str(handles.Fp_q) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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
O_q = str2double(get(handles.editO_q, 'String'));
Fp_q = str2double(get(handles.editFp_q, 'String'));
handles.O_q = O_q;
handles.Fp_q = Fp_q;

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
O_qFp_q_path = [handles.datapath handles.separator 'Setup_O_qFp_q.txt'];
fid = fopen(O_qFp_q_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', O_qFp_q_path);
end
titleLine = 'Name Percentage \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = ['O_q' bl num2str(handles.O_q) bl '\n'];
fprintf(fid, defaultsLine);
defaultsLine = ['Fp_q' bl num2str(handles.Fp_q) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);


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



function editSkullThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to editSkullThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editSkullThreshold as text
%        str2double(get(hObject,'String')) returns contents of editSkullThreshold as a double

handles.skullThresh = str2double(get(handles.editSkullThreshold, 'String'));

if isequal(handles.datapath,0)
    disp('Please specify a data folder first.')
    return;
end
skullThresh_path = [handles.datapath handles.separator 'Setup_SkullThresh.txt'];
fid = fopen(skullThresh_path, 'w');
if fid == -1
    error('Author:Function:OpenFile', 'Cannot open file: %s', skullThresh_path);
end
titleLine = 'SkullThreshold \n';
fprintf(fid, titleLine);
bl = ' ';
defaultsLine = [num2str(handles.skullThresh) bl '\n'];
fprintf(fid, defaultsLine);
fclose(fid);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editSkullThreshold_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editSkullThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
