function closest_index = find_closest_match(patch, database,num_images)
% Calculate CIELAB values for patch
[L_patch, a_patch, b_patch] = calculate_cielab(patch);

% Initialize variables for tracking closest match
min_distance = Inf;
closest_index = 1;

% Loop over images in database
for i = 1:num_images
    % Get CIELAB values for database image
     L_img = database{i,2}(:,:,1);
     a_img = database{i,2}(:,:,2);
     b_img = database{i,2}(:,:,3);
    
    % Compute Euclidean distance between patch and image
    distance = sqrt((L_patch - L_img).^2 + (a_patch - a_img).^2 + (b_patch - b_img).^2);

    % Check if current image is closer than previous closest match
    if distance < min_distance
        min_distance = distance;
        closest_index = i;
    end
end
end

