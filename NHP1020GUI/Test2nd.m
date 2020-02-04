% % Read List
% loadMethod = 1; % 1 load from list, 2 input list: tmp_qStrLst = get(handles.Settings,'Data');
% [filename, pathname] = uigetfile('*.txt', 'Select a txt file');
% tmp_qStrLst = readcell([pathname, filename]);
% Nslices = size(tmp_qStrLst,1);
% qStrLst = cell(Nslices, 2);
% for i = 1 : Nslices
%     qStrLst{i,1} = num2str(tmp_qStrLst{i,1});
%     qStrLst{i,2} = num2str(tmp_qStrLst{i,2});
% end
% 
% tmp_qStrLst = qStrLst;
% Nslices = Nslices;
% % output: tmp_qStrLst


addpath(genpath('toolbox'));

a = InskullElectrode(1, [0, 0], 'a');
b = InskullElectrode(1, [pi/2, 0], 'b');
c = InskullElectrode(1, [0, pi/2], 'c');
[a_x, a_y, a_z] = sph2cart(0,0,1);
[b_x, b_y, b_z] = sph2cart(pi/2,0,1);
[c_x, c_y, c_z] = sph2cart(0,pi/2,1);
figure(1)
scatter3([a_x, b_x, c_x], [a_y, b_y, c_y], [a_z, b_z, c_z],200, 'filled', 'MarkerFaceColor','r');
xlabel('x')
ylabel('y')
zlabel('z')
text([a_x, b_x, c_x], [a_y, b_y, c_y], [a_z, b_z, c_z],{'a';'b';'c'})

%

figure(2)
a_cartesian_eeglab = a.sph_NHP2cartesian_eeglab;
b_cartesian_eeglab = b.sph_NHP2cartesian_eeglab;
c_cartesian_eeglab = c.sph_NHP2cartesian_eeglab;

cartesian_eeglab_x = [a_cartesian_eeglab(1), b_cartesian_eeglab(1), c_cartesian_eeglab(1)];
cartesian_eeglab_y = [a_cartesian_eeglab(2), b_cartesian_eeglab(2), c_cartesian_eeglab(2)];
cartesian_eeglab_z = [a_cartesian_eeglab(3), b_cartesian_eeglab(3), c_cartesian_eeglab(3)];

figure(2)
scatter3(cartesian_eeglab_x, cartesian_eeglab_y, cartesian_eeglab_z,200, 'filled', 'MarkerFaceColor','r');
xlabel('x')
ylabel('y')
zlabel('z')
text(cartesian_eeglab_x, cartesian_eeglab_y, cartesian_eeglab_z,{'a';'b';'c'})


% Save locations
[file,path] = uiputfile('location.xyz');

bl = ' ';

fid = fopen([path file], 'w');
for i = 1 : length(cartesian_eeglab_x)
    fprintf(fid, [num2str(i) bl num2str(cartesian_eeglab_x(i)) bl num2str(cartesian_eeglab_y(i)) bl num2str(cartesian_eeglab_z(i)) bl num2str(i) '\n']);
end
fclose(fid);

locs = readlocs([path file], 'format', {'channum','X','Y','Z','labels'});
%
figure(3)
topoplot([],locs, 'electrodes','labels','drawaxis','on');

%========================================================= show brain image
addpath(genpath('~/Desktop/TeichertLab/toolbox'))
baseDir = '~/Desktop/TeichertLab/';
path    = 'data/stereotax_coordinate_frame/';
animal = 'jessesym';
ct   = load_nii( [baseDir, path, animal '/' animal, '_CT_skull_filt.nii.gz']  );
cast = load_nii( [baseDir, path, animal '/' animal, '_inskull_mask_filt.nii.gz'] );
% ============================
inion      = [-21.5,0,6.5];   % Jesse
nasion     = [50.0,0,22.0];   % Jesse
O_q  = 0.10;
Fp_q = 0.95;
% ============================

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
skullThick = 2.5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
valInd            = find( minDist(:,1)>skullThick );
invInd            = zeros(length(ctPatch.vertices),1 );
invInd(valInd)    = 1:length(valInd);

octPatch.vertices = ctPatch.vertices(valInd,:);
valPatch          = zeros(length(ctPatchFull.faces),1);
pi                = 0;
for i = 1:length(ctPatch.faces)
    if ismember( ctPatch.faces(i,1), valInd ) && ismember( ctPatch.faces(i,2), valInd ) && ismember( ctPatch.faces(i,3), valInd )  
        valPatch(i) = 1;
        %pi = pi + 1;
        %octPatch.faces(pi) = invInd(ctPatch.faces(i,:));

    end
end
octPatch.faces = invInd(ctPatch.faces(find(valPatch),:)); 

% figure(4)
% hold off
% p = patch(castPatch);
% set(p, 'FaceColor', [1.0 0.1 0.1], 'EdgeColor', 'none');
% daspect([1 1 1])
% view(2)
% light('Position', [1 0 0], 'Style', 'infinite' )
% camlight; lighting phong
% xlabel('x');
% ylabel('y');
% zlabel('z');
% % mideline cut
% midlineCutTmp = intersectPlaneSurf(castPatchFull, [0,0,0], [0,1,0]);
% midlineCut    = midlineCutTmp{1};
% 
% hold on
% plot3( midlineCut(1,:), midlineCut(2,:), midlineCut(3,:), 'Color', [1 0 0], 'LineWidth', 2 ) 


inskullsurface = InskullSurface(castPatchFull, inion, nasion, O_q, Fp_q);
a_position = a.getinskullPosition(inskullsurface);
b_position = b.getinskullPosition(inskullsurface);
c_position = c.getinskullPosition(inskullsurface);
inskullelectrodes(1) = a;
inskullelectrodes(2) = b;
inskullelectrodes(3) = c;

skullelectrodes = getskullelectrodes(inskullelectrodes, inskullsurface, castPatchFull, octPatch);

path = pwd;

writeElectrodes(skullelectrodes, path);

