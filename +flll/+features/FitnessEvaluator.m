% Fitness evaluator is able to measure how good is an individual of a population with respect to a given problem
classdef FitnessEvaluator < jku.ga.FitnessEvaluator & handle
    %FITNESSEVALUATOR Fitness evaluator for the box-cox transformation
    %   .- Measures the MSE of the method in the inputs with respect to the target using a 10-fold cross validation approach
    
    properties
        Inputs;
        Target;
        NumChannels;
        NumMeasures;
    end
    
    methods
        function this = FitnessEvaluator(inputs, target)
            this@jku.ga.FitnessEvaluator('lower_best');
            this.Inputs = inputs;
            this.Target = target;
            [this.NumMeasures, this.NumChannels] = size(inputs);
        end 
    end
    
    methods(Access = public)
        % Evaluates the fitness of an individual
        function fitness = EvaluateIndividual(this, theIndividual)
            if(this.NumChannels ~= (theIndividual.FactoryArgs.Dimensions))
                error('Matrix dimensions and individual feature selector size do not match');
            end
            
            inputs = [this.Inputs(:, theIndividual.Features), ones(this.NumMeasures, 1)];
            target = this.Target;
            betas = regress(target, inputs);
            target_hat = inputs * betas;
            errors = (target_hat - target);
            current_mse = mse(errors);
            fitness = jku.ga.Fitness(current_mse);
        end
    end    
end