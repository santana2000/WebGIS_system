require([
    "esri/Map",
    "esri/views/MapView",
    "esri/Basemap",

    "esri/layers/CSVLayer",
    "esri/layers/WebTileLayer",
    "esri/layers/FeatureLayer",
    "esri/layers/ImageryLayer",
    "esri/layers/GroupLayer",
    "esri/widgets/LayerList",
    "esri/widgets/Print",
    "esri/tasks/Locator",
    "esri/widgets/CoordinateConversion",
    "esri/widgets/Compass",
    "esri/widgets/ScaleBar",
    "dojo/domReady!"

], function(Map,
            MapView,
            Basemap,
            CSVLayer,
            WebTileLayer,
            FeatureLayer,
            ImageryLayer,
            GroupLayer,
            LayerList,
            Print,
            Locator,
            CoordinateConversion,
            Compass,
            ScaleBar
            ){
    var mymapx = new WebTileLayer({
        urlTemplate: "https://cache1.arcgisonline.cn/arcgis/rest/services/ChinaOnlineCommunity/MapServer/tile/{level}/{row}/{col}",
    });

    var mymap = new Basemap({
        baseLayers: [ mymapx ],

    });
    var map = new Map({
        basemap: mymap
    });
    var view = new MapView({
        container: "viewDiv",  // Reference to the scene div created in step 5
        map: map,  // Reference to the map object created before the scene
        zoom: 7,
        center: [112.537674, 37.871594]
    });


    //遥感影像
    var Layer1990 = new ImageryLayer({
        url: "https://localhost:6443/arcgis/rest/services/shanxiyaogan/1990shanxi/ImageServer",
        format: "jpgpng",
        title:"1990",
    });
    var Layer2000 = new ImageryLayer({
        url: "https://localhost:6443/arcgis/rest/services/shanxiyaogan/2000shanxi/ImageServer",
        format: "jpgpng",
        title:"2000",
    });
    var Layer2010 = new ImageryLayer({
        url: "https://localhost:6443/arcgis/rest/services/shanxiyaogan/2010shanxi/ImageServer",
        format: "jpgpng",
        title:"2010",
    });
    var Layer2017 = new ImageryLayer({
        url: "https://localhost:6443/arcgis/rest/services/shanxiyaogan/2017shanxi/ImageServer",
        format: "jpgpng",
        title:"2017",
    });
    var imgGroupLayer = new GroupLayer({
        title: "遥感影像变化",

        visibilityMode: "exclusive",
        layers: [Layer1990,Layer2000,Layer2010,Layer2017],
        opacity: 0.85,
        visible:false
    });
    map.add(imgGroupLayer);


//==============================点图层===================================

//1
    var template1 = {
        title: "矿山情况:",
        content: [
            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "MINE_NAME",
                    label: "矿山名称",
                    visible: true
                }, {
                    fieldName: "CITY",
                    label: "所属城市",
                    visible: true,
                }, {
                    fieldName: "MINE_PERMI",
                    label: "采矿许可证号",
                    visible: true
                }, {
                    fieldName: "ECONOMIC_T",
                    label: "所有制类型",
                    visible: true
                }, {
                    fieldName: "MINERALS_V",
                    label: "矿种",
                    visible: true
                }, {
                    fieldName: "MINE_CREAT",
                    label: "建矿时间",
                    visible: true
                }, {
                    fieldName: "DESIGN_CAP",
                    label: "设计生产能力",
                    visible: true
                }, {
                    fieldName: "DESIGN_SER",
                    label: "设计服务年限",
                    visible: true
                }]
            },
            {
                type: "text",
                text: "<a href='../more/one.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    var mineLayer = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/1mine/MapServer",
        outFields: ["*"],
        popupTemplate: template1,
        title:"矿山情况",
    });
    map.add(mineLayer);
