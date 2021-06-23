function acinus = acinus_turnover(acinus, t_start, t_end, ndividing, lambda, acinisize)

% start with acinus at time t_start, simulate over time until t_end
% acinus is a vector of length acinisize containing zeros and ones

t_cur = t_start;

while t_cur < t_end
    t_cur = t_cur + exprnd(1/(ndividing*lambda));
    r1 = randi(acinisize);
    r2 = randi(ndividing);
    acinus(r1) = acinus(r2);
end

