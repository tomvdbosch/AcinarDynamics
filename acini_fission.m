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

