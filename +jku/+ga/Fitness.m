% Fitness of an individual
classdef Fitness
    properties(Access = public)
        Value = NaN; % The fitness value.
        SortingValue = NaN; % Value transforming 'Lower_best' (minimization) problems in 'Greater_best' (maximization) problems.
    end

    methods
        function this = Fitness(value)
            % Creates a jku.ga.Fitness instance.
            %
            % @param value: The fitness value.
            %
            % @return this: The jku.ga.Fitness instance.
            this.Value = value;
        end
    end
    
    methods(Access = public)
        function [this, idx] = sort(this, varargin)
            % Sorts the fitness.
            
            [~, idx] = sort([this.SortingValue], varargin{:}); 
            this = this(idx);
        end
    end
end