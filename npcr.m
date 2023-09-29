clc;
close all;
clear all;


%% 3. NCPR score and p_value
img_a=imread('image1.tif');%img_a=rgb2gray(img_a1);
img_b=imread('modified_image.tif');
%img_a=[162,150;155,130];
%img_b=[165,132;150,110];
%

[ height_a, width_a, depth_a ] = size( img_a );
[ height_b, width_b, depth_b ] = size( img_b );
if ( ( height_a ~= height_b ) ...
  || (  width_a ~=  width_b ) ...
  || (  depth_a ~=  depth_b ) )
    error( 'input images have to be of same dimensions' );
end
class_a = class( img_a );
class_b = class( img_b );
if ( ~strcmp( class_a, class_b) )
    error( 'input images have to be of same data type'); 
end


%

if ( ~exist( 'largest_allowed_val', 'var') )
    switch  class_a 
        case 'uint16'
            largest_allowed_val = 65535;
        case 'uint8'
            largest_allowed_val = 255;
        case 'logical'
            largest_allowed_val = 2;
        otherwise
            largest_allowed_val = max ( max( img_a(:), img_b(:) ) );
    end
end
if ( ~exist( 'need_display', 'var' ) ) 
    need_display = 1;
end
img_a = double( img_a );
img_b = double( img_b );
num_of_pix = numel( img_a );

%
results.npcr_score = sum( double( img_a(:) ~= img_b(:) ) ) / num_of_pix * (100);
npcr_mu  = ( largest_allowed_val ) / ( largest_allowed_val+ 1 );
npcr_var =  ( ( largest_allowed_val) / ( largest_allowed_val+ 1 )^2 ) / num_of_pix;
results.npcr_pVal = normcdf( results.npcr_score, npcr_mu, sqrt( npcr_var ) );
results.npcr_dist = [ npcr_mu, npcr_var ];

%
results.uaci_score = sum( abs( img_a(:) - img_b(:) ) ) / num_of_pix / largest_allowed_val; 
uaci_mu  = ( largest_allowed_val+2 ) / ( largest_allowed_val*3+3 );
uaci_var = ( ( largest_allowed_val+2 ) * ( largest_allowed_val^2 + 2*largest_allowed_val+ 3 ) /18 / ( largest_allowed_val+ 1 )^2 / largest_allowed_val) / num_of_pix;
p_vals = normcdf( results.uaci_score, uaci_mu, sqrt( uaci_var ) );
p_vals( p_vals > 0.5 ) = 1 - p_vals( p_vals > 0.5 );
results.uaci_pVal = 2 * p_vals;
results.uaci_dist = [ uaci_mu, uaci_var ];

%% 5. optional output
if ( need_display ) 
   format long;
   display( results ); 
end
