%% Script to simulate dynamics of the acinar pancreas by nonhierarchical homogeneous population

% Input parameters
% Parameter         Desription                                          Values
% lambda            Cell turnover rate (1/days)                         [0,Inf] double
% kappa             Acinus fission rate (1/days)                        [0,Inf] double
% acinisize         Number of cells per acinus                          [1,Inf) integer
% ndividing         Number of clonogenic cells per acinus               [1,acinisize] integer
% t_end             Time to simulate (date)                             [1, Inf) numeric
% mu                Mutation probability of CA30                        [0,1]
% nacini            Number of acini to simulate                         [1,Inf) Integer
% sizein2D          Experimentally found number of cells per acinus     [Nx1] vector of positive integers

% Output parameters
% Parameter         Desription                                          Values
% n_WP              Number of Wholly Populated acini per 10.000 cells   Nonnegative double
% acini_per_clone   Mean number of acini per EYFP+ clone                Nonnegative double      
% Percentage_YFP    Percentage of EYFP+ cells                           [0,1] double
% n_clones          Number of EYFP+ clones per 10.000 cells             Nonnegative double
% clone_size        Mean number of cells in EYFP+ clone                 Nonnegative double    

% example values
lambda = 0.0445657;
t_end = 800;
acinisize = 15;
ndividing = 15;
mu = 1.17*10^-4;
kappa = 7.6923*10^-4;
nacini = 5*10^6;
sizein2D = [1 2 3 4 5 6 7 8 9 10 11];

% First, simulate turnover
turnover_acini = acini_turnover(nacini, lambda, mu, ndividing, acinisize, t_end);

% Second, simulate fission
[fission_acini, clone_ids] = acini_fission(turnover_acini,kappa, t_end);

% Third, sampling to convert 3D acini to 2D
[YFP_sizes, acini_sizes] = sample_cells(fission_acini, sizein2D, acinisize);

% Last, calculate metrics
[n_WP, acini_per_clone, Percentage_YFP, n_clones, clone_size] = caculateMetrics(acini_sizes, YFP_sizes, clone_ids, acinisize, nacini, mean(sizein2D));


