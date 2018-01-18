# pokemongo-VR
pokemongo－VR Swift3.0  Xcode8.1，No use Apple ARKit

- baidu MapSDK
- Compass API
- gyroscope API


![1.gif](3.jpeg)


- 一阵眩晕-

![2.gif](2.gif)

![3.gif](1.gif) 

- 其实我的做法比较奇葩， 只是写一个demo 来理解加速传感器和指南的的使用。
这个文章讲解加速器传感器： http://www.hangge.com/blog/cache/detail_545.html


- 先屡屡思路， 如何在手机旋转的时候，图片位置定位到现实场景。
1.图片定位：X，Y，也就把一张图片定位到屏幕上。
2.我们先说：定位X，我们从指南针api里可以获取当前指向南方的参数，然后根据一些数值变化，就可以把当前X坐标算出来。
3.那我们怎么把Y值算出来呢？  也就是根据加速器判断当前手机的摆放位置来获取一些参数，转化成Y值。
4.X，Y都知道了， 图片的位置也就相应的知道了。 
5.还集成了百度地图的SDK，定制了一下地图的颜色，把地图的文字都去掉了。

个人博客 http://liangtongzhuo.com


