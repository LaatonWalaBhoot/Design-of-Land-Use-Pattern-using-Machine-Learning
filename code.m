 test = imread('Sampson_Flat_Fire_01042015_sm.jpg');
change = makecform('srgb2lab');
 cspace = applycform(test,change);
 ab = double(cspace(:,:,2:3));
 nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
 nColors = 4;
 [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',4);
 pixel_labels = reshape(cluster_idx,nrows,ncols);
imshow(pixel_labels,[]), title('After Clustering');

 segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = test;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

imshow(segmented_images{1}), title('Cluster 1');
imshow(segmented_images{2}), title('Cluster 2');

