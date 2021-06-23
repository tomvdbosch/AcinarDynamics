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

function final_acini = acini_turnover(nacini, lambda, mu, ndividing, acinisize, t_end)


final_acini = zeros(acinisize, nacini);

YFPhits = exprnd(1/(lambda*mu*ndividing), nacini, 1); % we disregard any acinus that has no YFP hit
for n=1:nacini
    if YFPhits(n) < max(t_end)
        acinus = zeros(acinisize,1);
        if rand < 0.5 % 50/50 mother or daughter gets hit
            acinus(randi(acinisize)) = 1;
        else
            acinus(randi(ndividing)) = 1;
        end
        t_cur = YFPhits(n);
        if t_cur < t_end
            acinus = acinus_turnover(acinus, t_cur, t_end, ndividing, lambda, acinisize);
            final_acini(:, n) = acinus;
        end
        disp(n)
    end
end


