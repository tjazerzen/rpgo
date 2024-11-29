format long;

phi = 43/101;
ctrl_pts = bezierarc(phi, 3);

first_der_ctrl_pts = 3 * diff(ctrl_pts);
second_der_ctrl_pts = 6 * (ctrl_pts(3:end,:) - 2*ctrl_pts(2:end-1,:) + ctrl_pts(1:end-2,:));

% naloga 1
t = 1/4;
tan_vec = bezier(first_der_ctrl_pts, t);
tan_len = norm(tan_vec); % ANS

% naloga 2
pen_pt = first_der_ctrl_pts(end-1,:);
pen_dist = norm(pen_pt); % ans

% naloga 3
t_vals = linspace(0, 1, 1001);
tangent_vals = zeros(length(t_vals), 2);
curvature_vals = zeros(length(t_vals), 1);

for i = 1:length(t_vals)
    t = t_vals(i);
    tangent_vals(i, :) = bezier(first_der_ctrl_pts, t);
    accel_vals = bezier(second_der_ctrl_pts, t);
    det_val = tangent_vals(i, 1) * accel_vals(2) - tangent_vals(i, 2) * accel_vals(1);
    curvature_vals(i) = det_val / (norm(tangent_vals(i, :))^3);
end

curvature_diff = abs(1 - curvature_vals);
max_curvature_diff = max(curvature_diff); % ans

