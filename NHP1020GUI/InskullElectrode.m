classdef InskullElectrode
    
    properties (SetAccess = private)
        % Required data
        sph_NHP % 1 [az, el] in degrees
        cartesian_eeglab % 2 [x, y, z]
        sph_eeglab % 3
        quantity % 4 [I2N, mid2ear]
        cartesian_NHP
        label
        
        % Processed data
        pos
        mlDist
        apDist
    end
    
    methods
        % Construction methods
        function obj = InskullElectrode(INPUTTYPE, input, label)
            if nargin >= 2
                % Input non-human primates' sphere coordinates in degree
                if INPUTTYPE == 1
                    obj.sph_NHP = input;
                    obj.cartesian_eeglab = obj.sph_NHP2cartesian_eeglab;
                    obj.sph_eeglab = obj.sph_NHP2sph_eeglab;
                    obj.quantity = obj.sph_NHP2quantity;
                % Input eeglab cartesian coordinates
                elseif INPUTTYPE == 2
                    obj.cartesian_eeglab = input;
                    obj.sph_NHP = obj.cartesian_eeglab2sph_NHP;
                    obj.sph_eeglab = obj.sph_NHP2sph_eeglab;
                    obj.quantity = obj. sph_NHP2quantity;
                    obj.cartesian_NHP = obj.sph_NHP2cartesian_NHP;
                else
                    error('Unknown input type!')
                end
            else
                error('Required number of input arguments is 2. Now is %d', nargin)
            end
            if nargin == 3
                obj.label = label;
            end
        end
        
        % Transfer from non-human primate sphere coordinates into quantity format 
        function quantity = sph_NHP2quantity(obj)
            % In degrees
            az = obj.sph_NHP(1);
            el = obj.sph_NHP(2);
            
            % % of quarter latitude, % of longitude
            electrode_q = abs(az / 90);
            slice_q = (90-el) / 180;
            quantity = [electrode_q, slice_q];
        end
        
        % Transfer from non-human primate sphere coordinates into  NHP
        % cartesian coordinates
        function cartesian_NHP = sph_NHP2cartesian_NHP(obj)
            % In radians
            az = obj.sph_NHP(1) * 2 * pi / 360;
            el = obj.sph_NHP(2) * 2 * pi / 360;
            % NHP Cartesian
            [x, y, z] = sph2cart(az, el, 1);
            cartesian_NHP = [x, y, z];
        end
        
        % Transfer from non-human primate sphere coordinates into  eeglab
        % cartesian coordinates
        function cartesian_eeglab = sph_NHP2cartesian_eeglab(obj)
            % In radians
            az = obj.sph_NHP(1) * 2 * pi / 360;
            el = obj.sph_NHP(2) * 2 * pi / 360;
            % NHP Cartesian
            [x, y, z] = sph2cart(az, el, 1);
            % Rotate coordinates around y-axis by -90 degree in order to
            % get the cartesian representation in eeglab
            Ry = roty(-90);
            new = Ry * [x; y; z];
            x_new = round(new(1,:),3);
            y_new = round(new(2,:),3);
            z_new = round(new(3,:),3);
            cartesian_eeglab = [x_new, y_new, z_new];
        end
        
        % Transfer from eeglab cartesian into non-human primates sphere
        % coordinates
        function sph_NHP = cartesian_eeglab2sph_NHP(obj)
            x = obj.cartesian_eeglab(1);
            y = obj.cartesian_eeglab(2);
            z = obj.cartesian_eeglab(3);
            cartesian_NHP = roty(90) * [x; y; z];
            x_NHP = round(cartesian_NHP(1,:),3);
            y_NHP = round(cartesian_NHP(2,:),3);
            z_NHP = round(cartesian_NHP(3,:),3);
            % In radians
            [az_NHP, el_NHP, r] = cart2sph(x_NHP, y_NHP, z_NHP);
            % In degrees
            az_NHP = az_NHP * (360 / (2 * pi));
            if round(az_NHP) == 180
                az_NHP = az_NHP - 180;
            end
            if round(az_NHP) == -180
                az_NHP = az_NHP + 180;
            end
            el_NHP = el_NHP * (360 / (2 * pi));
            sph_NHP = [az_NHP, el_NHP];
        end
        
        % Transfer from non-human primate sphere coordinates into  eeglab
        % sphere coordinates
        function sph_eeglab = sph_NHP2sph_eeglab(obj)
            % First, transfer into cartesian eeglab
            cartesian_eeglab = obj.sph_NHP2cartesian_eeglab;
            x= cartesian_eeglab(1);
            y = cartesian_eeglab(2);
            z = cartesian_eeglab(3);
            % Second, transfer into sphere ([az, el]), in radians
            [az, el, r] = cart2sph(x, y, z);
            % In degrees
            az = az * (360 / (2 * pi));
            el = el * (360 / (2 * pi));
            
            sph_eeglab = [az, el];
        end
        
        % Check input format
        function obj = set.sph_NHP(obj, sph_NHP)
            if isnumeric(sph_NHP) && ndims(sph_NHP) == 2 && ...
                    size(sph_NHP, 1) == 1 && size(sph_NHP, 2) == 2 
                obj.sph_NHP = sph_NHP;
            else
                error('Invaild quantity, please input quantity as [number1, number2], number1: % on the slice')
            end
        end
        
        % Get inskullPosition from [az, el] in Non-human primates' sphere coordinates: sph_NHP2inskullPosition
        function obj = getinskullPosition(obj, InskullSurface)
            % el
            % apDsit
            I2N = InskullSurface.I2N;
            cpc_M = max(I2N.dist);
            tmpQ = InskullSurface.O_q + obj.quantity(2) * (InskullSurface.Fp_q-InskullSurface.O_q);
            I2Nindex = getQuant(tmpQ, I2N.dist/cpc_M); % el = obj.quantity(2)
            I2Nposition = I2N.data(:, I2Nindex);
            apDist = obj.quantity(2) * (InskullSurface.Fp_q-InskullSurface.O_q) * cpc_M;
            
            % mlDist
            % if on midline
            if obj.quantity(1) == 0
                inskullPosition = I2Nposition;
                mlDist = 0;
                
            % if not on midline
            else
                N2N = InskullSurface.N2N;
                % slice's left point on N2N
                tmpQ = (1-obj.quantity(2))/2;
                N2Nindex_l = getQuant(tmpQ, N2N.dist/max(N2N.dist)); % 1/2: 1/2 of N2N
                N2Nposition_l = N2N.data(:, N2Nindex_l);
                % slice's right point on N2N
                tmpQ = 1-((1-obj.quantity(2))/2);
                N2Nindex_r = getQuant(tmpQ, N2N.dist/max(N2N.dist)); % 1/2: 1/2 of N2N
                N2Nposition_r = N2N.data(:, N2Nindex_r);

                P2 = N2Nposition_l - I2Nposition;
                P3 = N2Nposition_r - I2Nposition;

                N   = cross(P2,P3);
                N   = N/sqrt(sum(N.*N)); 

                cutTmp = intersectPlaneSurf(InskullSurface.castPatchFull, I2Nposition, N);
                sliceCut = cutTmp{1};

                % az
                % slice's top point which is on midline
                topInd = find(sliceCut(2,:)==0 & sliceCut(3,:)>0.7*max(sliceCut(3,:)) );

                slcL = [sliceCut(:,topInd:end),sliceCut(:,1:topInd)];
                if slcL(2,5) < 0 
                   slcL = slcL(:,end:-1:1);
                end 
                slcR  = slcL(:,end:-1:1);

                distL = sqrt(diff( slcL(1,:) ).^2 +  diff( slcL(2,:) ).^2 +  diff( slcL(3,:) ).^2);
                distR = sqrt(diff( slcR(1,:) ).^2 +  diff( slcR(2,:) ).^2 +  diff( slcR(3,:) ).^2);

                % distance matrix
                slice_Ldist = cumsum( [0 distL] );
                slice_Rdist = cumsum( [0 distR] );

                tmpL  = [N2Nposition_l(1)*ones(size(slcL,2),1), ...
                         N2Nposition_l(2)*ones(size(slcL,2),1),  ...
                         N2Nposition_l(3)*ones(size(slcL,2),1)]';
                tmpR  = [N2Nposition_r(1)*ones(size(slcR,2),1), ...
                         N2Nposition_r(2)*ones(size(slcR,2),1),  ...
                         N2Nposition_r(3)*ones(size(slcR,2),1)]';

                tmpLL = slcL - tmpL;
                tmpRR = slcR - tmpR;

                dstL = sum( tmpLL .* tmpLL, 1 );
                dstR = sum( tmpRR .* tmpRR, 1 );

                cpc_ind_L = find(dstL == min(dstL) );
                cpc_ind_R = find(dstR == min(dstR) );

                cpc_L     = slice_Ldist(cpc_ind_L); % this is the 100% distance
                cpc_R     = slice_Rdist(cpc_ind_R);
                % Get position
                if obj.sph_NHP(1) > 0

                    % Left
                    index_on_slice = getQuant(obj.quantity(1), slice_Ldist/cpc_L);
                    position = slcL(:, index_on_slice);
                    mlDist = obj.quantity(1) * cpc_L;

                else

                    % Right
                    index_on_slice = getQuant(obj.quantity(1), slice_Rdist/cpc_R);
                    position = slcR(:, index_on_slice);
                    mlDist = obj.quantity(1) * cpc_R;

                end

                inskullPosition = position; % [x; y; z]
            end
            obj.pos = inskullPosition;
            obj.apDist = apDist;
            obj.mlDist = mlDist;
        end
        
    end
end



