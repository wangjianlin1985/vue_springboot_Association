<template>
  <div id="app">
    <!-- 顶部导航栏 -->
    <div class="app_nav">
      <div class="content">
        <img class="logo" src="./assets/img/logo.png" alt="华中科技大学logo" />
        <img src="./assets/img/title.png" alt="社团联盟系统" style="with:290px;" />
        <ul style="flex:1;">
          <li>
            <router-link to="/index">首页</router-link>
          </li>
          <li>
            <router-link to="/teams">社团</router-link>
          </li>
          <li>
            <router-link to="/activity">活动</router-link>
          </li>
          <li>
            <router-link to="/about_us">关于我们</router-link>
          </li>
        </ul>
        <Login></Login>
      </div>
    </div>
    <div style="margin-top:80px;">
      <router-view />
    </div>
    <!-- 公众号 -->
    <div class="home wechat">
      <img
        :src="wechat_url"
        alt="微信logo"
        @mouseover="wechat_url='./static/school_wechat.jpg'"
        @mouseleave="wechat_url='./static/wechat_logo.png'"
      />
    </div>
    <div class="layout-copy">
      2020-至今 &copy; ClaireCCTJ
    </div>
    <Back-top :height="100"></Back-top>
  </div>
</template>

<script>
import Login from "./components/view/login";
export default {
  name: "App",
  data() {
    return {
      wechat_url: "./static/wechat_logo.png"
    };
  },
  components: {
    Login
  }
};
</script>

<style lang="scss">
.app_nav {
  position: fixed;
  top: 0;
  width: 100%;
  height: 80px;
  box-shadow: 0px 7px 7px -7px #949494;
  z-index: 100;
  background-color: #eeeeee;
}
.app_nav .content {
  width: 80%;
  height: 100%;
  margin: 0 auto;
  display: flex;
  align-items: center;
}
.app_nav .content .logo {
  width: 80px;
  height: 60px;
}
.app_nav .content ul li {
  list-style: none; /* 将默认的列表符号去掉 */
  padding: 0; /* 将默认的内边距去掉 */
  margin: 0; /* 将默认的外边距去掉 */
  float: left; /* 往左浮动 */
  display: block;
}
.app_nav .content ul li a {
  font-size: 20px;
  font-weight: bold;
  color: $base_color;
  margin-left: 20px;
}
.app_nav .content ul li a:hover {
  color: #007be7;
}
.home.wechat {
  position: fixed;
  top: 60%;
  right: 0;
  z-index: 1000;
  cursor: pointer;
}
.layout-copy{
  text-align: center;
  padding: 10px 0 20px;
  color: #9ea7b4;
}
</style>
