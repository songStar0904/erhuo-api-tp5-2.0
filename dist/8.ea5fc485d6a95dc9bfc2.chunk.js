webpackJsonp([8],{134:function(t,e,r){"use strict";function s(t){a||r(202)}Object.defineProperty(e,"__esModule",{value:!0});var n=r(174),o=r(203),a=!1,u=r(0),i=s,l=u(n.a,o.a,!1,i,"data-v-ca8e4268",null);l.options.__file="src\\views\\user\\login.vue",e.default=l.exports},147:function(t,e,r){"use strict";e.a={props:["title","router","h1","btn_text"],methods:{change_router:function(){this.$router.push({name:this.router})}}}},154:function(t,e,r){"use strict";var s=r(147),n=r(155),o=r(0),a=o(s.a,n.a,!1,null,null,null);a.options.__file="src\\views\\user\\user-components\\layout.vue",e.a=a.exports},155:function(t,e,r){"use strict";var s=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("Card",{staticStyle:{width:"800px",height:"500px",margin:"50px auto"},attrs:{padding:30}},[r("Row",[r("Col",{staticStyle:{padding:"0 80px"},attrs:{span:"16"}},[r("Menu",{attrs:{mode:"horizontal",theme:"light","active-name":"1"}},[r("MenuItem",{attrs:{name:"1"}},[r("Icon",{attrs:{type:"ios-eamil"}}),t._v("\n\t\t\t            "+t._s(t.title)+"\n\t\t\t        ")],1)],1),t._v(" "),t._t("form")],2),t._v(" "),r("Col",{staticStyle:{"margin-top":"50px",padding:"150px 30px","border-left":"1px solid #dddee1"},attrs:{span:"8"}},[r("p",[t._v(t._s(t.h1))]),t._v(" "),r("Button",{attrs:{type:"text"},on:{click:t.change_router}},[t._v(t._s(t.btn_text))])],1)],1)],1)},n=[];s._withStripped=!0;var o={render:s,staticRenderFns:n};e.a=o},174:function(t,e,r){"use strict";var s=r(4),n=r(50),o=r.n(n),a=r(154);e.a={components:{layout:a.a},data:function(){return{userForm:{user_name:"",user_psd:""},ruleInline:{user_name:[{required:!0,message:"输入用户名",trigger:"blur"}],user_psd:[{validator:function(t,e,r){e.length<6||e.length>10?r(new Error("请输入6-10位密码")):/^[a-z0-9_-]{6,10}$/.test(e)?r():r(new Error("（只能包含数字字母_）"))},trigger:"blur"}]}}},methods:{handleSubmit:function(t){var e=this;this.$refs[t].validate(function(t){if(t){var r=s.a.cloneObj(e.userForm);r.user_psd=o()(e.userForm.user_psd),e.$fetch.user.login(r).then(function(t){200===t.code?(e.$Message.info(t.msg),e.$store.commit("setUser",s.a.formatUserData(t.data)),e.$store.commit("setIslogin",1),e.$router.push({name:"home"})):e.$Message.error(t.msg)})}else e.$Message.error("请填写正确表单")})},forget:function(){this.$router.push({name:"forget"})}}}},202:function(t,e){},203:function(t,e,r){"use strict";var s=function(){var t=this,e=t.$createElement,r=t._self._c||e;return r("layout",{attrs:{title:"用户登录",router:"regist",h1:"没有二货账号",btn_text:"立即注册"}},[r("Form",{ref:"userForm",staticStyle:{padding:"30px 0"},attrs:{slot:"form",model:t.userForm,"label-width":80,rules:t.ruleInline},slot:"form"},[r("FormItem",{attrs:{label:"手机 / 邮箱",prop:"user_name"}},[r("Input",{attrs:{placeholder:"请输入您的手机号码或邮箱..."},model:{value:t.userForm.user_name,callback:function(e){t.$set(t.userForm,"user_name",e)},expression:"userForm.user_name"}})],1),t._v(" "),r("FormItem",{attrs:{label:"密码",prop:"user_psd"}},[r("Input",{attrs:{type:"password",placeholder:"请输入您的密码..."},model:{value:t.userForm.user_psd,callback:function(e){t.$set(t.userForm,"user_psd",e)},expression:"userForm.user_psd"}})],1),t._v(" "),r("Row",{attrs:{type:"flex",justify:"end"}},[r("p",{staticClass:"text-success btn",staticStyle:{"margin-bottom":"20px"},on:{click:t.forget}},[t._v("忘记密码？")])]),t._v(" "),r("FormItem",[r("Button",{attrs:{type:"primary",long:""},on:{click:function(e){t.handleSubmit("userForm")}}},[t._v("登  录")])],1)],1)],1)},n=[];s._withStripped=!0;var o={render:s,staticRenderFns:n};e.a=o}});