function [obs_x, cell_size] = Map_gen()
% This function generates and plot the map or occupancy grid of the enviroment  

dime=[1; 1]; %dimension of the enviroment in meters 
scale=100; % each pixel shows a 0.01 m by 0.01 meter

cell_size=1/scale;

pixel_num_x = scale * dime(1);
pixel_num_y = scale * dime(2);

map=zeros(pixel_num_x, pixel_num_y);
% map(i,j) = 1 if it is occupied
% map(i,j) = 0 id it is vacant


obs_x=[];

% Definition of Obstacle 1
%  a rectangle with x_min=0.4 m, y_min=0.0 m, \delta x=0.1 m, \delta y= 0.45 m 
% (scaled by 100: x from 40 to 84 -> indices 41:85? but matching meters to pixels:)
% x indices: x_min*scale+1 to (x_min+delta_x)*scale
% y indices: y_min*scale+1 to (y_min+delta_y)*scale

x_min = 0.4; y_min = 0.0; dx = 0.1; dy = 0.45;
ix1 = max(1, floor(x_min*scale)+1);
ix2 = min(pixel_num_x, floor((x_min+dx)*scale));
iy1 = max(1, floor(y_min*scale)+1);
iy2 = min(pixel_num_y, floor((y_min+dy)*scale));

for ii = ix1:ix2
    for jj = iy1:iy2
        map(ii,jj) = 1;
        obs_x = [obs_x, [(ii-0.5)*cell_size ; (jj-0.5)*cell_size]];
    end
end

% Definition of Obstacle 2
%  a rectangle with x_min=0.4 m, y_min=0.65 m, \delta x=0.1 m, \delta y= 0.45 m 
% (scaled by 100: x from 40 to 84 -> indices 41:85? but matching meters to pixels:)
% x indices: x_min*scale+1 to (x_min+delta_x)*scale
% y indices: y_min*scale+1 to (y_min+delta_y)*scale

x_min = 0.4; y_min = 0.65; dx = 0.1; dy = 0.45;
ix1 = max(1, floor(x_min*scale)+1);
ix2 = min(pixel_num_x, floor((x_min+dx)*scale));
iy1 = max(1, floor(y_min*scale)+1);
iy2 = min(pixel_num_y, floor((y_min+dy)*scale));

for ii = ix1:ix2
    for jj = iy1:iy2
        map(ii,jj) = 1;
        obs_x = [obs_x, [(ii-0.5)*cell_size ; (jj-0.5)*cell_size]];
    end
end

% % % plot environment
% % figure 
% % hold on 
% % box on
% % grid on
% % box on
% % 
% % for ii=1:pixel_num_x
% %     for jj=1:pixel_num_y
% %         if map(ii,jj)==1
% %         fill([(ii-1)/scale  ii/scale ii/scale (ii-1)/scale],[(jj-1)/scale (jj-1)/scale jj/scale jj/scale],'k');
% %         end
% %     end
% % end
% % axis equal
% % xlim([0 dime(1)])
% % ylim([0 dime(2)])


end
