function dist = dist( p,q, metric)
if( nargin<3 || isempty(metric) )
    metric=0;
end
switch metric
    case {0,'euclidean'}
        dist = sqrt(distEucSq( p, q ));
    case 'sqchord'
        dist = sqchord_dist( p, q );
    case 'canberra'
        dist = canb_dist( p,q );
    case 'extendedcanberra'
        dist = extended_canb_dist( p, q );
    case 'chisq'
        dist = chisq_dist( p,q  );
    otherwise
        error(['distance - unknown metric: ' metric]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dist = canb_dist(p,q)
dist = sum((abs(p - q))./ (abs(p) + abs(q)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dist = chisq_dist(p,q)
dist = sum(((p-q).^2)/(p+q));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dist = extended_canb_dist(p,q)
%u_p=mean(p)            % mean of p vector
%u_q=mena(q)            % mean of q vector
dist = sum((abs(p - q))./ ((abs(p)+mean(p)) + (abs(q)+mean(q))));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dist = sqchord_dist(p,q)
dist = sum((sqrt(p) - sqrt(q)).^2);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dist = distEucSq( X, Y )
m = size(X,1); n = size(Y,1);
%Yt = Y';
XX = sum(X.*X,2);
YY = sum(Y'.*Y',1);
dist = XX(:,ones(1,n)) + YY(ones(1,m),:) - 2*X*Y';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
