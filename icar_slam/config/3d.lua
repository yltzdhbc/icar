-- include "map_builder.lua"
-- include "trajectory_builder.lua"

-- options = {
--     map_builder = MAP_BUILDER,
--     trajectory_builder = TRAJECTORY_BUILDER,
--     map_frame = "map", -- 地图坐标系
--     tracking_frame = "base_footprint", -- 如果有imu ，就是imu坐标系
--     published_frame = "odom", -- 机器人底盘坐标系
--     odom_frame = "odom", -- cartographer计算出的优化后里程计坐标系，并非机器人本身里程计，建议区分开
--     provide_odom_frame = false, -- 是否发布odom_frame
--     -- 如果机器人本身存在odom坐标系，而你又 
--     -- 想让carto 使用 odom数据 ，就需要将published_frame 设置为 
--     -- odom，provide_odom_frame = false 而use_odometry = true 
--     publish_frame_projected_to_2d = true,
--     -- use_pose_extrapolator = true, -- 新增
--     use_odometry = true, -- 是否使用odom数据
--     use_nav_sat = false, -- 是否使用gps数据
--     use_landmarks = false, -- 是否使用lankmarks数据
--     num_laser_scans = 0, -- 如果使用的是单线的激光雷达，此处为激光雷达的数量
--     num_multi_echo_laser_scans = 0,
--     num_subdivisions_per_laser_scan = 1, -- 将激光雷达的数据拆分成几次发出来，对于普通的激光雷达，此处为1
--     num_point_clouds = 1, -- 多线激光雷达的数量
--     lookup_transform_timeout_sec = 0.2,
--     submap_publish_period_sec = 0.3,
--     pose_publish_period_sec = 5e-3,
--     trajectory_publish_period_sec = 30e-3,
--     rangefinder_sampling_ratio = 1.,
--     odometry_sampling_ratio = 1., -- 如果odom的数据非常不准可以设置成0.3以减弱odom对整体的优化
--     fixed_frame_pose_sampling_ratio = 1.,
--     imu_sampling_ratio = 1.,
--     landmarks_sampling_ratio = 1.
-- }

-- -- MAP_BUILDER.use_trajectory_builder_2d = true --决定选择的是3D的激光雷达还是2D的激

-- -- TRAJECTORY_BUILDER_2D.submaps.num_range_data = 35
-- -- TRAJECTORY_BUILDER_2D.min_range = 0.1
-- -- TRAJECTORY_BUILDER_2D.max_range = 3.5
-- -- TRAJECTORY_BUILDER_2D.missing_data_ray_length = 3.
-- -- TRAJECTORY_BUILDER_2D.use_imu_data = false
-- -- TRAJECTORY_BUILDER_2D.use_online_correlative_scan_matching = true
-- -- -- 这一项配置很重要，对于 我自己使用的雷达或者在 gazebo 中仿真时，如果不配置这项得到的建图效果将非常差。
-- -- -- 这个参数配置的是否使用 实时的闭环检测方法 来进行前端的扫描匹配。如果这项为false，
-- -- -- 则扫描匹配使用的是通过前一帧位置的先验，将当前scan与之前做对比，使用 高斯牛顿法 迭代 求解最小二乘问题 
-- -- -- 求得当前scan的坐标变换。如果这项为true，则使用闭环检测的方法，将当前scan在一定的搜索范围内搜索，
-- -- -- 范围为设定的平移距离及角度大小，然后在将scan插入到匹配的最优位置处。这种方式建图的效果非常好，
-- -- -- 即使建图有漂移也能够修正回去，但是这个方法的计算复杂度非常高，非常耗cpu。

-- -- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.linear_search_window = 0.1
-- -- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.translation_delta_cost_weight = 10.
-- -- TRAJECTORY_BUILDER_2D.real_time_correlative_scan_matcher.rotation_delta_cost_weight = 1e-1
-- -- POSE_GRAPH.optimization_problem.huber_scale = 1e2
-- -- POSE_GRAPH.optimize_every_n_nodes = 35
-- -- POSE_GRAPH.constraint_builder.min_score = 0.65

-- TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 160

-- MAP_BUILDER.use_trajectory_builder_3d = true
-- MAP_BUILDER.num_background_threads = 7

-- POSE_GRAPH.optimization_problem.huber_scale = 5e2
-- POSE_GRAPH.optimize_every_n_nodes = 320
-- POSE_GRAPH.constraint_builder.sampling_ratio = 0.03
-- POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 10
-- POSE_GRAPH.constraint_builder.min_score = 0.62
-- POSE_GRAPH.constraint_builder.global_localization_min_score = 0.66

-- TRAJECTORY_BUILDER.pure_localization_trimmer = {
--     max_submaps_to_keep = 3,
--   }
--   POSE_GRAPH.optimize_every_n_nodes = 100

-- return options


include "map_builder.lua"
include "trajectory_builder.lua"


options = {
    map_builder = MAP_BUILDER,
    trajectory_builder = TRAJECTORY_BUILDER,
    map_frame = "map",
    tracking_frame = "base_footprint",
    published_frame = "odom",
    odom_frame = "odom",
    provide_odom_frame = true,
    publish_frame_projected_to_2d = true,
    use_odometry = true,
    use_nav_sat = false,
    use_landmarks = false,
    num_laser_scans = 0,
    num_multi_echo_laser_scans = 0,
    num_subdivisions_per_laser_scan = 1,
    num_point_clouds = 1,
    lookup_transform_timeout_sec = 0.2,
    submap_publish_period_sec = 0.3,
    pose_publish_period_sec = 5e-3,
    trajectory_publish_period_sec = 30e-3,
    rangefinder_sampling_ratio = 1.,
    odometry_sampling_ratio = 1.,
    fixed_frame_pose_sampling_ratio = 1.,
    imu_sampling_ratio = 1.,
    landmarks_sampling_ratio = 1.,
  }
  
  TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 60
  TRAJECTORY_BUILDER_3D.use_online_correlative_scan_matching = true
  TRAJECTORY_BUILDER_3D.submaps.num_range_data = 250
  TRAJECTORY_BUILDER_3D.submaps.high_resolution = 0.20
  TRAJECTORY_BUILDER_3D.submaps.high_resolution_max_range = 20
  TRAJECTORY_BUILDER_3D.submaps.range_data_inserter.hit_probability = 0.55
  TRAJECTORY_BUILDER_3D.submaps.range_data_inserter.miss_probability = 0.49
  
  TRAJECTORY_BUILDER_3D.ceres_scan_matcher.translation_weight = 5e-3
  TRAJECTORY_BUILDER_3D.ceres_scan_matcher.rotation_weight = 4e-4
  
  MAP_BUILDER.use_trajectory_builder_3d = true
  MAP_BUILDER.num_background_threads = 6
  POSE_GRAPH.optimization_problem.huber_scale = 5e2
  POSE_GRAPH.optimize_every_n_nodes = 100
  POSE_GRAPH.constraint_builder.sampling_ratio = 0.03
  POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 10
  POSE_GRAPH.constraint_builder.min_score = 0.62
  POSE_GRAPH.constraint_builder.global_localization_min_score = 0.66

return options
