webpackJsonp([6],{141:function(t,a,s){"use strict";Object.defineProperty(a,"__esModule",{value:!0});var o=s(187),e=s(237),n=s(0),r=n(o.a,e.a,!1,null,null,null);r.options.__file="src\\views\\goods\\index.vue",a.default=r.exports},187:function(t,a,s){"use strict";var o=s(3),e=s(228),n=s(231),r=s(234),i=s(4);a.a={components:{userCard:o.j,folSend:o.c,goodsBox:e.a,dashBoard:n.a,userSell:r.a},data:function(){return{data:null,info:{},show:!1}},created:function(){this.getData()},methods:{getData:function(){var t=this;this.$fetch.goods.get_one({goods_id:this.$route.params.gid}).then(function(a){200===a.code?(t.data=i.a.formatGoodsData(a.data),t.info=i.a.formatUserData(i.a.setData("user",t.data.user)),t.show=!0):t.$Message.error(a.msg)})},updateFansNum:function(t){var a=t?1:-1;this.data.fans_num=this.data.fans_num+a},updateFans:function(t){this.info.user_is_fans=t}}}},188:function(t,a,s){"use strict";var o=s(51),e=s(3);a.a={components:{commentBox:o.a,reportModal:e.h},props:["data"],data:function(){return{value:0,active:"detail"}},methods:{follow:function(t){var a=this;this.$fetch.goods.follow({followers_id:t,user_id:this.user_id}).then(function(t){200===t.code?(a.data.is_fans=t.data,a.$emit("updateFansNum",t.data)):a.$Message.error(t.msg)})},changeMeau:function(t){this.active=t},openModal:function(){this.$refs.report.openModal()}}}},189:function(t,a,s){"use strict";a.a={props:["view","fans_num","msg_num"]}},190:function(t,a,s){"use strict";a.a={props:["uid"],data:function(){return{data:[],randomData:[],loading:!1,total:0}},mounted:function(){this.getData()},methods:{getData:function(){var t=this;this.$fetch.goods.get({uid:this.uid,num:8}).then(function(a){200===a.code?(t.data=a.data,t.total=a.total,t.changeData()):t.$Message.error(a.msg)})},changeData:function(){var t=this;this.randomData=function(a,s){t.loading=!0;var o=[];for(var e in a)o.push(a[e]);for(var n=[],r=0;r<s&&o.length>0;r++){var i=Math.floor(Math.random()*o.length);n[r]=o[i],o.splice(i,1)}return setTimeout(function(){t.loading=!1},0),n}(this.data,4)}}}},228:function(t,a,s){"use strict";function o(t){r||s(229)}var e=s(188),n=s(230),r=!1,i=s(0),l=o,d=i(e.a,n.a,!1,l,"data-v-efaf68cc",null);d.options.__file="src\\views\\goods\\goods-components\\goodsBox.vue",a.a=d.exports},229:function(t,a){},230:function(t,a,s){"use strict";var o=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("Card",{attrs:{"dis-hover":!0}},[s("span",{staticClass:"text-sub",attrs:{slot:"title"},slot:"title"},[t._v("\n\t\t"+t._s(t.data.goods_time)+" "),s("span",{staticClass:"fr report btn",on:{click:t.openModal}},[s("Icon",{attrs:{type:"alert-circled"}}),t._v(" 举报")],1)]),t._v(" "),s("Row",{attrs:{gutter:20}},[s("Col",{attrs:{span:12}},[s("Carousel",{attrs:{height:350,loop:""},model:{value:t.value,callback:function(a){t.value=a},expression:"value"}},t._l(t.data.goods_icon,function(t,a){return s("CarouselItem",{key:a},[s("img",{staticStyle:{width:"339px",height:"100%"},attrs:{src:t.url,alt:""}})])}))],1),t._v(" "),s("Col",{attrs:{span:12}},[s("h2",[t._v(t._s(t.data.goods_name))]),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("分类")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.gclassify.name))])])],1),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("现价")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",{staticClass:"nprice"},[t._v("￥ "+t._s(t.data.goods_nprice))])])],1),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("原价")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",{staticClass:"oprice"},[t._v("￥ "+t._s(t.data.goods_oprice))])])],1),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("交易地址")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.goods_address))])])],1),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("交易方式")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.goods_type))])])],1),t._v(" "),t.data.phone?s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("联系方式")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.phone))])])],1):t._e(),t._v(" "),t.data.qq?s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("QQ")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.qq))])])],1):t._e(),t._v(" "),t.data.wechat?s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("p",[t._v("微信")])]),t._v(" "),s("Col",{attrs:{span:"16"}},[s("p",[t._v(t._s(t.data.wechat))])])],1):t._e(),t._v(" "),s("Row",{staticClass:"mt10"},[s("Col",{staticClass:"pl0",attrs:{span:"8"}},[s("Button",{staticClass:"mr30",attrs:{icon:"heart",type:t.data.is_fans?"warning":"ghost"},on:{click:function(a){t.follow(t.data.goods_id)}}},[t._v(t._s(t.data.is_fans?"已":"")+"收藏")])],1),t._v(" "),s("Col",{attrs:{span:"16"}},[s("Button",{attrs:{type:"success"}},[t._v("联系卖家")])],1)],1)],1)],1),t._v(" "),s("Menu",{attrs:{mode:"horizontal","active-name":t.active},on:{"on-select":t.changeMeau}},[s("MenuItem",{attrs:{name:"detail"}},[s("Icon",{attrs:{type:"ios-paper"}}),t._v("\n\t            商品详情\n\t        ")],1),t._v(" "),s("MenuItem",{attrs:{name:"lmsg"}},[s("Icon",{attrs:{type:"chatbox-working"}}),t._v("\n\t            留言("+t._s(t.data.goods_lmsg.length)+")\n\t        ")],1)],1),t._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:"detail"===t.active,expression:"active === 'detail'"}],staticClass:"detailBox mt10"},[t._v("\n\t\t"+t._s(t.data.goods_summary)+"\n    ")]),t._v(" "),s("div",{directives:[{name:"show",rawName:"v-show",value:"lmsg"===t.active,expression:"active === 'lmsg'"}],staticClass:"lmsgBox mt10"},[s("comment-box",{attrs:{data:t.data.goods_lmsg,id:t.data.goods_id,rid:t.data.user.id,type:"goods"}})],1),t._v(" "),s("report-modal",{ref:"report",attrs:{type:1,id:t.data.goods_id}})],1)},e=[];o._withStripped=!0;var n={render:o,staticRenderFns:e};a.a=n},231:function(t,a,s){"use strict";function o(t){r||s(232)}var e=s(189),n=s(233),r=!1,i=s(0),l=o,d=i(e.a,n.a,!1,l,"data-v-5fd92bbf",null);d.options.__file="src\\views\\goods\\goods-components\\dashBoard.vue",a.a=d.exports},232:function(t,a){},233:function(t,a,s){"use strict";var o=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("Card",{attrs:{"dis-hover":!0}},[s("Row",{staticClass:"main"},[s("Col",{staticClass:"text-warning",attrs:{span:"12"}},[s("Icon",{attrs:{type:"eye"}}),t._v(" "+t._s(t.view))],1),t._v(" "),s("Col",{staticClass:"text-error",attrs:{span:"12"}},[s("Icon",{attrs:{type:"heart"}}),t._v(" "+t._s(t.fans_num))],1)],1)],1)},e=[];o._withStripped=!0;var n={render:o,staticRenderFns:e};a.a=n},234:function(t,a,s){"use strict";function o(t){r||s(235)}var e=s(190),n=s(236),r=!1,i=s(0),l=o,d=i(e.a,n.a,!1,l,"data-v-11dea2c2",null);d.options.__file="src\\views\\goods\\goods-components\\userSell.vue",a.a=d.exports},235:function(t,a){},236:function(t,a,s){"use strict";var o=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("Card",{attrs:{"dis-hover":!0}},[s("p",{attrs:{slot:"title"},slot:"title"},[s("router-link",{attrs:{to:{name:"sell",params:{uid:t.uid}}}},[s("Icon",{attrs:{type:"android-playstore"}}),t._v("\n\t            TA 的出售\n\t            "),s("Badge",{attrs:{count:t.total,"class-name":"bd-disabled"}})],1)],1),t._v(" "),s("span",{staticClass:"btn",attrs:{slot:"extra"},on:{click:t.changeData},slot:"extra"},[t._v("\n        \t换一波\n            "),s("Icon",{attrs:{type:"ios-loop-strong"}})],1),t._v(" "),s("Row",{attrs:{gutter:15}},[t.loading?s("Spin",{attrs:{fix:""}}):t._e(),t._v(" "),t._l(t.randomData,function(t,a){return s("Col",{key:a,staticClass:"mt10",attrs:{span:"12"}},[s("router-link",{attrs:{to:{name:"goods",params:{gid:t.goods_id}}}},[s("img",{staticClass:"goods_icon",attrs:{src:t.goods_icon[0].url,alt:""}})])],1)})],2)],1)},e=[];o._withStripped=!0;var n={render:o,staticRenderFns:e};a.a=n},237:function(t,a,s){"use strict";var o=function(){var t=this,a=t.$createElement,s=t._self._c||a;return s("div",{staticClass:"box"},[s("Row",{attrs:{gutter:50}},[s("Col",{attrs:{span:"17"}},[s("goods-box",{attrs:{data:t.data},on:{updateFansNum:t.updateFansNum}})],1),t._v(" "),s("Col",{attrs:{span:"7"}},[s("Card",{staticClass:"mb30",attrs:{"dis-hover":!0}},[s("user-card",{attrs:{info:t.info,loading:!1}})],1),t._v(" "),s("dash-board",{staticClass:"mb30",attrs:{view:t.data.goods_view,fans_num:t.data.fans_num,msg_num:10}}),t._v(" "),t.show?s("user-sell",{attrs:{uid:t.info.user_id}}):t._e()],1)],1)],1)},e=[];o._withStripped=!0;var n={render:o,staticRenderFns:e};a.a=n}});