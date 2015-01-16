function [ energy ] = snake_energy(image,center, radius, alpha)
% Function computes the energy difference between the outer radius and the
% inner radius of the snakuscule. The difference in energy is later
% normalised by dividing by number of pixels.

%%Inputs: 
%image: Image to be worked upon. Grayscale format
%center: Center of the concentric circles
%radius: Radius of inner circle
%alpha: floating value grater that 1. outer_radius=sqrt(alpha)*inner_radius

%%Outputs:
%energy: Energy difference between outer circle and inner circle. Energy
%should be negative if bright contour is detected.

[energy_large,pixel_count_larger]      = region_intensity(image, center, sqrt(alpha)*radius);
[energy_small, pixel_count_smaller]    = region_intensity(image, center,radius);
normalise_larger                       = energy_large/pixel_count_larger;
normalise_smaller                      = energy_small/pixel_count_smaller;
%disp(pixel_count_larger)
%disp(pixel_count_smaller)
energy=normalise_larger-normalise_smaller;
end
% CODE END

% energy= energy_large-2*energy_small;
% energy=energy/(4*radius*radius);
%disp(energy)

% image=double(image);
% im_blank=double(im_blank);
% energy_large =region_intensity(image,im_blank,center,sqrt(2)*radius,angle_array);
% energy_small =region_intensity(image,im_blank,center,radius,angle_array);


