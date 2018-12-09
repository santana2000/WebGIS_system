var myChart = echarts.init(document.getElementById('sxmap'));

// 注意引入版本
// 注意不同版本使用差别

var data = [                        //元素为对象的数组
    {name: '太原东山煤矿公司东山煤矿', value: 50.96},
    {name: '阳泉煤业四矿', value: 44.59},
    {name: '山西焦煤集团东曲煤矿', value: 40.71},
    {name: '西山煤电公司西曲矿', value: 38.82},
    {name: '国阳新能二矿', value: 33.28},
	{name: '汾西矿业两渡煤矿', value: 21.32},
    {name: '汾西矿业集团高阳煤矿', value: 20.10},
    {name: '大同煤矿集团刘家良煤矿', value: 18.03},
    {name: '国阳新能一矿', value: 17.63},
	{name: '西山煤电公司白家庄煤矿', value: 15.31 },
	{name: '太原煤气化公司炉峪口煤矿', value: 15.22},
	{name: '山西汾西矿业集团水峪煤矿', value: 15.19},
	{name: '焦煤集团屯兰煤矿', value: 14.60},
	{name: '阳泉荫营煤矿', value: 12.25},
	{name: '霍州煤电集团辛置煤矿', value: 11.54},
	{name: '太原西峪煤矿', value: 11.13},
	{name: '阳泉煤业三矿', value: 10.73},
	{name: '大同煤矿集团六亩地煤矿', value: 9.50},
	{name: '兰花集团北岩矿', value: 6.78},
	{name: '太原煤气化公司嘉乐泉煤矿', value: 5.83},
	{name: '阳泉煤业五矿', value: 5.83},
	{name: '大同煤矿集团云岗矿', value: 5.60},
	{name: '大同煤矿集团梨园河煤矿', value: 5.43},
	{name: '同煤大唐塔山煤矿塔山矿', value: 5.16},
	{name: '山西焦煤集团官地煤矿', value: 5.12},
	{name: '山西汾西新柳煤业', value: 4.72},
	{name: '焦煤集团杜儿坪煤矿', value: 3.90},
	{name: '阳泉固庄煤矿', value: 3.73},
	{name: '汾西正安煤业', value: 3.52},
	{name: '大同煤矿集团焦家寨煤矿', value: 0.39},
	{name: '大同煤矿集团马脊梁矿', value: 0.15},
	{name: '大同煤矿集团四台矿', value: 1.69},
	{name: '大同煤矿集团雁崖煤业', value: 1.70},
	{name: '大同煤矿集团永定庄煤业', value: 3.69},
	{name: '大同煤业同家梁矿', value: 4.69},
	{name: '大同市姜家湾煤矿', value: 3.31},
	{name: '大同市青磁窑煤矿', value: 4.05},
	{name: '晋城晋普山煤矿', value: 3.95},
	{name: '晋城蓝焰煤业成庄矿', value: 2.42},
	{name: '晋城蓝焰煤业古书院煤矿', value: 2.10},
    ];

