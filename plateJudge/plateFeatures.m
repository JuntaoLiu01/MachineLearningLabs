function features = plateFeatures(image,level)
    %A = imread(fileName);
    I = mat2gray(image);
    BW = im2bw(I,level);
    
    [row,col] = size(BW);
    features = zeros(1,row+col);
    for i=1:row
        features(i) = sum(BW(i,:),2);
    end
    for i=1:col
        features(row+i) = sum(BW(:,i));
    end    
end
