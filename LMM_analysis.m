function [mixed,p,t,estimate]=LMM_analysis(response,random,X,G)

    % this function will do linear mixed model
    
    %% Inputs
        % response: feature matrix response (postsurgical node strength, postsurgical factor loading,
        % post-pre node strength and ....)
        % random: random-effects design matrix (presurgical node strength)
        % X: fixed-effects design matrix X [ones, seizure outcome,duration of disease prior to surgery, postsurgical follow-up time]  
        % G: grouping

     %% Output
        % mixed: linear mixed model 
        % p: p-value of the test, returned as a scalar value in the range [0,1]
        % t: value of the test statistic
        % estimate: model coefficient

    
     numROIS=length(response);

    for k = 1:numROIS        
        y = response(:,k); %% response      
        Z = random(:,k);  %% random effect   
        mixed{k} = fitlmematrix(X,y,Z,G);
        Coefficients{k} = mixed{1,k}.Coefficients;
    end
 
    for i=1:length(Coefficients)
        Cof=Coefficients{1,i};
        p(:,i)=Cof(:,6);p=double(p);  %% p-value
        t(:,i)=Cof(:,4);t=double(t); %% t-value
        estimate(:,i)=Cof(:,2);estimate=double(estimate);  %% beta_estimate
    end

end
