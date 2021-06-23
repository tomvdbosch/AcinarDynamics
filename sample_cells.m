function [clone_sizes, acini_sizes] = sample_cells(fission_acini, sizein2D, acinisize)

n_acini = size(fission_acini,2);
clone_sizes = zeros(n_acini,1);
acini_sizes = zeros(n_acini,1);

sizes_2D = datasample(sizein2D, n_acini,1);

for n=1:n_acini
    acinus = fission_acini(:,n);
    n2d = sizes_2D(n);
    if n2d < acinisize
        acinus = acinus(randperm(acinisize, n2d));
    end
    clone_sizes(n) = sum(acinus);
    acini_sizes(n) = length(acinus);
end


