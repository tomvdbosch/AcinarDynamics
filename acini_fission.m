function [final_acini, clone_ids] = acini_fission(turnover_acini,kappa, t_end)



positive_acini = sum(turnover_acini)>0;
final_acini = turnover_acini(:, positive_acini);

n_positive = sum(positive_acini);
clone_ids = 1:n_positive;


% fission
nfissions = ceil(length(clone_ids)*t_end*kappa);
if nfissions >0
    fissionids = randi(n_positive, nfissions, 2);
end
    for i=1:nfissions
        r1 = fissionids(i,1);
        r2 = fissionids(i,2);
        final_acini(:,r1) = final_acini(:,r2);
        clone_ids(r1) = clone_ids(r2);
    end
end