//2
    var template2 = {
        title: "矿山崩塌信息:",
        content: [
            {
            type: "media",
            mediaInfos: [{
                type: "image",
                value: {
                    //sourceURL: "./img/sximg/{PMTX_FILEI}_{PMTX}_看图王.jpg"
                    sourceURL: "../portal/smallimg/2.jpg"

                }
            }

            ]
        },
            {
            type: "fields",
            fieldInfos: [{
                fieldName: "RECID_NAME",
                label: "所属矿山",
                visible: true
            }, {
                fieldName: "HAPPEN_FLA",
                label: "是否发生",
                visible: true,
            }, {
                fieldName: "HAPPEN_DAT",
                label: "发生时间",
                visible: true
            }, {
                fieldName: "COLLAPSE_T",
                label: "崩塌类型",
                visible: true
            }, {
                fieldName: "SLOPE_TYPE",
                label: "斜坡类型",
                visible: true
            }, {
                fieldName: "TOP_EVEVAT",
                label: "斜坡高程",
                visible: true
            }, {
                fieldName: "BUTTOM_EVE",
                label: "坡底高程",
                visible: true
            }, {
                fieldName: "MEMO",
                label: "崩塌描述",
                visible: true
            }]
        },
            {
                type: "text",
                text: "<a href='../more/puuid.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer2 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/2col/MapServer",
        outFields: ["*"],
        popupTemplate: template2,
        title:"矿山崩塌",

    });
    map.add(pointLayer2);

//3
    var template3 = {
        title: "矿山滑坡信息:",
        content: [
            {
                type: "media",
                mediaInfos: [{
                    type: "image",
                    value: {
                        //sourceURL: "./img/sximg/{PMTX_FILEI}_{PMTX}_看图王.jpg"
                        sourceURL: "../portal/smallimg/3.jpg"
                    }
                }
                ]
            },
            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "RECID_NAME",
                    label: "所属矿山",
                    visible: true
                }, {
                    fieldName: "HAPPEN_FLA",
                    label: "是否发生",
                    visible: true,
                }, {
                    fieldName: "HAPPEN_DAT",
                    label: "发生时间",
                    visible: true
                }, {
                    fieldName: "SLIDE_TYPE",
                    label: "滑坡类型",
                    visible: true
                }, {
                    fieldName: "TOP_EVEVAT",
                    label: "坡顶高程",
                    visible: true
                }, {
                    fieldName: "BUTTOM_EVE",
                    label: "坡底高程",
                    visible: true
                }, {
                    fieldName: "SLIDE_LENG",
                    label: "滑坡长度",
                    visible: true
                },{
                    fieldName: "SLIDE_WIDT",
                    label: "滑坡宽度",
                    visible: true
                },{
                    fieldName: "SLIDE_THIC",
                    label: "滑坡厚度",
                    visible: true
                },{
                    fieldName: "SLIDE_AREA",
                    label: "滑坡面积",
                    visible: true
                },{
                    fieldName: "SLIDE_VOLU",
                    label: "滑坡体积",
                    visible: true
                },{
                    fieldName: "MEMO",
                    label: "滑坡描述",
                    visible: true
                },]
            },
            {
                type: "text",    //相对于js文件的路径
                text: "<a href='../more/slide.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer3 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/3slide/MapServer",
        outFields: ["*"],
        popupTemplate: template3,
        title:"矿山滑坡",

    });
    map.add(pointLayer3);
//4
    var template4 = {
        title: "矿山泥石流信息:",
        content: [
            {
                type: "media",
                mediaInfos: [{
                    type: "image",
                    value: {
                        sourceURL: "../portal/smallimg/4.jpg"
                    }
                }
                ]
            },
            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "RECID_NAME",
                    label: "所属矿山",
                    visible: true
                }, {
                    fieldName: "HAPPEN_FLA",
                    label: "是否发生",
                    visible: true,
                }, {
                    fieldName: "HAPPEN_DAT",
                    label: "发生时间", //
                    visible: true
                }, {
                    fieldName: "EVEVATION",
                    label: "高程",
                    visible: true
                }, {
                    fieldName: "WATER_POWER",
                    label: "水动力类型", //
                    visible: true
                }, {
                    fieldName: "MEMO",
                    label: "泥石流描述",
                    visible: true
                },]
            },
            {
                type: "text",
                text: "<a href='../more/debris.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer4 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/4debry/MapServer",
        outFields: ["*"],
        popupTemplate: template4,
        title:"矿山泥石流",

    });
    map.add(pointLayer4);
