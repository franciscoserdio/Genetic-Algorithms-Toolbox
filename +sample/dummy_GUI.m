classdef dummy_GUI < fsf.matlab.system.HiddenHandle
    properties(Access = private)
        Handle = NaN;
    end
    
    methods
        function Plot(this, src, data)
            fitnesses = NaN(1, numel(data.AcumulatedResult.BestByIteration));
            features = [];
            for iIndividual = 1:numel(data.AcumulatedResult.BestByIteration)
                currentBest = data.AcumulatedResult.BestByIteration(iIndividual);
                fitnesses(iIndividual) = currentBest.Fitness.Value;
                features = [features; currentBest.Features];
            end
            
            if(isequaln(this.Handle, NaN))
                this.Handle = figure;
            end
            figure(this.Handle);
            subplot(1, 2, 1);
            plot(fitnesses);
            xlim([0, src.Configuration.MaximumIterations]);

            subplot(1, 2, 2);
            colormap([1 1 1; 1 0 0]);
            image(features.* 255);
            ylim([0, src.Configuration.MaximumIterations]);
        end
    end
end
