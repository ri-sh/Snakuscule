close all
clear all
clc

%global image;
%% Define the variables

ang=0:0.01:2*pi; %Angles defined for plotting circles later
cosarray=cos(ang); %Cos(Angles) defined early to decrease computation requirement
sinarray=sin(ang); %Sin(Angles)
%angle_array=[cos(ang), sin(ang)];

im=imread('2.jpg'); 
im=im(1:2:size(im,1),1:2:size(im,2),:); %Decrease the size of pixels to increase speed
im_orig=im; %copy
im=rgb2gray(im); %Convert to grayscale
%center=[282,388];
center=[153,111]; %Initial center of snakuscule circle
alpha=1.5; % alpha defines the ratio of outer radius by inner radius.
% Outer_radius/Inner_radius=sqrt(alpha)
% alpha has to be greater than 1.
radius=45; %Initial inner radius of snakuscule

%% Starting the iterations
for iter=1:200 %Random number of iterations until snakuscule captures the bright contour
 
%% Calculate the differentials of energy w.r.t x, y and radius
    
    diff_xpos=snake_energy(im, [center(1),center(2)+1], radius, alpha)- snake_energy(im, center, radius, alpha); 
    diff_xneg=snake_energy(im, [center(1),center(2)-1], radius, alpha)- snake_energy(im, center, radius, alpha);
    diff_ypos=snake_energy(im, [center(1)+1,center(2)], radius, alpha)- snake_energy(im, center, radius, alpha);
    diff_yneg=snake_energy(im, [center(1)-1,center(2)], radius, alpha)- snake_energy(im, center, radius, alpha);
    diff_radpos=snake_energy(im, center, radius+1, alpha)- snake_energy(im, center, radius, alpha);
    diff_radneg=snake_energy(im, center, radius-1, alpha)- snake_energy(im, center, radius, alpha);
%   
%% Calculate the most negative energy difference and move in that direction
    
    %----------------Begin Sorting the variables---------------------%
    array=[diff_xpos,diff_xneg, diff_ypos, diff_yneg, diff_radpos, diff_radneg];
    small=array(1); 
    pos=1; %Array sorting to find the most negative energy difference
    for i=1:size(array,2)
        if array(i)<small
            small=array(i);
            pos=i;
        end
    end
    %------------------------Sorting ends-----------------------------%
    %disp(pos)
    
    % 6 possible cases:  
    if pos==1 %Energy decreases the most by going in +ve x direction
        center(2)=center(2)+1; %Increase x 
        
    elseif pos==2 %Energy decreases the most by going in -ve x direction
        center(2)=center(2)-1; %Decrease x
        
    elseif pos==3 %Energy decreases the most by going in +ve y direction
        center(1)=center(1)+1;
        
    elseif pos==4 %Energy decreases the most by going in -ve y direction
        center(1)=center(1)-1;
        
    elseif pos==5 %Energy decreases the most by increasing the radius
        radius=radius+1;
        
    elseif pos==6 %Energy decreases the most by decreasing the radius
        radius=radius-1;
        
    end

%% Plot the inner and outer circle    
    %Function plot_snakuscule(image, center, radius, cosarray,sinarray,alpha)
    plot_snakuscule( im_orig, center, radius, cosarray,sinarray, alpha )
%     iter %Display number of iterations
    
end

