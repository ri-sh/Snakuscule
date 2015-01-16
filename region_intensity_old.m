function [ total_intensity, pixel_count] = region_intensity_old(image, center, radius)


image=double(image);
total_intensity=0;
start1=floor(center(1)-radius-1);
finish1=floor(center(1)+radius+1);
start2=ceil(center(2)-radius-1);
finish2=ceil(center(2)+radius+1);

pixel_count=0;

for i=start1:finish1
    for j=start2:finish2
        if sqrt( (i-center(1))^2 + (j-center(2))^2) < radius
            total_intensity=total_intensity+image(i,j);
            pixel_count=pixel_count+1;
            %image(i,j)=255;
        end
    end
end

%imshow(image);

            



% function [ total_intensity ] = region_intensity( image, current, center, radius)
%  
% % Function calculates the intensity sum of all the pixels that lie inside a
% % circle defined with center=center and radius=radius.
% global pixel_value;
% image=double(image);
% pixel_pos=current;
% disp(pixel_value)
% 
% %if distance is less than radius and position not traced before:
% if  sqrt( (pixel_pos(1)-center(1))^2 + (pixel_pos(2)-center(2))^2) < radius && image(pixel_pos(1),pixel_pos(2),3)~= 1
%     
%     image(pixel_pos(1),pixel_pos(2),3)=1; %traced
%     pixel_value=pixel_value+image(pixel_pos(1),pixel_pos(2),1);
%     
%     region_intensity(image, [pixel_pos(1)+1, pixel_pos(2)], center, radius);
%     region_intensity(image, [pixel_pos(1), pixel_pos(2)+1], center, radius);
%     region_intensity(image, [pixel_pos(1)-1, pixel_pos(2)], center, radius);
%     region_intensity(image, [pixel_pos(1), pixel_pos(2)-1], center, radius);
%     
% end
% total_intensity=pixel_value;
% end

