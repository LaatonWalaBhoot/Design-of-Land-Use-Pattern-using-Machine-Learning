function irrelevant(cluster1)

    g = rgb2gray(cluster1);
    [r,c] = size(g);
    for i = 1 : r
        for j = 1 : c
            if (g(i,j)>=50)
                g(i,j) = 0;
            else
                g(i,j) = 1;
            end
        end
    end

    imshow(g,[])
    h = getframe;
    img = h.cdata;
    imwrite(img,'bw_irrelevant.jpg');
    
end