//5
    var template5 = {
        title: "矿山地面塌陷信息:",
        content: [
            {
                type: "media",
                mediaInfos: [{
                    type: "image",
                    value: {
                        sourceURL: "../portal/smallimg/5.jpg"
                    }
                }
                ]
            },
            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "RECID_NAME",
                    label: "所属矿山",
                    visible: true
                }, {
                    fieldName: "PIT_NUMBER",
                    label: "塌陷坑数量",
                    visible: true,
                }, {
                    fieldName: "SINK_AREA",
                    label: "塌陷坑面积",
                    visible: true
                }, {
                    fieldName: "FISSURE_NU",
                    label: "地裂缝数",
                    visible: true
                }, {
                    fieldName: "FISSURE_AR",
                    label: "地裂缝面积",
                    visible: true
                }, {
                    fieldName: "MEMO",
                    label: "地面塌陷描述",
                    visible: true
                },{
                    fieldName: "SOIL_PROPE",
                    label: "地貌土性",
                    visible: true
                },{
                    fieldName: "ROCK_PROPE",
                    label: "地貌岩性",
                    visible: true
                }]
            },
            {
                type: "text",
                text: "<a href='../more/sink.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer5 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/5sink/MapServer",
        outFields: ["*"],
        popupTemplate: template5,
        title:"矿山地面塌陷",
    });
    map.add(pointLayer5);
//6
    var template6 = {
        title: "地下含水层与破坏信息:",
        content: [
            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "RECID_NAME",
                    label: "所属矿山",
                    visible: true
                }, {
                    fieldName: "PIT_TONAGE",
                    label: "矿坑排水量",
                    visible: true,
                }, {
                    fieldName: "PIT_DRAIN_",
                    label: "矿坑最低排水点高程",
                    visible: true
                }, {
                    fieldName: "WATER_DROP",
                    label: "地下水位下降区面积",
                    visible: true
                }, {
                    fieldName: "DROP_RANGE",
                    label: "周边井泉水位下降幅度",
                    visible: true
                }, {
                    fieldName: "DXSZYWRW",
                    label: "地下水主要污染物",
                    visible: true
                }]
            },
            {
                type: "text",
                text: "<a href='../more/water.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };

    var pointLayer6 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/6aquifer/MapServer",
        outFields: ["*"],
        popupTemplate: template6,
        title:"地下含水层与破坏",
    });
    map.add(pointLayer6);
