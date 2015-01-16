function [ ] = plot_snakuscule( image, center, radius, cosarray,sinarray, alpha )
%function plots the two circles of the snakuscule on the image.

xp1=radius*cosarray;
xp2=sqrt(alpha)*radius*cosarray;
yp1=radius*sinarray;
yp2=sqrt(alpha)*radius*sinarray;

figure(7),imshow(image,[]);hold on;
plot(center(2)+xp1,center(1)+yp1,'r.',center(2)+xp2,center(1)+yp2,'g.','MarkerSize',5);
% plot(x0/2,y0/2,'y+','MarkerSize',12,'LineWidth',2);hold off
end

