var context;//整个上下文
var arr=new Array();//星星数组
var starCount=500; //星星开始数量

var rains=new Array();//流星雨数组
var rainCount=20;//流星雨的数量

//初始化画布及context
 function init(){
     //获取canvas
     var stars=document.getElementById("canvas");
     //获取当前窗口的宽度和高度
     stars.width=window.innerWidth;//窗口宽度
     stars.height=window.innerHeight;//窗口高度
     //获取上下文context
     context=stars.getContext("2d");//返回画布环境2d画面效果

 }

//创建星星对象
var Star=function (){
       this.x = window.innerWidth * Math.random();//横坐标等于窗口宽度乘以1以内的随机数
       this.y = 5000 * Math.random();//纵坐标（就是窗口高度为5000乘以1以内随机数）
       this.text = "*";//星星文本
       this.color = "white";//星星颜色


       //产生随机黑白颜色方法
       this.getColor=function() {
           var r = Math.random();//获取随机数
           if (r < 0.5) {
               this.color = "#000000";//黑色
           } else {
               this.color = "white";//白色
           }
       }

       //初始化
       this.init = function () {
           this.getColor();//调用随机产生颜色
       }

       //绘制
       this.draw = function () {
           context.fillStyle = this.color;//填入颜色
           //text:规定在画布上输出的文本，
           //x:开始绘制文本的下坐标位置（相对于画布）
           //y:开始绘制文本y坐标位置（相对于画布）
           context.fillText(this.text, this.x, this.y);
       }
   }

  //星星闪烁方法
  function playStars(){
      //循环遍历星星数组，让每一个小星星闪
      for(var s=0;s<starCount;s++){
         arr[s].getColor();//调用产生随机黑白颜色的方法
          arr[s].draw();//绘制星星
      }
      setTimeout("playStars()",100);//定时每100毫秒调用一次
  }


//流星雨
var MeteorRain=function(){
      this.x=-1;
      this.y=-1;
      this.length=-1;//长度
      this.angle=30;//倾斜角度
      this.width=-1;//宽度
      this.height=-1;//高度
      this.speed=1;//速度
      this.offset_x=-1;//横轴移动偏移量
      this.offset_y=-1;//纵轴移动偏移量
      this.alpha=1;//透明度
      this.color1="red";//流星的色彩
      this.color2="red";//流星2的色彩

    //获取随机坐标的函数
     this.getPos=function(){
         this.x=Math.random()*window.innerWidth;//窗口宽度
         this.y=Math.random()*window.innerHeight;//窗口高度
     }

    //获取随机颜色
      this.getRandomColor=function(){
           var r=Math.ceil(255-240*Math.random());//Math.ceil()对一个数进行上舍入。
           //中段颜色
          this.color1="rgba("+r+","+r+","+r+",1)";
          //结束颜色
          this.color2="black";
      }

      //初始化函数
     this.init = function(){
         this.getPos();//获取随机坐标的函数
         this.alpha=1;//透明度
         this.getRandomColor();//获取随机颜色方法
          //流星雨的最小长度，最大长度
          var x=Math.random()*80+150;
         //流星雨的长度
         this.length=Math.ceil(x);//对随机数进行上舍入
         this.angle=30;//流星倾斜角
         x=Math.random()+0.5;
         this.speed=Math.ceil(x);//流星雨的速度
         var cos=Math.cos(this.angle*3.14/300);
         var sin=Math.sin(this.angle*3.14/180);
         this.width=this.length*cos; //流星所占的宽度
         this.height=this.length*sin;//流星所占的高度
         this.offset_x=this.speed*cos;
         this.offset_y=this.speed*sin;
     }

    //绘制流星
      this.draw=function(){
           context.save();//保存当前图像状态的一份拷贝。
           context.beginPath();//重新开始新路径，而把之前的路径都清空掉
          context.lineWidth=1;//宽度
          context.globalAlpha=this.alpha;//设置透明度
          //创建横向渐变颜色，起点坐标至终点坐标
          var line=context.createLinearGradient(this.x,this.y,this.x+this.width,this.y-this.height);
          //分段设置颜色渐变
          //addColorStop方法第一个参数：介于 0.0 与 1.0 之间的值，表示渐变中开始与结束之间的位置。
          //addColorStop方法第二个参数：设置颜色
           line.addColorStop(0,"white");
           line.addColorStop(0.3,this.color1);
           line.addColorStop(0.6,this.color2);
          context.strokeStyle=line;//strokeStyle 属性设置或返回用于笔触的颜色、渐变或模式
          //起点移动到位置 x,y
          context.moveTo(this.x,this.y);
          //创建到达位置(this.x+this.width),(this.y-this.height) 的一条线
          context.lineTo(this.x+this.width,this.y-this.height);
          //closePath() 方法创建从当前点到开始点的路径。
          context.closePath();
          //stroke() 方法会实际地绘制出通过 moveTo() 和 lineTo() 方法定义的路径。默认颜色是黑色。
          context.stroke();
          // restore：用来恢复Canvas之前保存的状态
          context.restore();
      }

    //重新计算流星坐标位置
    this.countPos=function(){
        //流星往左下移动，x减少，y增加
        this.x=this.x-this.offset_x;
        this.y=this.y+this.offset_y;

    }

      this.move=function(){
           //清空流星像素
           var x=this.x+this.width-this.offset_x;
           var y=this.y-this.height;
          //clearRect() 方法清空给定矩形内的指定像素。
           context.clearRect(x-3,y-3,this.offset_x+5,this.offset_y+5);
          //调用流星重新计算位置方法,往左下移动
           this.countPos();
          //透明度增加
          this.alpha-=0.002;
          //重绘
          this.draw();
      }

}
 //绘制流星
 function playRains(){

     for(var i=0;i<rainCount;i++){
         var rain=rains[i];
        rain.move();//移动
         if(rain.y>window.innerHeight){//超出界限后重来
           //clearRect() 方法清空给定矩形内的指定像素。
             context.clearRect(rain.x,rain.y-rain.height,rain.width,rain.height);
             rains[i]=new MeteorRain();//创建一个流星对象
             rains[i].init();//调用流星初始化方法
        }
     }
      setTimeout("playRains()",3);//定时每3毫秒调用一次方法
 }


//页面加载
 window.onload=function(){
     init();//调用初始化方法

     //循环画星星
     for(var i=0;i<starCount;i++){
         var star=new Star();//创建一个星星对象
         star.init();//调用星星初始化方法
         star.draw();//调用绘制星星方法
         arr.push(star);//将星星添加到星星数组
     }

     //画流星
     for(var i=0;i<rainCount;i++){
       var rain=new MeteorRain();//创建一个流星对象
        rain.init();//调用流星初始化方法
         rain.draw(); //调用绘制流星方法
         rains.push(rain);//将流星添加到流星数组
     }
    playStars();//调用绘制星星方法
   playRains();//调用绘制流星的方法

}






