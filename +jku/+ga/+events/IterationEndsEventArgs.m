classdef IterationEndsEventArgs < event.EventData
    %ITERATIONENDSEVENTARGS> Event data for IterationEnds event.
    
    properties
        StepPopulation; % The population of the current iteration.
        AcumulatedResult; % The acumulated results of the already performed iterations.
    end
    
    methods
        function this = IterationEndsEventArgs(stepPopulation, acumulatedResult)
            % Creates a jku.ga.events.IterationEndsEventArgs instance.
            %
            % @param stepPopulation: The population of the current iteration.
            % @param acumulatedResult: The acumulated results of the already performed iterations.
            %
            % @return this: The jku.ga.events.IterationEndsEventArgs instance.
            
            this.StepPopulation = stepPopulation;
            this.AcumulatedResult = acumulatedResult;
        end
    end
end

