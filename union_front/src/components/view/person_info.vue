// 个人中心->个人资料
<template>
  <div class="person_info">
    <Spin size="large" fix v-if="spinShow"></Spin>
    <h3>个人资料</h3>
    <div class="content">
      <ul>
        <li>
          <span>头像：</span>
          <img
            :src="'../../static/avatar_'+user.avatar+'.png'"
            alt="头像"
            class="avatar"
            @click="showBigAvatar=true"
          />
        </li>
        <li>
          <span>学号：</span>
          {{user.sno}}
        </li>
        <li>
          <span>姓名：</span>
          {{user.username}}
        </li>
        <li>
          <span>性别：</span>
          {{user.sex?"女":"男"}}
        </li>
        <li>
          <span>手机号：</span>
          {{user.phone||"您还没有设置手机号哦~"}}
        </li>
        <li>
          <span>邮箱账号：</span>
          {{user.email||"您还没有设置邮箱账号哦~"}}
        </li>
        <li>
          <span>个人简介：</span>
          {{user.introduce||"该用户很懒，什么也没留下~"}}
        </li>
        <li>
          <span>创建时间：</span>
          {{user.createTime}}
        </li>
      </ul>
    </div>
    <div style="text-align:center;" class="mt20">
      <router-link to="/manage" v-if="user.isManager==2" class="go_manage">进入管理页</router-link>
      <Button type="error" @click="showWarning=true">退出登录</Button>
    </div>
    <!-- 点击放大图片 -->
    <Modal v-model="showBigAvatar" width="400">
      <div slot="header"></div>
      <img :src="'../../static/avatar_'+user.avatar+'.png'" alt="头像" />
      <div slot="footer"></div>
    </Modal>
    <!-- 退出登录提示框 -->
    <Modal v-model="showWarning" @on-cancel="showWarning=false" @on-ok="logout" title="操作提醒">
      <h3>你确定要退出登录吗？</h3>
    </Modal>
  </div>
</template>
<script>
import StudentService from "../../assets/js/student.js";
import LoginService from "../../assets/js/login.js";
export default {
  name: "person_info",
  data() {
    return {
      user: {}, //用户信息
      showBigAvatar: false, //显示大图头像
      showWarning: false, //退出登录提示
      spinShow: false
    };
  },
  methods: {
    // 获取用户信息
    getUserInfo() {
      let vm = this;
      vm.spinShow = true;
      LoginService.getLoginUserInfo().then(res => {
        if (res.code == 0) {
          vm.user = res.data;
        } else {
          vm.$Message.error(res.msg);
        }
        vm.spinShow = false;
      });
    },
    // 退出登录
    logout() {
      let vm = this;
      LoginService.logout().then(res => {
        if (res.code == 0) {
          vm.$store.store.commit("deleteToken"); //把删除token
          vm.$router.push("/index");
          location.reload();
        } else {
          vm.$Message.error(res.msg);
        }
      });
    }
  },
  created() {
    this.getUserInfo();
  }
};
</script>
<style lang="scss">
// 标题
.person_info h3 {
  text-align: center;
}
// 个人信息主体
.person_info .content {
  margin-top: 10px;
  border: 1px solid #ddd;
  padding: 20px;
  font-size: 18px;
}
// 个人资料 列表项
.person_info .content li {
  line-height: 30px;
}
.person_info .content li span {
  display: inline-block;
  width: 100px;
}
.person_info .content li .avatar {
  width: 50px;
  height: 50px;
  border: 1px solid $base_color;
  border-radius: 50%;
  cursor: pointer;
}
.person_info .go_manage {
  display: inline-block;
  background-color: $base_color;
  color: white;
  height: 32px;
  margin-bottom: 0;
  font-weight: 400;
  text-align: center;
  vertical-align: middle;
  touch-action: auto;
  cursor: pointer;
  padding: 5px;
  border-radius: 4px;
}
</style>