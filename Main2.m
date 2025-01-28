%% Problem 2 Channel coding_Binary Asymmetric Channel (BAC)
clear
% Define channel parameters
e0 = 0.1;  % Probability of flipping 0 to 1
e1 = 0.3;  % Probability of flipping 1 to 0


p_tran = [1 - e0, e0; e1, 1 - e1];
% Constructed channel transition matrix (above)

% Below are the optimization parameters for BAC whic will be changed
% manually to evaluate further
delta = 0.00001;  % input distribution (this should be optimized as given in template) 
max_iterations = 100;
tolerance = 1e-6; 

% Initial probability input distribution
px = [0.5, 0.5];  % input distribution (this should be optimized as asked in term project)

% Iterative optimization for BAC
for iter = 1:max_iterations

    % We are now computing output distribution
    py = px * p_tran;

    % We now compute the mutual information
    mutual_info = 0;
    for x = 0:1
        for y = 0:1
            x_ind = x + 1;
            y_ind = y + 1;

            if p_tran(x_ind, y_ind) > 0
                mutual_info = mutual_info + px(x_ind) * p_tran(x_ind, y_ind) * log2(p_tran(x_ind, y_ind) / py(y_ind));
            end
        end
    end

    
    fprintf('Binary Asymmetric Channel - Iteration %d, Mutual Information: %f\n', iter, mutual_info);

    % Update input distribution (gradient ascent)
    gradient = zeros(size(px));
    for x = 0:1
        for y = 0:1
            x_ind = x + 1;
            y_ind = y + 1;

            if p_tran(x_ind, y_ind) > 0
                gradient(x_ind) = gradient(x_ind) + p_tran(x_ind, y_ind) / py(y_ind);
            end
        end
    end

    % Normalize the gradient
    gradient = gradient / sum(gradient);

    % Update input distribution using a small step size (delta)
    px = px + delta * gradient;

    % Check for convergence
    if sum(abs(gradient)) < tolerance
        fprintf('Binary Asymmetric Channel - Converged after %d iterations!\n', iter);
        break;
    end
end

fprintf('Binary Asymmetric Channel - Final Optimized Input Distribution:\n');
disp(px);
fprintf('Binary Asymmetric Channel - Final Mutual Information: %f\n', mutual_info);

%% Gaussian Channel

% We choose the given channel parameters
mean = 0;
variance = 1;

% The input distribution
x_gaussian = -4:1:4;  % Finite set of input values
px_gaussian = normpdf(x_gaussian, mean, variance);  % Gaussian input distribution

% Check for convergence
if sum(px_gaussian) ~= 1
    px_gaussian = px_gaussian / sum(px_gaussian);  % Normalize the distribution
end

fprintf(' check here----Gaussian Channel - Initial Input Distribution:\n');
disp(px_gaussian);

% Optimization parameters for Gaussian Channel
delta_gaussian = 0.01;  
max_iterations_gaussian = 100; 
tolerance_gaussian = 1e-6;  

% Iterative optimization for Gaussian Channel
for iter = 1:max_iterations_gaussian

    %The used formula for calculating the capacity
   capacity_gaussian = 0.5 * log2(1 + variance); 

    % Placeholder for gradient calculation
    gradient_gaussian = -((x_gaussian - mean) / variance) .* px_gaussian;  % Correct gradient calculation

    % Normalize the gradient
    gradient_gaussian = gradient_gaussian / sum(gradient_gaussian);

    % Update input distribution using a small step size (delta)
    px_gaussian = px_gaussian + delta_gaussian * gradient_gaussian;

    % Check for convergence
    if sum(abs(delta_gaussian * gradient_gaussian)) < tolerance_gaussian
        fprintf('Gaussian Channel - Converged after %d iterations!\n', iter);
        break;
    end
end

fprintf('Gaussian Channel - Final Optimized Input Distribution:\n');
disp(px_gaussian);
fprintf('Gaussian Channel - Final Capacity: %f\n', capacity_gaussian);
