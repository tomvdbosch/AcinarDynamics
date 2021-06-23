function [n_WP, acini_per_clone, Percentage_YFP, n_clones, clone_size] = caculateMetrics(acini_sizes, YFP_sizes, clone_ids, acinisize, n_acini, sizein2D)


n_WP = sum(acini_sizes==YFP_sizes)/(n_acini*acinisize/sizein2D)*10000; % Number of Wholly Populated (WP) acini per 10.000 cells

clones = unique(clone_ids);
nclones = length(clones);
acini_per_clone = zeros(nclones,1);
for n=1:nclones
    ids = clone_ids == clones(n);
    acini_per_clone(n) = sum(acini_sizes(ids)>0);
end
acini_per_clone = acini_per_clone(acini_per_clone>0);
clone_size = sum(acini_sizes)/sum(acini_per_clone>0);
n_clones = sum(acini_per_clone > 0)/(n_acini*acinisize/sizein2D)*10000;
acini_per_clone = mean(acini_per_clone);


Percentage_YFP = sum(acini_sizes)/(n_acini*acinisize/sizein2D);