function  img_proc1(test)
 	
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

 	segmented_images = cell(1,3);
	rgb_label = repmat(pixel_labels,[1 1 3]);

	for k = 1:nColors
    	color = test;
    	color(rgb_label ~= k) = 0;
    	segmented_images{k} = color;
	end

	imwrite(segmented_images{1},'cluster_t21.jpg');
    imwrite(segmented_images{2},'cluster_t22.jpg');
    imwrite(segmented_images{3},'cluster_t23.jpg');
    imwrite(segmented_images{4},'cluster_t24.jpg');
end