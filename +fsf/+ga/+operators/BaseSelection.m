classdef BaseSelection < fsf.ga.operators.BaseOperator
    % BASESELECTION: Determines how the individuals from a population are selected in order to be crossed using the crossover operator.

    methods
        function this = BaseSelection()
            % Creates a fsf.ga.operators.BaseSelection instance.
            %
            %  @return this: The new fsf.ga.Operators.BaseSelection instance.

            this@fsf.ga.operators.BaseOperator();
        end
    end
    
    methods(Access = public)
        function selectedPopulation = ApplySelection(this, population)
            % Applies the selection operator, determining how the individuals from a population 
            % are selected in order to be crossed using the crossover operator.
            %
            % @param population: The population from where to select individuals.
            %
            % @return selectedPopulation: The selected population to be crossed using the crossover operator.

            selectedPopulation = this.SelectionImplementation(population);
        end
    end 
    
    methods(Access = protected, Abstract)
        % Implemetns the selection operator, determining how the individuals from a population 
        % are selected in order to be crossed using the crossover operator.
        %
        % @param population: The population from where to select individuals.
        %
        % @return selectedPopulation: The selected population to be crossed using the crossover operator.

        selectedPopulation = SelectionImplementation(this, population);
    end    
end