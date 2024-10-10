function plot_image(path2Image,xSpace,ySpace)
% @note It might be necessary to first create something empty and then add the image like
% plot_image('Fu - G04 - PDgp.png',[0 300], [12732.395 0 ])
% plot([0 0],[0 0])
% further note that the ySpace is used as [max min] and not [min max]
% (don't know why it is otherwise upside down)

I=imread(path2Image);
xImg = linspace(xSpace(1), xSpace(2), size(I, 2));
yImg = linspace(ySpace(1), ySpace(2), size(I, 1));
image(xImg, yImg, I, 'CDataMapping', 'scaled');

end

