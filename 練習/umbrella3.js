const theCanvas = document.getElementById('theCanvas'),
  ctx = theCanvas.getContext('2d'),
  mix = 6000;   //会产生连线的极限距离的平方
//将canvas铺满浏览器
let canvas_width = theCanvas.width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
  canvas_height = theCanvas.height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight,
  points = [];
theCanvas.style = "position: fixed; top: 0px; left: 0px;";
//绘制函数，用requestAnimationFrame调用实现动画




function draw() {
  //清屏
  ctx.clearRect(0, 0, canvas_width, canvas_height);
  let i,pi,x_dist,y_dist;
  //遍历点集合绘制线条
  points.forEach((p, index) => {
    p.x += p.xa,		//按指定速度移动
    p.y += p.ya,
    p.xa *= p.x > canvas_width || p.x < 0 ? -1 : 1,//碰到牆反彈
    p.ya *= p.y > canvas_height || p.y < 0 ? -1 : 1,
    ctx.fillRect(p.x - 0.5, p.y - 0.5, 4,4);		//绘制点，其实是小方块
    //类似于握手问题，两个点之间只绘制一次线
    for(i = index + 1; i < points.length; i++) {
        pi = points[i];
        x_dist = p.x - pi.x;
        y_dist = p.y - pi.y;
        dist = x_dist * x_dist + y_dist * y_dist;
        dist < pi.max && 
        (pi === current_point && dist >= pi.max / 2 && 
         (p.x -= 0.03 * x_dist, p.y -= 0.03 * y_dist));

        //根据两点距离得到一个参数w
        w = (mix - dist) / mix;
        //判断点之间的距离是否小于极限距离
        if(dist < mix) {
          ctx.beginPath();
          //根据参数w设置连线宽度和透明度
          ctx.lineWidth = w ;
          ctx.strokeStyle = `rgba(110,110,110,${w + 0.3})`;
          ctx.moveTo(p.x, p.y);
          ctx.lineTo(pi.x, pi.y);
          ctx.stroke();
        }
      }
    
  }),requestAnimationFrame(draw);
}
//随机生成100个点
for(let i = 0; i < 100; i++ ) {
  let	x = Math.random() * canvas_width,	//初始坐标
    y = Math.random() * canvas_height,
    xa = 2 * Math.random() - 1,			//x速度
    ya = 2 * Math.random() - 1;			//y速度
  points[i] = {x, y, xa, ya};
}

var current_point= {};
window.onmousemove = e => {
    e = e || window.event;

    points[100] = {x:e.clientX, y:e.clientY, xa:0, ya:0};
    // console.log (points[100]);
  };
 

  draw();
//   window.onmouseout = () => {
//     current_point.x = null;
//     current_point.y = null;
//   };
//   //将鼠标的点添加至点集合中

//   //当两点距离小于极限距离时产生连线，当第二个点是鼠标所产生点时，粒子如果在范围内就会产生向鼠标点的速度，实现吸附效果
//  dist < pi.max && (pi === current_point && dist >= pi.max / 2 && (p.x -= 0.03 * x_dist, p.y -= 0.03 * y_dist));
