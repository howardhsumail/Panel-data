function [likelihood] = MLE_panelData(parameter)

global yi_stack
global Xi_stack
global Wi_stack

func = log(...
    normpdf(...
    yi_stack, ...
    Xi_stack * parameter(1, 1:5)', ...
    sqrt(diag(...
    Wi_stack * parameter(1, 6) * Wi_stack' + parameter(1, 7) * eye(length(Wi_stack))))));

likelihood = - sum(func);