//7
    var template7 = {
        title: "地形地貌与土地破坏信息:",
        content: [

            {
                type: "fields",
                fieldInfos: [
                    {
                        fieldName: "RECID_NAME",
                        label: "矿山名称",
                        visible: true
                    },{
                        fieldName: "CITY_INF_1",
                        label: "景观破坏距离城市距离",
                        visible: true
                    }, {
                        fieldName: "ROAD_DISTA",
                        label: "景观破坏距交通干线距离",
                        visible: true,
                    }, {
                        fieldName: "MEMO",
                        label: "文字描述",
                        visible: true
                }]
            },
            {
                type: "text",
                text: "<a href='../more/destroy.jsp' target='_blank'>点击此处获取详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer7 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/7destroy/MapServer",
        outFields: ["*"],
        popupTemplate: template7,
        title:"地形地貌与土地破坏",
    });
    map.add(pointLayer7);
//8
    var template8 = {
        title: "矿山三废信息:",
        content: [

            {
                type: "fields",
                fieldInfos: [{
                    fieldName: "RECID_NAME",
                    label: "矿山名称",
                    visible: true
                }, {
                    fieldName: "MEMO",
                    label: "总体描述",
                    visible: true
                }]
            },
            {
                type: "text",
                text: "<a href='../more/waste.jsp' target='_blank'>点击此处获取崩塌信息详情</a>"
            }
        ]
    };
    //崩塌点图层
    var pointLayer8 = new FeatureLayer({
        url: "https://localhost:6443/arcgis/rest/services/newlayer/8waste/MapServer",
        outFields: ["*"],
        popupTemplate: template8,
        title:"矿山三废",
    });
    map.add(pointLayer8);

    var mineGroupLayer = new GroupLayer({
        title: "矿山信息",

        visibilityMode: "exclusive",
        layers: [pointLayer8,pointLayer7,pointLayer6,pointLayer5,pointLayer4,
            pointLayer3,pointLayer2,mineLayer],
        opacity: 0.85,
        visible:false
    });
    map.add(mineGroupLayer);
    //==============================点图层=================================================


    //==============================核密度热力图============================================
    const renderer = {
        type: "heatmap",
        colorStops: [
            {
                color: "rgba(63, 40, 102, 0)",
                ratio: 0
            },
            {
                color: "#472b77",
                ratio: 0.083
            },
            {
                color: "#4e2d87",
                ratio: 0.166
            },
            {
                color: "#563098",
                ratio: 0.249
            },
            {
                color: "#5d32a8",
                ratio: 0.332
            },
            {
                color: "#6735be",
                ratio: 0.415
            },
            {
                color: "#7139d4",
                ratio: 0.498
            },
            {
                color: "#7b3ce9",
                ratio: 0.581
            },
            {
                color: "#853fff",
                ratio: 0.664
            },
            {
                color: "#a46fbf",
                ratio: 0.747
            },
            {
                color: "#c29f80",
                ratio: 0.830
            },
            {
                color: "#e0cf40",
                ratio: 0.913
            },
            {
                color: "#ffff00",
                ratio: 1
            }],
        blurRadius:14,
        maxPixelIntensity: 50,
        minPixelIntensity: 0
    };

    const csv2 = new CSVLayer({
        url: '../portal/csv/2col.csv',
       // popupTemplate: template,
        renderer: renderer,
        opacity:0.85,
        visible:false,
        title:'崩塌点核密度'
    });
    map.add(csv2);
    const csv3 = new CSVLayer({
        url: '../portal/csv/3sli.csv',
       // popupTemplate: template,
        renderer: renderer,
        opacity:0.85,
        visible:false,
        title:'滑坡点核密度'
    });
    map.add(csv3);
    const csv4 = new CSVLayer({
        url: '../portal/csv/4deb.csv',
        // popupTemplate: template,
        renderer: renderer,
        opacity:0.85,
        visible:false,
        title:'泥石流核密度'
    });
    map.add(csv4);
    const csv5 = new CSVLayer({
        url: '../portal/csv/5sin.csv',
        // popupTemplate: template,
        renderer: renderer,
        opacity:0.85,
        visible:false,
        title:'地面塌陷点核密度'
    });
    map.add(csv5);
    var csvGroupLayer = new GroupLayer({
        title: "热力图",
        visibilityMode: "exclusive",
        layers: [csv5,csv4,csv3,csv2],
        opacity: 0.85,
        visible:false
    });
    map.add(csvGroupLayer);


    var layerList = new LayerList({
        view: view
    });
    view.ui.add(layerList, "top-right");

    var print = new Print({
        view: view,
        //templateOptions:templateOptions,
        //printServiceUrl: "https://utility.arcgisonline.com/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
        printServiceUrl: "https://localhost:6443/arcgis/rest/services/Utilities/PrintingTools/GPServer/Export%20Web%20Map%20Task"
                          //https://localhost:6443/arcgis/rest/services/Utilities/PrintingTools/GPServer
    });
    // //地图打印
    // var templateOptions = new TemplateOptions({
        //     title: "My Print",
        //     author: "Sam",
        //     copyright: "Shanxi",
        //     format:"pdf",
        //     //layout: "map-only",
        //     legendEnabled: false
        // });
    view.ui.add(print, "top-right");



    //-----------位置坐标--------------
    var ccWidget = new CoordinateConversion({
        view: view
    });
    view.ui.add(ccWidget, "bottom-right");

    //------------比例尺--------------
    var scaleBar = new ScaleBar({
        view: view,
        unit: "metric"// The scale bar displays both metric and non-metric units.
        //style:"ruler"
    });
    view.ui.add(scaleBar, "bottom-right");

    //------------缩放、指南针--------------
    view.ui.move("zoom", "top-right");
    var compassWidget = new Compass({
        view: view
    });
    view.ui.add(compassWidget, "top-right");
    view.ui.add('scale', "top-right");

});

//jQuery制作左侧工具栏点击效果
$(function () {
    $('.gis').on('click', function () {
        if ($(this).children('.tools').is(':visible')) {
            $(this).children('.tools').slideUp();
            //测试 console.log($('.gis'));

        } else {
            $(this).children('.tools').slideDown();
        }
    });

    $('#switch').on('click', function () {
        $('.gisFunc').slideToggle("normal");
    });

    $('#lyr_c').on('click', function () {
        $('.esri-layer-list').slideToggle("normal");
    });

    $('#output').on('click', function () {
        $('.esri-print').slideToggle("normal");
    });
});

