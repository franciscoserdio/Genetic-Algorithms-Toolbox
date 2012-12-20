classdef FitnessEvaluator < fsf.ga.FitnessEvaluator
    %FITNESSEVALUATOR Fitness evaluator for the feature selection problem
    %   .- Measures the MSE of the method in the inputs with respect to the target
    
    properties
        Inputs; % Inputs of the problem
        Target; % Target of the problem
        NumChannels; % Number of channels (variables) of the problem
        NumMeasures; % Number of measures (samples) of the problem
    end
    
    methods
        function this = FitnessEvaluator(inputs, target)
            % Creates a sample.features.FitnessEvaluator instance.
            %
            % @param inputs: The inputs of the regression problem.
            % @param target: The target of the regression problem.
            %
            % @return this: The sample.features.FitnessEvaluator instance.

            this@fsf.ga.FitnessEvaluator('lower_best');
            this.Inputs = inputs;
            this.Target = target;
            [this.NumMeasures, this.NumChannels] = size(inputs);
        end 
    end
    
    methods(Access = public)
        function fitness = EvaluateIndividual(this, theIndividual)
            % Evaluates the fitness of an individual
            %
            % @param individual: The individual to whom the fitness will be evaluated.
            %
            % @return fitness: The fitness of the individual.
            
            if(this.NumChannels ~= (theIndividual.FactoryArgs.Dimensions))
                error('Matrix dimensions and individual feature selector size do not match');
            end
            
            inputs = [this.Inputs(:, theIndividual.Features), ones(this.NumMeasures, 1)];
            target = this.Target;
            betas = regress(target, inputs);
            target_hat = inputs * betas;
            errors = (target_hat - target);
            current_mse = mse(errors);
            fitness = fsf.ga.Fitness(current_mse);
        end
    end    
end