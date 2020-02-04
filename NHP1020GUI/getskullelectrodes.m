function skullelectrodes = getskullelectrodes(inskullelectrodes, inskullsurface, castPatchFull, octPatch)
    for i = 1 : length(inskullelectrodes)
        % Get the inskull position
        inskullelectrodes(i) = inskullelectrodes(i).getinskullPosition(inskullsurface);
        skullelectrodes(i).name = inskullelectrodes(i).label;
        skullelectrodes(i).pos = inskullelectrodes(i).pos;
        skullelectrodes(i).mlDist = inskullelectrodes(i).mlDist;
        skullelectrodes(i).apDist = inskullelectrodes(i).apDist;
           
        % the plane fitting routine 
        pos = inskullelectrodes(i).pos;
        posMat  = [pos(1) * ones(size(castPatchFull.vertices,1),1),...
                   pos(2) * ones(size(castPatchFull.vertices,1),1),...
                   pos(3) * ones(size(castPatchFull.vertices,1),1)]';
        tmpP     = castPatchFull.vertices' - posMat;
        dstP     = sqrt(sum( tmpP .* tmpP, 1 ));
        circlInd = find(dstP<5);
        x        = fitNormal( castPatchFull.vertices(circlInd,:));
        x = x * sign(x(3));
        if pos(2) > 15
           x = x * sign(x(2)); 
        end

        if pos(2) < -15
           x = x * -1*sign(x(2)); 
        end

        if abs(pos(2))<2  % x 
           x(2) = 0;
           x = x/sqrt(sum(x.*x));
        end
        skullelectrodes(i).normal = x;
        
        % find the closet point on skull
        posMat  = [pos(1) * ones(size(octPatch.vertices,1),1),...
                   pos(2) * ones(size(octPatch.vertices,1),1),...
                   pos(3) * ones(size(octPatch.vertices,1),1)]';     
        tmpP     = octPatch.vertices' - posMat;
        dstP     = sqrt(sum( tmpP .* tmpP, 1 ));

        skull = octPatch.vertices( find(dstP==min(dstP)),: )';
        if size(skull,2)>1       % in the case of more than one closest point
           skull = mean(skull,2);% take the average 
        end

        if abs(pos(2))==0 % keep the midline electrodes on the midline no matter what
           skull(2) = 0;
        end
        skullelectrodes(i).skull = skull;
        
        % the plane fitting routine for the skull surface 
        pos = skull;
        posMat  = [pos(1) * ones(size(octPatch.vertices,1),1),...
                   pos(2) * ones(size(octPatch.vertices,1),1),...
                   pos(3) * ones(size(octPatch.vertices,1),1)]';     
        tmpP     = octPatch.vertices' - posMat;
        dstP     = sqrt(sum( tmpP .* tmpP, 1 ));
        circlInd = find(dstP<5);
        x        = fitNormal( octPatch.vertices(circlInd,:));
        x = x * sign(x(3));
        if pos(2) > 15
           x = x * sign(x(2)); 
        end

        if pos(2) < -15
           x = x * -1*sign(x(2)); 
        end

        if abs(pos(2))<2  % x 
           x(2) = 0;
           x = x/sqrt(sum(x.*x));
        end
        skullelectrodes(i).normalSkull = x;

     end

end