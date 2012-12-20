classdef Result < fsf.matlab.system.HiddenHandle
    % RESULT: Genetic Algorithm execution results. 
    %
    % The result of a Genetic algorithm keeps track of the best individual in each iteration and the final best individual.
    
    properties
        Best; % Best individual of the last iteration of the Genetic Algorithm. Best is a shortcut for BestByIteration(end).
        BestByIteration = []; % Best individual in each iteration of the Genetic Algorithm execution.
    end
    
    methods
        function this = Result()
            % Creates a fsf.ga.Result instance.
            %
            % @return this: The fsf.ga.Result instance.
        end
        
        function AddBestByIteration(this, best)
            % Adds a best individual to the tracking of the best individual in each iteration.
            %
            % @param best: the best individual to track.
            this.BestByIteration = [this.BestByIteration, best];
        end
    end
    
end

