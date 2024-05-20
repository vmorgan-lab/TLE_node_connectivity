function [node_strength]=Node_strength(FC)
     % this function will calculate the node strength 

    %% Inputs
        % FC: functional_connectivity matrix (n*n*m)

    %% Output
        % Node Strength matrix (n*m)
    
%% ROI strength
numSub=size(FC,3);
numROIS=size(FC,1);

     for i=1:numSub
         F=FC(:,:,i);
      
         for j=1:numROIS        
            % calculate sum
            node_strength(i,j)=nansum(F(j,:));  
       
         end
     end  
end

   