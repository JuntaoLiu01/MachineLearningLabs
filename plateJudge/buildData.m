function [X,y] = buildData(hasDir,noDir,level)
    X=[];y=[];
    
    hasFlist = dir(sprintf('%s/*.jpg', hasDir));
    for i = 1:length(hasFlist)
        name = sprintf('%s/%s', hasDir, hasFlist(i).name);
        A = imread(name);
        %imshow(A);
        features = plateFeatures(A,level);
        X = [X;features];
        y = [y;1];
    end
    
    noFlist = dir(sprintf('%s/*.jpg',noDir));
    for i = 1:length(noFlist)
        name = sprintf('%s/%s', noDir, noFlist(i).name);
        A = imread(name);
        %imshow(A);
        features = plateFeatures(A,level);
        X = [X;features];
        y = [y;0];
    end
    %save(name,'X','y');
        
end