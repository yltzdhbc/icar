# Icar
​	**Icar**是一款用于ROS学习的低成本高性能双轮差速小车，Icar的设计到做出实物，遵循着性价比的原则，使用最低成本的硬件做出最好的效果，因此，电机选用了两个42步进电机，配合上我的另一个项目 [**SmartDrive-Stepper**](https://yltzdhbc.top/SmartDrive-Stepper) ，实现高精度的电机运动以及里程计反馈，机身材料全部采用3D打印PLA材质，螺栓均采用塑料尼龙六角柱，底层直接使用**Arduino RosSerial**与树莓派通信，相比串口发送，更简洁、代码量更少。主控使用树莓派3B/3B+/4 ，运行基于 **Raspbian** 的 **Ros Kinetic** ，雷达可搭载思岚的rpdiar a1，或者Robotics的LDS。当前支持手柄 PS3/XBOX360/LeTv ，支持一般的USB摄像头以及微软Kinetic、乐视（奥比中光）astra pro。

![Top](./img/icar.png)

> 该软件遵循MIT开源协议，作者保留版权，无任何其他限制，但是你必须在你的软件中包含原MIT授权协议的声明。由于本人时间、能力有限，有许多不足之处，欢迎在GitHub的`Issues`中留言

本仓库为Icar的Ros基础功能包。

项目详情请见：

我的博客：[https://yltzdhbc.top/Icar](https://yltzdhbc.top/Icar)

Github: [https://github.com/yltzdhbc/Icar](https://github.com/yltzdhbc/Icar)

Gitee: [https://gitee.com/yltzdhbc/Icar](https://gitee.com/yltzdhbc/Icar)

