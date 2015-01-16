function [ total_intensity, pixel_count] = region_intensity(image,center,radius)

%Function computes the sum of intensity values of all the pixels in a
%circle defined by the following inputs:

%%Inputs: 
%image: The function takes as input the image in grayscale format
%center: center of the circle
%radius: radius of the circle

%%Outputs:
%total_intensity: Sum of intensities of all pixels inside the circle
%pixel_count: Number of pixels inside the circle

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
%CODE END


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = center(1) + radius*angle_array(1);
% y = center(2) + radius*angle_array(2);
% im_blank(round(x)+size(im_blank,2)*round(y))=255; %Create circle boundary
% bw_circle=imfill(im_blank,center); %Fill  in the circle
%    
% pixel_count=nnz(bw_circle); %count number of pixels
% white_circle=double(bw_circle);
% 
% 
% image=double(image);
% bw_circle=double(white_circle);
% intensity_image=bw_circle.*image;
% total_intensity=sum(sum(intensity_image));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

            
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

