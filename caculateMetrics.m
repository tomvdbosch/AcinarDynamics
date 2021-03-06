%% Copyright (c) 2021 Tom van den Bosch
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

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