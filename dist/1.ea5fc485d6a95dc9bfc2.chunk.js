webpackJsonp([1],{156:function(t,s,e){"use strict";var o=e(3);s.a={components:{delModal:o.b},props:["data","isOwn"],data:function(){return{}},methods:{follow:function(t){var s=this;this.$fetch.goods.follow({followers_id:t}).then(function(t){200===t.code?s.data.is_fans=t.data:s.$Message.error(t.msg)})},onClick:function(t){0===t?this.$refs.del.openModal():1===t&&this.sold_goods()},del_goods:function(){var t=this;this.$fetch.goods.del({goods_id:this.data.goods_id}).then(function(s){200===s.code?(t.$refs.del.closeModal(),t.$Message.success(s.msg),t.$emit("del_goods")):t.$Message.error(s.msg)})},sold_goods:function(){var t=this;this.$fetch.user.sold_goods({goods_id:this.data.goods_id}).then(function(s){200===s.code?t.$Message.success(s.msg):t.$Message.error(s.msg)})}},computed:{uid:function(){if(this.$store.state.user.info)return this.$store.state.user.info.user_id}}}},157:function(t,s,e){"use strict";function o(t){n||e(170)}var a=e(156),i=e(171),n=!1,r=e(0),d=o,c=r(a.a,i.a,!1,d,"data-v-933cd5ca",null);c.options.__file="src\\views\\main-components\\goods-uitem.vue",s.a=c.exports},170:function(t,s){},171:function(t,s,e){"use strict";var o=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("Card",{attrs:{"dis-hover":!0}},[e("Row",{attrs:{gutter:16}},[e("Col",{attrs:{span:"8"}},[e("img",{staticStyle:{width:"145px",height:"145px"},attrs:{src:t.data.goods_icon[0].url,alt:t.data.goods_name}})]),t._v(" "),e("Col",{attrs:{span:"16"}},[e("div",{staticClass:"clearfix goods_info"},[e("router-link",{staticClass:"fl",attrs:{to:{name:"goods",params:{gid:t.data.goods_id}},target:"_blank"}},[e("h3",{staticClass:"goods_name text-success"},[t._v(t._s(t.data.goods_name))])]),t._v(" "),t.data.user.id==t.uid?e("Dropdown",{staticClass:"more fr",attrs:{trigger:"click"},on:{"on-click":t.onClick}},[e("a",{attrs:{href:"javascript:void(0)"}},[e("Icon",{staticStyle:{"font-size":"20px"},attrs:{type:"ios-more"}})],1),t._v(" "),e("DropdownMenu",{attrs:{slot:"list"},slot:"list"},[e("DropdownItem",{attrs:{name:0}},[t._v("删除")]),t._v(" "),e("DropdownItem",{attrs:{name:1}},[t._v("下架")])],1)],1):t._e()],1),t._v(" "),e("Row",{staticClass:"mt10"},[e("Col",{attrs:{span:"5"}},[e("p",[t._v("分类：")])]),t._v(" "),e("Col",{attrs:{span:"6"}},[e("p",[t._v(t._s(t.data.gclassify.name))])])],1),t._v(" "),e("Row",{staticClass:"mt10"},[e("Col",{attrs:{span:"5"}},[e("p",[t._v("现价：")])]),t._v(" "),e("Col",{attrs:{span:"6"}},[e("p",[t._v("￥"+t._s(t.data.goods_nprice)+" 元")])]),t._v(" "),e("Col",{attrs:{span:"5"}},[t._v("原价：")]),t._v(" "),e("Col",{staticClass:"oprice",attrs:{span:"6"}},[t._v("￥"+t._s(t.data.goods_oprice)+" 元")])],1),t._v(" "),e("div",{staticClass:"mt15"},[e("Button",{staticClass:"mr30",attrs:{icon:"heart",type:t.data.is_fans?"warning":"ghost"},on:{click:function(s){t.follow(t.data.goods_id)}}},[t._v(t._s(t.data.is_fans?"已":"")+"收藏")]),t._v(" "),t.isOwn?e("router-link",{attrs:{to:{name:"gedit",params:{gid:t.data.goods_id}},target:"_blank"}},[e("Button",{staticClass:"w100",attrs:{icon:"compose",type:"success"}},[t._v("编辑")])],1):e("Button",{staticClass:"w100",attrs:{icon:"card",type:"success"}},[t._v("购买")])],1)],1)],1),t._v(" "),e("del-modal",{ref:"del",attrs:{type:1,id:t.data.goods_id},on:{delGoods:t.del_goods}})],1)},a=[];o._withStripped=!0;var i={render:o,staticRenderFns:a};s.a=i},180:function(t,s,e){"use strict";var o=e(157);s.a={components:{goodsUitem:o.a},data:function(){return{data:[],page:1,total:0,num:5}},computed:{uid:function(){return this.$route.params.uid?this.$route.params.uid:this.user_id},user_id:function(){if(this.$store.state.user.info)return this.$store.state.user.info.user_id},isOwn:function(){return this.user_id===this.uid},type:function(){return this.$route.meta.type}},watch:{type:function(){this.init()}},mounted:function(){this.init()},methods:{init:function(){"sell"===this.type?this.getGoods():this.get_followers()},getGoods:function(){var t=this;this.$fetch.goods.get({uid:this.uid,page:this.page}).then(function(s){200===s.code?(t.data=s.data,t.total=s.total):t.$Message.error(s.msg)})},get_followers:function(){var t=this;this.$fetch.goods.get_followers({user_id:this.uid,page:this.page}).then(function(s){200===s.code?(t.data=s.data,t.total=s.total):t.$Message.error(s.msg)})},publish:function(){this.$router.push({name:"publish"})},changePage:function(t){this.page=t,this.init()}}}},211:function(t,s,e){"use strict";var o=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[0==t.data.length?e("div",{staticStyle:{"text-align":"center"}},[e("p",{staticStyle:{margin:"50px 0"}},[t._v("没有找到任何二货哦~")]),t._v(" "),t.user_id===t.uid&&"sell"===t.type?e("Button",{attrs:{type:"success"},on:{click:t.publish}},[t._v("现在发布")]):t._e()],1):e("div",[e("Row",{attrs:{type:"flex",justify:"end"}},[e("Page",{attrs:{total:t.total,"show-total":"","show-elevator":"",size:"small",current:t.page,"page-size":t.num},on:{"on-change":t.changePage}})],1),t._v(" "),t._l(t.data,function(s,o){return e("goods-uitem",{key:o,staticStyle:{margin:"20px 0"},attrs:{data:s,isOwn:t.isOwn},on:{del_goods:t.getGoods}})}),t._v(" "),e("Row",{attrs:{type:"flex",justify:"end"}},[e("Page",{attrs:{total:t.total,"show-total":"","show-elevator":"",size:"small",current:t.page,"page-size":t.num},on:{"on-change":t.changePage}})],1)],2)])},a=[];o._withStripped=!0;var i={render:o,staticRenderFns:a};s.a=i},7:function(t,s,e){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var o=e(180),a=e(211),i=e(0),n=i(o.a,a.a,!1,null,null,null);n.options.__file="src\\views\\user\\sell.vue",s.default=n.exports}});