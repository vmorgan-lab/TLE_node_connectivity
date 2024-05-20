
function [fc_corrected] = FC_correction(FC,covariates)
      
    % This program will correct the FC feature matrix for covariates by
    % using linear regression model

     %% Inputs
        % FC: FC feature matrix (m*n)
        % covariates: a matrix include your covariates as (m*k): m: number of subjects and k: number of your covariates

    %% Output
        % fc_corr: FC feature matrix corrected for covariates (n*m), n: number of regions and m: number of subjects  
   
numSub=size(FC,1);
numROIS=size(FC,2);    
    

    fit=zeros(numROIS,3);

        for i=1:numROIS
             co(1:numSub,1)=FC(:,i);%
             idx=find(isnan(co)==0); 
             if length(idx)>1
                
                 mdl=fitlm([covariates(idx,:)],co(idx),'linear');  %fillm(x,y)
                 
                 for m=1:mdl.NumCoefficients
                     fit(i,mdl.NumCoefficients)=mdl.Coefficients.Estimate(1); % Intercept                                                    
                     fit(i,1:mdl.NumCoefficients-1)=mdl.Coefficients.Estimate(2:end); % postsurgical follow-up time
                 end
            end
        end
        

        for s = 1:size(FC,1)   
            one_con_Z=FC(s,:);
            fc_corr=NaN(numROIS,1);
            for i=1:numROIS
                co=one_con_Z(i);
                if size(covariates,2)>1
                   fc_co=[co-((covariates(s,1).*fit(i,1))+(covariates(s,2).*fit(i,2))+(fit(i,mdl.NumCoefficients)))];
                else
                   fc_co=[co-((covariates(s,1).*fit(i,1))+(fit(i,mdl.NumCoefficients)))];
                end

                fc_corr(i)=fc_co;
            end        
            fc_corrected(:,s)=fc_corr;  
        end

end        
