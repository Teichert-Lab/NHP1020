classdef InskullSurface
    
    properties (SetAccess = private)
        % Required input
        castPatchFull % inskull brain scan image (stl)
        inion
        nasion
        O_q
        Fp_q

        % Processed data
        midlineCut % inion to nasion
        % I2N.data = beams(1).dat 
        I2N
        N2N
        
    end
    
    methods
        % Construction methods
        function obj = InskullSurface(castPatchFull, inion, nasion, O_q, Fp_q)
            % Required input
            obj.castPatchFull = castPatchFull;
            obj.inion = inion;
            obj.nasion = nasion;
            obj.O_q = O_q;
            obj.Fp_q = Fp_q;
            
            % Processed data
            obj.midlineCut = obj.getmidlineCut;
            obj.I2N = obj.getI2N(inion, nasion);
            obj.N2N = obj.getN2N(O_q, Fp_q);
        end
        
        function midlineCut = getmidlineCut(obj)
            midlineCutTmp = intersectPlaneSurf(obj.castPatchFull, [0,0,0], [0,1,0]);
            midlineCut    = midlineCutTmp{1};
            % To show the midlineCut, use code below
            % plot3( midlineCut(1,:), midlineCut(2,:), midlineCut(3,:), 'Color', [1 0 0], 'LineWidth', 2 ) 
        end
        
        function I2N = getI2N(obj, inion, nasion)
            inionMat  = [ inion(1)*ones(size(obj.midlineCut,2),1),  inion(2)*ones(size(obj.midlineCut,2),1),  inion(3)*ones(size(obj.midlineCut,2),1)]';
            nasionMat = [nasion(1)*ones(size(obj.midlineCut,2),1), nasion(2)*ones(size(obj.midlineCut,2),1), nasion(3)*ones(size(obj.midlineCut,2),1)]';
            
            tmpI = obj.midlineCut - inionMat;
            tmpN = obj.midlineCut - nasionMat;
            
            dstI = sum( tmpI .* tmpI, 1 );
            dstN = sum( tmpN .* tmpN, 1 );
            
            inionIndex  =  find( dstI == min(dstI) ); % inion index on the midlineCut
            nasionIndex  =  find( dstN == min(dstN) ); % nasion index on the midlineCut
            
            tmp_data = [obj.midlineCut(:,inionIndex:end) obj.midlineCut(:,1:nasionIndex)];
            tmp_dist = sqrt(diff( tmp_data(1,:) ).^2  +  diff( tmp_data(3,:) ).^2);
        
            I2N.data = tmp_data;
            I2N.dist = cumsum([0 tmp_dist]);
        end
        
        function N2N = getN2N(obj, O_q, Fp_q)
            O_index_on_I2N = getQuant(O_q, obj.I2N.dist/max(obj.I2N.dist));
            O_position = obj.I2N.data(:,O_index_on_I2N);
            
            Fp_index_on_I2N = getQuant(Fp_q, obj.I2N.dist/max(obj.I2N.dist));
            Fp_position = obj.I2N.data(:,Fp_index_on_I2N);
            
            tmp = O_position - Fp_position;
            N   = [tmp(3), 0 -tmp(1)];
            N   = N/sqrt(sum(N.*N)); 
            
            N2NCutTmp = intersectPlaneSurf(obj.castPatchFull, Fp_position, N);
            N2NCut    = N2NCutTmp{1};
            
            Fp_index_on_N2N    = find(N2NCut(2,:)==0 & N2NCut(1,:)>0 );
            
            tmp_data = [N2NCut(:,Fp_index_on_N2N :end), N2NCut(:,1:Fp_index_on_N2N )];
            if tmp_data(2,5) < 0 % make sure the N2N is traveling counter-clockwise looking down
                tmp_data = tmp_data(:,end:-1:1);
            end
            
            tmp_dist = sqrt(diff(tmp_data(1,:) ).^2 +  diff( tmp_data(2,:) ).^2 +  diff( tmp_data(3,:) ).^2);
            
            N2N.data = tmp_data;
            N2N.dist = cumsum([0 tmp_dist]);
            
        end
    end
end