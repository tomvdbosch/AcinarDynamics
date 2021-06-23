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


