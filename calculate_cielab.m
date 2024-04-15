function [L, a, b] = calculate_cielab(patch)
% Convert patch to CIELAB color space
lab_patch = mean(mean(squeeze(applycform(patch, makecform('srgb2lab')))));
% Extract L, a, b values from lab_patch
L = lab_patch(:, :, 1);
a = lab_patch(:, :, 2);
b = lab_patch(:, :, 3);
end