var geoCoordMap = {                 //对象
    '太原东山煤矿公司东山煤矿':[112.64,37.87],
    '阳泉煤业四矿':[113.53,37.91],
    '山西焦煤集团东曲煤矿':[112.19,37.88],
    '西山煤电公司西曲矿':[112.14,37.94],
	'国阳新能二矿':[113.50,37.85],
    '汾西矿业两渡煤矿':[111.80,36.92],
    '汾西矿业集团高阳煤矿':[111.64,37.15],
    '大同煤矿集团刘家良煤矿':[112.43,38.90],
    '国阳新能一矿':[113.43,37.94],
	'西山煤电公司白家庄煤矿':[112.39,37.80],
	'太原煤气化公司炉峪口煤矿':[112.09,37.97], 
	'山西汾西矿业集团水峪煤矿':[111.61,37.08],
	'焦煤集团屯兰煤矿':[112.11,37.90],
	'阳泉荫营煤矿':[113.52,37.96],
	'霍州煤电集团辛置煤矿':[111.71,36.49],
	'太原西峪煤矿':[112.46,37.82],
	'阳泉煤业三矿':[113.46,37.90],
	'大同煤矿集团六亩地煤矿':[112.44,38.90],
	'兰花集团北岩矿':[112.80,35.51],
	'太原煤气化公司嘉乐泉煤矿':[112.08,37.99],
	'阳泉煤业五矿':[113.53,37.77],
	'大同煤矿集团云岗矿':[113.12,40.09],
	'大同煤矿集团梨园河煤矿':[112.43,38.52],
	'同煤大唐塔山煤矿塔山矿':[113.00,39.97],
	'山西焦煤集团官地煤矿':[112.38,37.76],
	'山西汾西新柳煤业':[111.53,37.04],
	'焦煤集团杜儿坪煤矿':[112.37,37.82],
	'阳泉固庄煤矿':[113.51,38.00],
	'汾西正安煤业':[111.52,37.02],
	'大同煤矿集团焦家寨煤矿':[112.38,38.86],
	'大同煤矿集团马脊梁矿':[112.95,40.02],
	'大同煤矿集团四台矿':[112.99,40.11],
	'大同煤矿集团雁崖煤业':[112.89,40.02],
	'大同煤矿集团永定庄煤业':[113.09,40.02],
	'大同煤业同家梁矿':[113.08,40.01],
	'大同市姜家湾煤矿':[113.06,40.13],
	'大同市青磁窑煤矿':[113.11,40.15],
	'晋城晋普山煤矿':[112.76,35.43],
	'晋城蓝焰煤业成庄矿':[112.67,35.64],
	'晋城蓝焰煤业古书院煤矿':[112.82,35.56],
}

var convertData = function (data) {
    var res = [];
    for (var i = 0; i < data.length; i++) {
        var geoCoord = geoCoordMap[data[i].name];
        if (geoCoord) {
            res.push({
                name: data[i].name,
                value: geoCoord.concat(data[i].value)   //新值= 坐标+旧值；
            });
        }
    }
    return res;                                         // [113.57, 37.85, 31]
};

option = {
    backgroundColor: '#404a59',
    title: {
        text: '矿山灾害点危险性展示',
        left: 'center',
        textStyle: {
            color: '#fff',
            fontSize:25
        }
    },
    tooltip: {           //提示框组件
        trigger: 'item',
        formatter:'{b} <br/> ',  //{c@[2]}
        show:false
    },

    legend: {            //图例
        orient: 'vertical',
        y: 'bottom',
        x: 'right',
        data: ['危害性'],
        textStyle: {
            color: '#fff'
        }
    },
    geo: {
        map: "china",
        label: {
            emphasis: {
                show: false
            }
        },
        roam: true,
        center:[112.38,37.67],
        zoom:7,
        itemStyle: {
            normal: {
                areaColor: "#323c48",
                borderColor: "#000000"
            },
            emphasis: {
                areaColor: "#2a333d"
            }
        }
    },
    series: [{
        name: '危险指数：',
        type: 'effectScatter',
        coordinateSystem: 'geo',
        data: convertData(data.sort(function (a, b) {
            return b.value - a.value;
        }).slice(0, 40)),    //选取从 start 到数组结尾的所有元素，该方法并不会修改数组，而是返回一个子数组
        symbolSize: function (val) {
            return val[2] / 2;        //res数组中的第三个元素
        },
        showEffectOn: 'render',
        rippleEffect: {
            brushType: 'stroke'
        },
        hoverAnimation: true,
        label: {
            normal: {
                formatter: '{b}:{@2}',
                position: 'right',
                show: false
            },
            emphasis: {
                show: true
            }
        },
        itemStyle: {
            normal: {
                color: '#f4e925',
                shadowBlur: 10,
                shadowColor: '#333'
            }
        },
        zlevel: 1
    }
    ]
};

myChart.setOption(option);


/*

a(); 执行一次绘制地图
$(window).resize(function() {   窗口缩放一次
    map.resize();               地图画布缩放一次
    a()                         地图再绘制一次

    */
