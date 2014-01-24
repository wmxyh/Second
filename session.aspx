<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
	<script type="text/javascript">
		var obj = {
			'name': "ww",
			'age': 33
		};
		//定义类
		function myclass() {
			this.name = "www";
			this.age = 23;
			this.GetInfo = function () {
				return 'ddd';
			};
		}
		myclass.address = "road 22";//定义静态属性
		myclass.prototype.sex = 'boy';//定义属性
		//****************************继承**************************//
		function Animal() {
			this.voice = function () {
				alert("哇哇。。");
			};
		}
		Animal.prototype.type = "动物";//把Animal的所有不变属性，都放到它的prototype对象上
		function Cat(name, sex) {
			//Animal.apply(this,arguments);//1.继承，cat 继承 animal
			this.name = name;
			this.sex = sex;
		}
		//2.继承
		//Cat.prototype = new Animal();//指定cat实例对象，对应animal
		//Cat.prototype.constructor = Cat;//指定cat构造函数
		//3.继承,比2效率高，但同样会修改animal属性
		//Cat.prototype = Animal.prototype;
		//Cat.prototype.constructor = Cat;//cat修改，animal也被修改
		//4.继承，利用空对象作为中介
		function extend(child, parent) {
			var temp = function () { };
			temp.prototype = parent.prototype;
			child.prototype = new temp();
			child.prototype.constructor = child;
			child.uber = parent.prototype;
		}
		//5.继承，拷贝继承
		function extend2(child, parent) {
			var p = parent.prototype;
			var c = child.prototype;
			for (var i in p) {
				c[i] = p[i];
			}
			c.uber = p;
		}
		//以上都是构造函数的继承，下面是非构造函数的继承
		var City = {
			nation: "中国"
		};
		var Doctor = {
			career: "医生"
		};
		City.birthaddr = ['北京', '香港', '杭州'];
		//非构造函数浅拷贝
		function lightcopy(p) {
			var c = {};
			for (var i in p) {
				c[i] = p[i];
			}
			return c;
		}
		//非构造函数深拷贝
		function deepcopy(c, p) {
			var c = c || {};
			for (var i in p) {
				if (typeof p[i] === 'object') {
					c[i] = p[i].constructor === Array ? [] : {};
					deepcopy(c[i], p[i]);
				} else {
					c[i] = p[i];
				}
			}
			return c;
		}
		$(function () {
			//extend(Cat, Animal);
			extend2(Cat, Animal);
			var cat1 = new Cat('ann', 44);
			cat1.type = "dds";
			var ami = new Animal();

			//cat1.voice();//第1、2种继承，支持此种调用，其他不支持
			//alert(cat1.type);

			//var Doctor = Object(City);//new Object(City);非构造函数通过object函数继承
			//Doctor.position = "医生1";
			//alert(Doctor.nation);//中国
			//alert(Doctor.birthaddr);
			//Doctor.birthaddr.push('台湾');
			//alert(Doctor.birthaddr+" "+City.birthaddr);

			//var doctor = lightcopy(City);//浅拷贝，doctor改变了doctor继承city的属性，city对应的属性同样被改变
			//doctor.career = "nn";
			//alert(doctor.nation);
			//doctor.birthaddr.push('台湾');
			//alert(doctor.birthaddr+" "+City.birthaddr);

			//var doctor = deepcopy(null,City);//深拷贝，doctor改变了doctor继承city的属性，city对应的属性不变
			//doctor.career = "nn";
			//alert(doctor.nation);
			//doctor.birthaddr.push('台湾');
			//alert(doctor.birthaddr + " " + City.birthaddr);

			var arr = [5, 6, 7];
			//$.each(arr, function (key, item) {//each，回调函数带两个参数是，第一个是key，第二个是value
			//	alert("key="+key+";value="+item);

			//});
			//$.each(arr, function (key) {//each，回调函数带一个参数是，第一个是key
			//	alert("key=" + key );

			//});
			//$.each(arr, function () {//each，回调函数带0个参数,自觉返回value
			//	alert(this);

			//});
			var item = $("#aa").empty();
			$("#bb").append(item);
			$("b").wrap("<font color='red'></font>");
			$(":radio").val(["44"]);
			//$(":radio").click(function (e) {
			//	alert($(this).val());
			//	//e.stopPropagation();//阻止冒泡事件
			//});
			$('#div1').click(function () {
				alert($(this).children(":radio:checked").val());
			});
			 
		});

		//**********************************************************//
		//页面所有元素及css、图片等加载完毕在加载，页面多个此种方法，仅执行最后一个
		//window.onload = function () {
		//	alert("cc");
		//};

		//页面所有元素及css、图片等加载完毕在加载
		//$(window).load( function () {
		//	alert("dd");
		//});
		var a = "a";//全局变量
		b = "b";//隐式全局变量
		var c = 1, d = 2, s = c + d;
		$(function () {
			//var cla = new myclass();
			//var clas = new myclass();
			//alert(cla.sex == clas.sex);//true 内存指向同一地址.cla.name == clas.name返回false，内存地址不一致
			//alert(myclass.prototype.isPrototypeOf(cla));//true 这个方法用来判断，某个proptotype对象和某个实例之间的关系
			//alert(myclass.hasOwnProperty('name'));//true name是myclass本地属性。 myclass.hasOwnProperty('sex') 返回false sex 不是本地属性，继承自prototype对象的属性
			//alert('sex' in cla);//true in运算符用了判断属性是否属于某个实例，不管属性是本地还是继承prototype

			//for (var pp in clas)
			//{
			//	//alert("clas["+pp+"]="+clas[pp]);
			//}
			//alert(cla.name + cla.age+cla.GetInfo()+cla.sex+myclass.address);
			//console.log(cla.age);
			//$.testfun();
			
			//delete a;//false
			//delete b;//true
			//typeof a;//string
			//typeof b;//undefined
			//alert(s);//3
			//c = 2;
			//d = 3;
			//alert(s);//3
			alert(b);//undefined,指向var b;如果下方没有定义b，则输出b
			var b = "bb";
			alert(b);
		});
		function testmaopao()
		{
			//alert("bb");
		}
		$.testfun = function () {
			alert(this());
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<asp:Button ID="btn_set" runat="server" Text="SetSession" OnClick="btn_set_Click" />
			<asp:Button ID="btn_get" runat="server" Text="GetSession" OnClick="btn_get_Click" />
			<br />
			<label>
				session：</label><label runat="server" id="lb_session"></label>
			<b>aa</b> :<input id="aa" type="text" />
			<b>bb</b>:<input id="bb" type="text" />
			<br />
			<div id="div1" onclick="testmaopao()">
				<input type="radio" name="rr" value="11"/>11
			<input type="radio" name="rr" value="22" />22
			<input type="radio" name="rr" value="33" />33
			<input type="radio" name="rr" value="44" />44
			</div>
		</div>
	</form>
</body>
</html>
