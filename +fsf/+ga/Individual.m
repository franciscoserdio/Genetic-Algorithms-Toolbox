classdef Individual < fsf.matlab.system.IClonable & fsf.matlab.system.HiddenHandle
    % INDIVIDUAL of a genetic algorithm's population.

    properties(GetAccess = public)
        Fitness; % The individual fitness.
        FactoryArgs; % The arguments used to create the individual.
    end
    
    methods
        % Creates an individual
        function this = Individual(factoryArgs)
            % Creates a fsf.ga.Individual instance.
            %
            % @param factoryArgs: the fsf.ga.IndividualFactoryArgs giving to the individuals.
            %
            % @return this: The fsf.ga.Individual instance.

            this.FactoryArgs = factoryArgs;
            this.Fitness = NaN;
        end        
    end
    
    methods(Access = public, Abstract)
        % Factory method to clone a fsf.ga.Individual.
        %
        % @return individual: The cloned fsf.ga.Individual.
        
        individual = Clone(this);
    end
    
    methods(Access = public)       
        function [this, idx] = sort(this, varargin)
            % Sort individuals according to Fitness.
            
            [~,idx] = sort([this.Fitness], varargin{:}); 
            this = this(idx);
        end
    end
    
end