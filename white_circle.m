function [white_circle,count]= white_circle(im_blank,center,radius,angle_array)

x = center(1) + radius*angle_array(1);
y = center(2) + radius*angle_array(2);
im_blank(round(x)+size(im_blank,2)*round(y))=255; %Create circle boundary
bw_circle=imfill(im_blank,[center(1),center(2)]); %Fill  in the circle
   
count=nnz(bw_circle); %count number of pixels
white_circle=double(bw_circle);
    
end
