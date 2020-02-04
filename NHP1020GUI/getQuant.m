function [ind] = getQuant(q, dist)
    tmp = dist; %/max(dist);
    % find the largest index of the points on the beam that is smaller than the given distance
    ind = max( find(tmp<q) );
end